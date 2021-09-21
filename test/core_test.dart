import 'package:paypal_sdk/core.dart';
import 'package:paypal_sdk/src/core/exception/api_exception.dart';
import 'package:test/test.dart';

import 'test_environment.dart';

void main() {
  test('Test http client authorize', () async {
    var paypalEnvironment = PayPalEnvironment.sandbox(
        clientId: clientId, clientSecret: clientSecret);
    var paypalHttpClient = PayPalHttpClient(paypalEnvironment);

    await paypalHttpClient.authorize();
    expect(paypalHttpClient.accessToken!.accessToken.isNotEmpty, true);
  });

  test('Test http client authorize - incorrect credentials', () async {
    var paypalEnvironment = PayPalEnvironment.sandbox(
        clientId: clientId, clientSecret: 'incorrect_secret');
    var paypalHttpClient = PayPalHttpClient(paypalEnvironment);

    try {
      await paypalHttpClient.authorize();
    } on ApiException catch (e) {
      expect(e.error, 'invalid_client');
    }

    expect(paypalHttpClient.accessToken == null, true);
  });
}
