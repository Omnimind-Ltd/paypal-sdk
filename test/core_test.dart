import 'package:flutter_paypal_sdk/core.dart';
import 'package:test/test.dart';

import 'helper/mock_http_client.dart';

void main() {
  test('Test http client authorize', () async {
    var paypalEnvironment =
        PayPalEnvironment.sandbox(clientId: 'clientId', clientSecret: 'clientSecret');
    var paypalHttpClient =
        PayPalHttpClient(paypalEnvironment, client: MockHttpClient(MockHttpClientHandler()));

    await paypalHttpClient.authorize();
    expect(paypalHttpClient.accessToken!.accessToken.isNotEmpty, true);
  });

  test('Test http client authorize - incorrect credentials', () async {
    var paypalEnvironment =
        PayPalEnvironment.sandbox(clientId: 'clientId', clientSecret: 'incorrect_secret');
    var paypalHttpClient =
        PayPalHttpClient(paypalEnvironment, client: MockHttpClient(MockHttpClientHandler()));

    try {
      await paypalHttpClient.authorize();
    } on ApiException catch (e) {
      expect(e.error, 'invalid_client');
    }

    expect(paypalHttpClient.accessToken == null, true);
  });
}
