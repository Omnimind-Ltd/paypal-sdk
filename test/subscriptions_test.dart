import 'dart:io';

import 'package:http/http.dart';
import 'package:paypal_sdk/core.dart';
import 'package:paypal_sdk/src/subscriptions/model/billing_cycle.dart';
import 'package:paypal_sdk/src/subscriptions/model/frequency.dart';
import 'package:paypal_sdk/src/subscriptions/model/payment_preferences.dart';
import 'package:paypal_sdk/src/subscriptions/model/plan_collection.dart';
import 'package:paypal_sdk/src/subscriptions/subscriptions_api.dart';
import 'package:paypal_sdk/subscriptions.dart';
import 'package:test/test.dart';

import 'mock_http_client.dart';

void main() {
  late final PayPalHttpClient _payPalHttpClient;

  setUp(() {
    var mockHttpClient = MockHttpClient(MockHttpClientHandler());
    mockHttpClient.addHandler(
        '/v1/billing/plans',
        'GET',
        (request) async => Response(
            '{"plans":[{"id":"P-2M115208E3051582AMFFP4UQ","name":"Test plan","st'
            'atus":"ACTIVE","usage_type":"LICENSED","create_time":"2021-09-22T09'
            ':58:42Z","links":[{"href":"https://api.sandbox.paypal.com/v1/billin'
            'g/plans/P-2M115208E3051582AMFFP4UQ","rel":"self","method":"GET","en'
            'cType":"application/json"}]}],"links":[{"href":"https://api.sandbox'
            '.paypal.com/v1/billing/plans?page_size=10&page=1","rel":"self","met'
            'hod":"GET","encType":"application/json"}]}',
            HttpStatus.ok));

    mockHttpClient.addHandler(
        '/v1/billing/plans',
        'POST',
        (request) async => Response(
            '{"id":"P-2M115208E3051582AMFFP4UQ","name":"Test plan","status":"ACT'
            'IVE","usage_type":"LICENSED","create_time":"2021-09-22T09:58:42Z","'
            'links":[{"href":"https://api.sandbox.paypal.com/v1/billing/plans/P-'
            '2M115208E3051582AMFFP4UQ","rel":"self","method":"GET","encType":"ap'
            'plication/json"}]}',
            HttpStatus.ok));

    var paypalEnvironment = PayPalEnvironment.sandbox(
        clientId: 'clientId', clientSecret: 'clientSecret');
    _payPalHttpClient =
        PayPalHttpClient(paypalEnvironment, client: mockHttpClient);
  });

  // setUp(() => {
  //       _payPalHttpClient = PayPalHttpClient(
  //         PayPalEnvironment.sandbox(
  //           clientId: clientId,
  //           clientSecret: clientSecret,
  //         ),
  //         loggingEnabled: true,
  //       )
  //     });

  test('Test list plans', () async {
    var subscriptionsApi = SubscriptionsApi(_payPalHttpClient);
    var planCollection = await subscriptionsApi.listPlans();
    expect(planCollection is PlanCollection, true);
    expect(planCollection.plans.length, 1);
  });

  test('Test create plan', () async {
    var subscriptionsApi = SubscriptionsApi(_payPalHttpClient);
    var billingPlan = await subscriptionsApi.createPlan(
        productId: 'PROD-41223692GT225981R',
        name: 'Test plan',
        billingCycles: [
          BillingCycle(
              pricingScheme: PricingScheme(
                fixedPrice: Money(currencyCode: 'GBP', value: '5'),
              ),
              frequency: Frequency(
                intervalUnit: Frequency.intervalMonth,
                intervalCount: 1,
              ),
              tenureType: BillingCycle.tenureTypeRegular,
              sequence: 1)
        ],
        paymentPreferences: PaymentPreferences(
            autoBillOutstanding: true,
            setupFee: Money(currencyCode: 'GBP', value: '1.00'),
            setupFeeFailureAction:
                PaymentPreferences.setupFeeFailureActionCancel,
            paymentFailureThreshold: 2));

    expect(billingPlan is BillingPlan, true);
    expect(billingPlan.name, 'Test plan');
  });
}
