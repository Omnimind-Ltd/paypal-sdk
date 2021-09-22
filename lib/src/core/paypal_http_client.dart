import 'dart:async';
import 'dart:convert';
import 'dart:html' if (dart.library.io) 'dart:io';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:paypal_sdk/src/core/exception/api_exception.dart';
import 'package:paypal_sdk/src/core/model/api_error.dart';
import 'package:paypal_sdk/src/core/model/authorization_error.dart';

import 'model/access_token.dart';
import 'paypal_environment.dart';

class PayPalHttpClient extends http.BaseClient {
  final log = Logger('PayPalSDK');

  late final http.Client _inner;

  final String userAgent = 'PayPalSDK/Dart-SDK';

  final StreamController<AccessToken> accessTokenUpdatedStream =
      StreamController<AccessToken>.broadcast();

  final PayPalEnvironment paypalEnvironment;

  final bool _loggingEnabled;

  AccessToken? accessToken;

  PayPalHttpClient(
    this.paypalEnvironment, {
    http.Client? client,
    AccessToken? accessToken,
    bool loggingEnabled = false,
  }) : _loggingEnabled = loggingEnabled {
    _inner = client ?? http.Client();

    if (_loggingEnabled) {
      log.onRecord.listen((record) {
        print('${record.level.name}: ${record.time}: ${record.message}');
      });
    }
  }

  Uri getUrl(String path, {Map<String, String?>? queryParameters}) {
    if (queryParameters != null) {
      for (var key in queryParameters.keys.toList(growable: false)) {
        if (queryParameters[key] == null) {
          queryParameters.remove(key);
        }
      }
    }

    return Uri.https(paypalEnvironment.host, path, queryParameters);
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['sdk_name'] = 'Dart-SDK';

    return _inner.send(request);
  }

  @override
  Future<http.Response> head(
    Uri url, {
    Map<String, String>? headers,
  }) async {
    return _makeRequest('HEAD', url, headers: headers);
  }

  @override
  Future<http.Response> get(
    Uri url, {
    Map<String, String>? headers,
  }) async {
    return _makeRequest('GET', url, headers: headers);
  }

  @override
  Future<http.Response> post(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    return _makeRequest('POST', url,
        headers: headers, body: body, encoding: encoding);
  }

  @override
  Future<http.Response> put(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    return _makeRequest('PUT', url,
        headers: headers, body: body, encoding: encoding);
  }

  @override
  Future<http.Response> patch(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    return _makeRequest('PATCH', url,
        headers: headers, body: body, encoding: encoding);
  }

  @override
  Future<http.Response> delete(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    return _makeRequest('DELETE', url,
        headers: headers, body: body, encoding: encoding);
  }

  Future<http.Response> _makeRequest(
    String method,
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
    bool retrying = false,
  }) async {
    if (accessToken?.hasExpired ?? true) {
      await authorize();
    }

    headers ??= <String, String>{};
    headers['Authorization'] = accessToken!.authorizationString();

    if (body != null) {
      headers['Content-Type'] ??= 'application/json';
    }

    if (_loggingEnabled) {
      log.info('Request: $method $url');
      log.info('Headers: $headers');
      log.info('Body: $body');
    }

    late http.Response response;

    switch (method) {
      case 'HEAD':
        response = await super.head(url, headers: headers);
        break;
      case 'GET':
        response = await super.get(url, headers: headers);
        break;
      case 'POST':
        response = await super
            .post(url, headers: headers, body: body, encoding: encoding);
        break;
      case 'PUT':
        response = await super
            .put(url, headers: headers, body: body, encoding: encoding);
        break;
      case 'PATCH':
        response = await super
            .patch(url, headers: headers, body: body, encoding: encoding);
        break;
      case 'DELETE':
        response = await super
            .delete(url, headers: headers, body: body, encoding: encoding);
        break;
    }

    if (_loggingEnabled) {
      log.info('Response: ${response.statusCode}');
      log.info('Headers: $headers');
      log.info('Body: ${response.body}');
    }

    if (response.statusCode >= HttpStatus.ok &&
        response.statusCode <= HttpStatus.noContent) {
      return response;
    } else if (response.body.isNotEmpty) {
      var apiError = ApiError.fromJson(jsonDecode(response.body));

      if (!retrying &&
          (apiError.message == 'INVALID_TOKEN' ||
              apiError.message == 'INVALID_AUTHZ_CODE')) {
        accessToken = null;
        return await _makeRequest(
          method,
          url,
          headers: headers,
          body: body,
          encoding: encoding,
          retrying: true,
        );
      }

      if (apiError.name != null) {
        throw ApiException.fromApiError(response.statusCode, apiError);
      }
    }

    throw ApiException(response.statusCode);
  }

  Future<AccessToken> authorize() async {
    var uri = Uri.https(paypalEnvironment.host, '/v1/oauth2/token');

    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': paypalEnvironment.authorizationString(),
    };

    var body = 'grant_type=client_credentials';

    if (_loggingEnabled) {
      log.info('Request: POST $uri');
      log.info('Headers: $headers');
      log.info('Body: $body');
    }

    var response = await super.post(uri, headers: headers, body: body);

    if (_loggingEnabled) {
      log.info('Response: ${response.statusCode}');
      log.info('Headers: $headers');
      log.info('Body: ${response.body}');
    }

    if (response.statusCode == HttpStatus.ok) {
      accessToken = AccessToken.fromJson(jsonDecode(response.body));
      accessToken!.expiryDateTime =
          DateTime.now().add(Duration(seconds: accessToken!.expiresIn));

      accessTokenUpdatedStream.add(accessToken!);

      return accessToken!;
    } else if (response.body.isNotEmpty) {
      var apiError = AuthorizationError.fromJson(jsonDecode(response.body));

      if (apiError.error.isNotEmpty) {
        throw ApiException(
          response.statusCode,
          error: apiError.error,
          errorDescription: apiError.errorDescription,
        );
      }
    }

    throw Exception('Error: $response');
  }
}
