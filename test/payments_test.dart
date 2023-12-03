import 'dart:io';

import 'package:http/http.dart';
import 'package:flutter_paypal_sdk/core.dart';
import 'package:flutter_paypal_sdk/payments.dart';
import 'package:flutter_paypal_sdk/src/payments/model/refund.dart';
import 'package:test/test.dart';

import 'helper/mock_http_client.dart';
import 'helper/util.dart';

void main() {
  late PaymentsApi paymentsApi;

  setUp(() {
    var mockHttpClient = MockHttpClient(MockHttpClientHandler());

    mockHttpClient.addHandler('/v2/payments/authorizations/0VF52814937998046', 'GET',
        (request) async {
      var json = await getJson('payments/authorized_payment_details.json');
      return Response(json, HttpStatus.ok);
    });

    mockHttpClient.addHandler('/v2/payments/authorizations/0VF52814937998046/capture', 'POST',
        (request) async {
      var json = await getJson('payments/capture.json');
      return Response(json, HttpStatus.created);
    });

    mockHttpClient.addHandler('/v2/payments/authorizations/0VF52814937998046/reauthorize', 'POST',
        (request) async {
      var json = await getJson('payments/reauthorize_payment.json');
      return Response(json, HttpStatus.created);
    });

    mockHttpClient.addHandler('/v2/payments/authorizations/0VF52814937998046/void', 'POST',
        (request) async {
      return Response('', HttpStatus.noContent);
    });

    mockHttpClient.addHandler('/v2/payments/captures/2GG279541U471931P', 'GET', (request) async {
      var json = await getJson('payments/show_captured_payment_details.json');
      return Response(json, HttpStatus.ok);
    });

    mockHttpClient.addHandler('/v2/payments/captures/2GG279541U471931P/refund', 'POST',
        (request) async {
      var json = await getJson('payments/refund.json');
      return Response(json, HttpStatus.created);
    });

    mockHttpClient.addHandler('/v2/payments/refunds/1JU08902781691411', 'GET', (request) async {
      var json = await getJson('payments/refund.json');
      return Response(json, HttpStatus.ok);
    });

    var paypalEnvironment =
        PayPalEnvironment.sandbox(clientId: 'clientId', clientSecret: 'clientSecret');
    paymentsApi = PaymentsApi(PayPalHttpClient(paypalEnvironment, client: mockHttpClient));
  });

  test('Test show details for authorized payment', () async {
    var details = await paymentsApi.showDetailsForAuthorizedPayment('0VF52814937998046');

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

    var capture = await paymentsApi.captureAuthorizedPayment('0VF52814937998046', request);

    expect(capture.status, CaptureStatus.completed);
  });

  test('Test reauthorize payment', () async {
    var amount = Money(currencyCode: 'USD', value: "10.99");

    var details = await paymentsApi.reauthorizeAuthorizedPayment('0VF52814937998046', amount);

    expect(details.status, AuthorizationStatus.created);
  });

  test('Test void payment', () async {
    try {
      await paymentsApi.voidAuthorizedPayment('0VF52814937998046');
      expect(true, true);
    } catch (e) {
      expect(true, false);
    }
  });

  test('Test show captured payment details', () async {
    var capture = await paymentsApi.showCapturedPaymentDetails('2GG279541U471931P');
    expect(capture.status, CaptureStatus.completed);
  });

  test('Test refund captured payment', () async {
    var request = RefundRequest(
      amount: Money(currencyCode: 'USD', value: '10.99'),
      invoiceId: 'INVOICE-123',
      noteToPayer: 'Defective product',
    );

    var refund = await paymentsApi.refundCapturedPayment('2GG279541U471931P', request);
    expect(refund.status, RefundStatus.completed);
  });

  test('Test show refund details', () async {
    var refund = await paymentsApi.showRefundDetails('1JU08902781691411');
    expect(refund.status, RefundStatus.completed);
  });
}
