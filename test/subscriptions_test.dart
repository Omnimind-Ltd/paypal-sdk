import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:paypal_sdk/core.dart';
import 'package:paypal_sdk/src/subscriptions/model/subscription.dart';
import 'package:paypal_sdk/src/subscriptions/model/transaction.dart';
import 'package:paypal_sdk/subscriptions.dart';
import 'package:test/test.dart';

import 'helper/mock_http_client.dart';
import 'helper/util.dart';

const _planStatusEnumMap = {
  PlanStatus.created: 'CREATED',
  PlanStatus.active: 'ACTIVE',
  PlanStatus.inactive: 'INACTIVE',
};

void main() {
  late SubscriptionsApi _subscriptionsApi;

  String _planDescription = 'Test description';
  PlanStatus _planStatus = PlanStatus.active;
  PricingScheme _pricingScheme = PricingScheme(
      version: 3, fixedPrice: Money(currencyCode: 'GBP', value: '5.0'));
  String _subscriptionCustomId = 'custom_id';

  setUp(() {
    var mockHttpClient = MockHttpClient(MockHttpClientHandler());
    mockHttpClient.addHandler('/v1/billing/plans', 'GET', (request) async {
      var json = await getJson('subscriptions/list_plans.json');
      return Response(json, HttpStatus.ok);
    });

    mockHttpClient.addHandler('/v1/billing/plans', 'POST', (request) async {
      var json = await getJson('subscriptions/create_plan.json');
      return Response(json, HttpStatus.created);
    });

    mockHttpClient.addHandler(
        '/v1/billing/plans/P-6KG67732XY2608640MFGL3RY', 'GET', (request) async {
      var json = await getJson('subscriptions/show_plan_details.json');

      json = json.replaceAll('Test description', _planDescription);
      json = json.replaceAll('INACTIVE', _planStatusEnumMap[_planStatus]!);
      json = json.replaceAll('5.0', _pricingScheme.fixedPrice!.value);

      return Response(
          jsonEncode(Plan.fromJson(jsonDecode(json))), HttpStatus.ok);
    });

    mockHttpClient
        .addHandler('/v1/billing/plans/P-6KG67732XY2608640MFGL3RY', 'PATCH',
            (request) async {
      var patches = jsonDecode(request.body);
      var patch = Patch.fromJson(patches.first);
      _planDescription = patch.value;
      return Response('', HttpStatus.noContent);
    });

    mockHttpClient.addHandler(
        '/v1/billing/plans/P-6KG67732XY2608640MFGL3RY/activate', 'POST',
        (request) async {
      _planStatus = PlanStatus.active;
      return Response('', HttpStatus.noContent);
    });

    mockHttpClient.addHandler(
        '/v1/billing/plans/P-6KG67732XY2608640MFGL3RY/deactivate', 'POST',
        (request) async {
      _planStatus = PlanStatus.inactive;
      return Response('', HttpStatus.noContent);
    });

    mockHttpClient.addHandler(
        '/v1/billing/plans/P-6KG67732XY2608640MFGL3RY/update-pricing-schemes',
        'POST', (request) async {
      var updateRequest =
          PricingSchemesUpdateRequest.fromJson(jsonDecode(request.body));
      _pricingScheme = updateRequest.pricingSchemes.first.pricingScheme;
      return Response('', HttpStatus.noContent);
    });

    mockHttpClient.addHandler('/v1/billing/subscriptions', 'POST',
        (request) async {
      var json = await getJson('subscriptions/create_subscription.json');
      return Response(json, HttpStatus.created);
    });

    mockHttpClient.addHandler('/v1/billing/subscriptions/I-1WSNAWATBCXP', 'GET',
        (request) async {
      var json = await getJson('subscriptions/show_subscription_details.json');
      json = json.replaceAll('subscription_custom_id', _subscriptionCustomId);
      return Response(jsonEncode(Subscription.fromJson(jsonDecode(json))),
          HttpStatus.created);
    });

    mockHttpClient.addHandler(
        '/v1/billing/subscriptions/I-1WSNAWATBCXP', 'PATCH', (request) async {
      var patches = jsonDecode(request.body);
      var patch = Patch.fromJson(patches.first);
      _subscriptionCustomId = patch.value;
      return Response('', HttpStatus.noContent);
    });

    mockHttpClient.addHandler(
        '/v1/billing/subscriptions/I-93KN27174NGR/activate',
        'POST',
        (request) async => Response('', HttpStatus.noContent));

    mockHttpClient.addHandler('/v1/billing/subscriptions/I-93KN27174NGR/cancel',
        'POST', (request) async => Response('', HttpStatus.noContent));

    mockHttpClient
        .addHandler('/v1/billing/subscriptions/I-1WSNAWATBCXP/capture', 'POST',
            (request) async {
      var response = Transaction(
          status: CaptureStatus.completed,
          id: 'id',
          payerEmail: 'email@email.com',
          time: '2021-09-23T13:07:55Z');
      return Response(jsonEncode(response.toJson()), HttpStatus.accepted);
    });

    mockHttpClient
        .addHandler('/v1/billing/subscriptions/I-1WSNAWATBCXP/revise', 'POST',
            (request) async {
      var json = await getJson('subscriptions/revise_subscription.json');
      return Response(json, HttpStatus.ok);
    });

    mockHttpClient.addHandler(
        '/v1/billing/subscriptions/I-1WSNAWATBCXP/suspend',
        'POST',
        (request) async => Response('', HttpStatus.noContent));

    mockHttpClient.addHandler(
        '/v1/billing/subscriptions/I-1WSNAWATBCXP/transactions', 'GET',
        (request) async {
      var json = await getJson('subscriptions/list_transactions.json');
      return Response(json, HttpStatus.ok);
    });

    var paypalEnvironment = PayPalEnvironment.sandbox(
        clientId: 'clientId', clientSecret: 'clientSecret');
    _subscriptionsApi = SubscriptionsApi(
        PayPalHttpClient(paypalEnvironment, client: mockHttpClient));

    // _subscriptionsApi = SubscriptionsApi(
    //     PayPalHttpClient(paypalEnvironment, loggingEnabled: true));
  });

  setUp(() {});

  // Plan tests
  test('Test list plans', () async {
    var planCollection = await _subscriptionsApi.listPlans();
    expect(planCollection is PlanCollection, true);
    expect(planCollection.plans.length, 1);
  });

  test('Test create plan', () async {
    var planRequest = PlanRequest(
        productId: 'PROD-3XF87627UU805523Y',
        name: 'Test plan',
        billingCycles: [
          BillingCycle(
              pricingScheme: PricingScheme(
                fixedPrice: Money(currencyCode: 'GBP', value: '5'),
              ),
              frequency: Frequency(
                intervalUnit: IntervalUnit.month,
                intervalCount: 1,
              ),
              tenureType: TenureType.regular,
              sequence: 1)
        ],
        paymentPreferences: PaymentPreferences(
            autoBillOutstanding: true,
            setupFee: Money(currencyCode: 'GBP', value: '1.00'),
            setupFeeFailureAction: SetupFeeFailureAction.cancel,
            paymentFailureThreshold: 2));
    var billingPlan = await _subscriptionsApi.createPlan(planRequest);

    expect(billingPlan is Plan, true);
    expect(billingPlan.name, 'Test plan');
  });

  test('Test update plan', () async {
    var billingPlan =
        await _subscriptionsApi.showPlanDetails('P-6KG67732XY2608640MFGL3RY');
    expect(billingPlan.description, 'Test description');

    await _subscriptionsApi.updatePlan('P-6KG67732XY2608640MFGL3RY', [
      Patch(
          op: PatchOperation.replace,
          path: '/description',
          value: 'Test description updated')
    ]);

    billingPlan =
        await _subscriptionsApi.showPlanDetails('P-6KG67732XY2608640MFGL3RY');
    expect(billingPlan.description, 'Test description updated');

    await _subscriptionsApi.updatePlan('P-6KG67732XY2608640MFGL3RY', [
      Patch(
          op: PatchOperation.replace,
          path: '/description',
          value: 'Test description')
    ]);
  });

  test('Test show plan details', () async {
    var billingPlan =
        await _subscriptionsApi.showPlanDetails('P-6KG67732XY2608640MFGL3RY');
    expect(billingPlan.name, 'Test plan');
  });

  test('Test deactivate/activate plan', () async {
    var billingPlan =
        await _subscriptionsApi.showPlanDetails('P-6KG67732XY2608640MFGL3RY');
    expect(billingPlan.status, PlanStatus.active);

    await _subscriptionsApi.deactivatePlan('P-6KG67732XY2608640MFGL3RY');

    billingPlan =
        await _subscriptionsApi.showPlanDetails('P-6KG67732XY2608640MFGL3RY');
    expect(billingPlan.status, PlanStatus.inactive);

    await _subscriptionsApi.activatePlan('P-6KG67732XY2608640MFGL3RY');

    billingPlan =
        await _subscriptionsApi.showPlanDetails('P-6KG67732XY2608640MFGL3RY');
    expect(billingPlan.status, PlanStatus.active);
  });

  test('Test update pricing schemas', () async {
    var billingPlan =
        await _subscriptionsApi.showPlanDetails('P-6KG67732XY2608640MFGL3RY');
    var pricingSchema = billingPlan.billingCycles?.first.pricingScheme;
    expect(pricingSchema?.fixedPrice?.value, '5.0');
    expect(pricingSchema?.fixedPrice?.currencyCode, 'GBP');

    await _subscriptionsApi.updatePlanPricing(
        'P-6KG67732XY2608640MFGL3RY',
        PricingSchemesUpdateRequest([
          PricingSchemeUpdateRequest(
              billingCycleSequence: 1,
              pricingScheme: PricingScheme(
                fixedPrice: Money(currencyCode: 'GBP', value: '10.0'),
              ))
        ]));

    billingPlan =
        await _subscriptionsApi.showPlanDetails('P-6KG67732XY2608640MFGL3RY');
    pricingSchema = billingPlan.billingCycles?.first.pricingScheme;
    expect(pricingSchema?.fixedPrice?.value, '10.0');
    expect(pricingSchema?.fixedPrice?.currencyCode, 'GBP');

    await _subscriptionsApi.updatePlanPricing(
        'P-6KG67732XY2608640MFGL3RY',
        PricingSchemesUpdateRequest([
          PricingSchemeUpdateRequest(
              billingCycleSequence: 1,
              pricingScheme: PricingScheme(
                fixedPrice: Money(currencyCode: 'GBP', value: '5.0'),
              ))
        ]));

    billingPlan =
        await _subscriptionsApi.showPlanDetails('P-6KG67732XY2608640MFGL3RY');
    pricingSchema = billingPlan.billingCycles?.first.pricingScheme;
    expect(pricingSchema?.fixedPrice?.value, '5.0');
    expect(pricingSchema?.fixedPrice?.currencyCode, 'GBP');
  });

  // Subscription tests
  test('Test create subscription', () async {
    var createSubscriptionRequest = SubscriptionRequest(
        planId: 'P-6KG67732XY2608640MFGL3RY', customId: 'custom_id');
    var subscription =
        await _subscriptionsApi.createSubscription(createSubscriptionRequest);

    expect(subscription is Subscription, true);
  });

  test('Test update subscription', () async {
    var subscription =
        await _subscriptionsApi.showSubscriptionDetails('I-1WSNAWATBCXP');
    expect(subscription.customId, 'custom_id');

    await _subscriptionsApi.updateSubscription('I-1WSNAWATBCXP', [
      Patch(
          op: PatchOperation.add,
          path: '/custom_id',
          value: 'updated_custom_id')
    ]);

    subscription =
        await _subscriptionsApi.showSubscriptionDetails('I-1WSNAWATBCXP');
    expect(subscription.customId, 'updated_custom_id');

    await _subscriptionsApi.updateSubscription('I-1WSNAWATBCXP', [
      Patch(op: PatchOperation.add, path: '/custom_id', value: 'custom_id')
    ]);
  });

  test('Test show subscription details', () async {
    var subscription =
        await _subscriptionsApi.showSubscriptionDetails('I-1WSNAWATBCXP');

    expect(subscription is Subscription, true);
    expect(subscription.id, 'I-1WSNAWATBCXP');
  });

  test('Test activate subscription', () async {
    await _subscriptionsApi.activateSubscription(
        'I-93KN27174NGR', 'Now required');
  });

  test('Test cancel subscription', () async {
    await _subscriptionsApi.cancelSubscription(
        'I-93KN27174NGR', 'No longer needed');
  });

  test('Test capture authorized payment on subscription', () async {
    var request = SubscriptionCaptureRequest(
        note: 'Outstanding balance',
        amount: Money(currencyCode: 'GBP', value: '5.00'));

    var response = await _subscriptionsApi
        .captureAuthorizedPaymentOnSubscription('I-1WSNAWATBCXP', request);
    expect(response.status, CaptureStatus.completed);
  });

  test('Test revise subscription', () async {
    var request = SubscriptionReviseRequest(
        planId: 'P-9DR273747C8107746MFGHYKY',
        shippingAmount: Money(currencyCode: 'USD', value: '2.0'));

    var response =
        await _subscriptionsApi.reviseSubscription('I-1WSNAWATBCXP', request);
    expect(response.shippingAmount!.value, '2.0');
  });

  test('Test suspend subscription', () async {
    var request = Reason('Out of stock');

    await _subscriptionsApi.suspendSubscription('I-1WSNAWATBCXP', request);
  });

  test('Test list transactions', () async {
    var response = await _subscriptionsApi.listTransactions('I-1WSNAWATBCXP',
        '2021-09-01T07:50:20.940Z', '2021-09-29T07:50:20.940Z');

    expect(response is TransactionsList, true);
    expect(response.transactions.isNotEmpty, true);
  });
}
