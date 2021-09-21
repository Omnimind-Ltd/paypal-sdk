import 'package:paypal_sdk/core.dart';
import 'package:paypal_sdk/src/subscriptions/model/billing_cycle.dart';
import 'package:paypal_sdk/src/subscriptions/model/frequency.dart';
import 'package:paypal_sdk/src/subscriptions/model/payment_preferences.dart';
import 'package:paypal_sdk/src/subscriptions/model/plan_collection.dart';
import 'package:paypal_sdk/src/subscriptions/subscriptions_api.dart';
import 'package:paypal_sdk/subscriptions.dart';
import 'package:test/test.dart';

import 'test_environment.dart';

void main() {
  late final PayPalHttpClient _payPalHttpClient;

  setUp(() => {
        _payPalHttpClient = PayPalHttpClient(
          PayPalEnvironment.sandbox(
            clientId: clientId,
            clientSecret: clientSecret,
          ),
        )
      });

  test('Test list plans', () async {
    var subscriptionsApi = SubscriptionsApi(_payPalHttpClient);
    var planCollection = await subscriptionsApi.listPlans();
    expect(planCollection is PlanCollection, true);
  });

  test('Test create plan', () async {
    var subscriptionsApi = SubscriptionsApi(_payPalHttpClient);
    var billingPlan = await subscriptionsApi.createPlan(
        productId: 'testprodid',
        name: 'test plan',
        billingCycles: [
          BillingCycle(
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
  });
}
