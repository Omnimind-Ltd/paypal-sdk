import 'dart:io';

import 'package:http/http.dart';
import 'package:paypal_sdk/core.dart';
import 'package:paypal_sdk/payments.dart';
import 'package:test/test.dart';

import 'helper/mock_http_client.dart';
import 'helper/util.dart';

void main() {
  late PaymentsApi _paymentsApi;

  setUp(() {
    var mockHttpClient = MockHttpClient(MockHttpClientHandler());

    mockHttpClient
        .addHandler('/v2/payments/authorizations/0VF52814937998046', 'GET',
            (request) async {
      var json = await getJson('payments/authorized_payment_details.json');
      return Response(json, HttpStatus.ok);
    });

    mockHttpClient.addHandler(
        '/v2/payments/authorizations/0VF52814937998046/capture', 'POST',
        (request) async {
      var json = await getJson('payments/capture.json');
      return Response(json, HttpStatus.created);
    });

    mockHttpClient.addHandler(
        '/v2/payments/authorizations/0VF52814937998046/reauthorize', 'POST',
        (request) async {
      var json = await getJson('payments/reauthorize_payment.json');
      return Response(json, HttpStatus.created);
    });

    mockHttpClient.addHandler(
        '/v2/payments/authorizations/0VF52814937998046/void', 'POST',
        (request) async {
      return Response('', HttpStatus.noContent);
    });

    var paypalEnvironment = PayPalEnvironment.sandbox(
        clientId: 'clientId', clientSecret: 'clientSecret');
    _paymentsApi = PaymentsApi(
        PayPalHttpClient(paypalEnvironment, client: mockHttpClient));
  });

  test('Test show details for authorized payment', () async {
    var details =
        await _paymentsApi.showDetailsForAuthorizedPayment('0VF52814937998046');

    expect(details.id, '0VF52814937998046');
  });

  test('Test capture authorized payment', () async {
    var request = CaptureRequest(
      amount: Money(currencyCode: 'USD', value: "10.99"),
      invoiceId: 'INVOICE-123',
      finalCapture: true,
      noteToPayer:
          'If the ordered color is not available, we will substitute with a different color free of charge.',
      softDescriptor: 'Bob\'s Custom Sweaters',
    );

    var capture = await _paymentsApi.captureAuthorizedPayment(
        '0VF52814937998046', request);

    expect(capture.status, CaptureStatus.completed);
  });

  test('Test reauthorize payment', () async {
    var amount = Money(currencyCode: 'USD', value: "10.99");

    var details = await _paymentsApi.reauthorizeAuthorizedPayment(
        '0VF52814937998046', amount);

    expect(details.status, AuthorizationStatus.created);
  });

  test('Test void payment', () async {
    try {
      await _paymentsApi.voidAuthorizedPayment('0VF52814937998046');
      expect(true, true);
    } catch (e) {
      expect(true, false);
    }
  });
}
