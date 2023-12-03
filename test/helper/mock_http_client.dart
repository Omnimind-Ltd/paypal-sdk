import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:flutter_paypal_sdk/core.dart';

class MockHttpClient extends MockClient {
  final MockHttpClientHandler _mockHttpClientHandler;

  MockHttpClient(MockHttpClientHandler handler)
      : _mockHttpClientHandler = handler,
        super(handler.mockClientHandler) {
    _addAuthorizationHandlers();
  }

  void addHandler(String path, String method, MockClientHandler handler) {
    _mockHttpClientHandler.addHandler(path, method, handler);
  }

  void _addAuthorizationHandlers() {
    addHandler('/v1/oauth2/token', 'POST', (request) async {
      var authorizationString = request.headers['Authorization'];

      if (authorizationString == 'Basic Y2xpZW50SWQ6Y2xpZW50U2VjcmV0') {
        return Response(
          jsonEncode(AccessToken(
              scope: '"https://uri.paypal.com/services/invoicing '
                  'https://uri.paypal.com/services/vault/payment-tokens/read '
                  'https://uri.paypal.com/services/disputes/read-buyer '
                  'https://uri.paypal.com/services/payments/realtimepayment '
                  'https://uri.paypal.com/services/disputes/update-seller '
                  'https://uri.paypal.com/services/payments/payment/authcapture '
                  'openid https://uri.paypal.com/services/disputes/read-seller '
                  'Braintree:Vault https://uri.paypal.com/services/payments/refund '
                  'https://api.paypal.com/v1/vault/credit-card '
                  'https://api.paypal.com/v1/payments/.* '
                  'https://uri.paypal.com/payments/payouts '
                  'https://uri.paypal.com/services/vault/payment-tokens/readwrite '
                  'https://api.paypal.com/v1/vault/credit-card/.* '
                  'https://uri.paypal.com/services/subscriptions '
                  'https://uri.paypal.com/services/applications/webhooks',
              accessToken:
                  'A21AAKJXEdSoasKNozu17z9woDC0HZsazEsEWwdVszsTMrHGielbUmXmGBpGC6yXqlMNtUZAoPNaUkqn31dt4x2MiF_G2a-mA',
              tokenType: 'Bearer',
              appId: 'APP-80W284485P519543T',
              expiresIn: 32400,
              nonce: '2021-09-22T10:04:16Z70I9LDXcdu7aqfHHOwFtFTYba_NSS5IbJ3BFWr_0E4U')),
          HttpStatus.ok,
        );
      } else {
        return Response(jsonEncode(AuthorizationError('invalid_client', 'error_description')),
            HttpStatus.unauthorized);
      }
    });
  }
}

class MockHttpClientHandler {
  MockHttpClientHandler();

  final Map<String, Map<String, Function>> handlers = <String, Map<String, MockClientHandler>>{};

  void addHandler(String path, String method, MockClientHandler handler) {
    handlers[path] ??= <String, MockClientHandler>{};
    handlers[path]![method] = handler;
  }

  Future<Response> mockClientHandler(Request request) async {
    var handler = handlers[request.url.path]![request.method];

    if (handler != null) {
      return await handler(request);
    }

    throw Exception('No handler for request ${request.method} ${request.url.path}');
  }
}
