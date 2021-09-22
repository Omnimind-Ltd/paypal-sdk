import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:paypal_sdk/core.dart';
import 'package:paypal_sdk/src/core/exception/api_exception.dart';
import 'package:test/test.dart';

void main() {
  Future<Response> _mockClientHandler(Request request) async {
    if (request.method == 'POST' && request.url.path == '/v1/oauth2/token') {
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
              nonce:
                  '2021-09-22T10:04:16Z70I9LDXcdu7aqfHHOwFtFTYba_NSS5IbJ3BFWr_0E4U')),
          HttpStatus.ok,
        );
      } else {
        return Response(
            jsonEncode(
                AuthorizationError('invalid_client', 'error_description')),
            HttpStatus.unauthorized);
      }
    }

    throw Exception('Unexpected request $request');
  }

  test('Test http client authorize', () async {
    var paypalEnvironment = PayPalEnvironment.sandbox(
        clientId: 'clientId', clientSecret: 'clientSecret');
    var paypalHttpClient = PayPalHttpClient(paypalEnvironment,
        client: MockClient(_mockClientHandler));

    await paypalHttpClient.authorize();
    expect(paypalHttpClient.accessToken!.accessToken.isNotEmpty, true);
  });

  test('Test http client authorize - incorrect credentials', () async {
    var paypalEnvironment = PayPalEnvironment.sandbox(
        clientId: 'clientId', clientSecret: 'incorrect_secret');
    var paypalHttpClient = PayPalHttpClient(paypalEnvironment,
        client: MockClient(_mockClientHandler));

    try {
      await paypalHttpClient.authorize();
    } on ApiException catch (e) {
      expect(e.error, 'invalid_client');
    }

    expect(paypalHttpClient.accessToken == null, true);
  });
}
