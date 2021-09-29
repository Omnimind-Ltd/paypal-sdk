import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:paypal_sdk/core.dart';
import 'package:paypal_sdk/src/subscriptions/model/subscription.dart';
import 'package:paypal_sdk/src/subscriptions/model/transaction.dart';
import 'package:paypal_sdk/subscriptions.dart';
import 'package:test/test.dart';

import 'helper/mock_http_client.dart';

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
    mockHttpClient.addHandler(
        '/v1/billing/plans',
        'GET',
        (request) async => Response(
            '{"plans":[{"id":"P-6KG67732XY2608640MFGL3RY","product_id":"PROD-3XF'
            '87627UU805523Y","name":"Test plan","status":"ACTIVE","usage_type":"'
            'LICENSED","create_time":"2021-09-22T09:58:42Z","links":[{"href":"ht'
            'tps://api.sandbox.paypal.com/v1/billing/plans/P-6KG67732XY2608640MF'
            'GL3RY","rel":"self","method":"GET","encType":"application/json"}]}]'
            ',"links":[{"href":"https://api.sandbox.paypal.com/v1/billing/plans?'
            'page_size=10&page=1","rel":"self","method":"GET","encType":"applica'
            'tion/json"}]}',
            HttpStatus.ok));

    mockHttpClient.addHandler(
        '/v1/billing/plans',
        'POST',
        (request) async => Response(
            '{"id":"P-6KG67732XY2608640MFGL3RY","product_id":"PROD-41223692GT225'
            '981R","name":"Test plan","status":"ACTIVE","usage_type":"LICENSED",'
            '"billing_cycles":[{"pricing_scheme":{"version":1,"fixed_price":{"cu'
            'rrency_code":"GBP","value":"5.0"},"create_time":"2021-09-22T09:58:4'
            '2Z","update_time":"2021-09-22T09:58:42Z"},"frequency":{"interval_un'
            'it":"MONTH","interval_count":1},"tenure_type":"REGULAR","sequence":'
            '1,"total_cycles":1}],"payment_preferences":{"service_type":"PREPAID'
            '","auto_bill_outstanding":true,"setup_fee":{"currency_code":"GBP","'
            'value":"1.0"},"setup_fee_failure_action":"CANCEL","payment_failure_'
            'threshold":2},"quantity_supported":false,"create_time":"2021-09-22T'
            '09:58:42Z","update_time":"2021-09-22T09:58:42Z","links":[{"href":"h'
            'ttps://api.sandbox.paypal.com/v1/billing/plans/P-2M115208E3051582AM'
            'FFP4UQ","rel":"self","method":"GET","encType":"application/json"},{'
            '"href":"https://api.sandbox.paypal.com/v1/billing/plans/P-2M115208E'
            '3051582AMFFP4UQ","rel":"edit","method":"PATCH","encType":"applicati'
            'on/json"},{"href":"https://api.sandbox.paypal.com/v1/billing/plans/'
            'P-6KG67732XY2608640MFGL3RY/deactivate","rel":"self","method":"POST"'
            ',"encType":"application/json"}]}',
            HttpStatus.created));

    mockHttpClient.addHandler(
        '/v1/billing/plans/P-6KG67732XY2608640MFGL3RY', 'GET', (request) async {
      var pricingScheme = jsonEncode(_pricingScheme.toJson());
      return Response(
          '{"id":"P-6KG67732XY2608640MFGL3RY","product_id":"PROD-41223692GT22598'
          '1R","name":"Test plan","description":"$_planDescription","status":"'
          '${_planStatusEnumMap[_planStatus]}","usage_type":"LICENSED","billing_cycles":[{"pricing_sch'
          'eme":$pricingScheme,"frequency":{"interval_unit":"MONTH","interval_co'
          'unt":1},"tenure_type":"REGULAR","sequence":1,"total_cycles":1}],"paym'
          'ent_preferences":{"service_type":"PREPAID","auto_bill_outstanding":tr'
          'ue,"setup_fee":{"currency_code":"GBP","value":"1.0"},"setup_fee_failu'
          're_action":"CANCEL","payment_failure_threshold":2},"quantity_supporte'
          'd":false,"create_time":"2021-09-22T09:58:42Z","update_time":"2021-09-'
          '22T09:58:42Z","links":[{"href":"https://api.sandbox.paypal.com/v1/bil'
          'ling/plans/P-6KG67732XY2608640MFGL3RY","rel":"self","method":"GET","e'
          'ncType":"application/json"},{"href":"https://api.sandbox.paypal.com/v'
          '1/billing/plans/P-6KG67732XY2608640MFGL3RY","rel":"edit","method":"PA'
          'TCH","encType":"application/json"},{"href":"https://api.sandbox.paypa'
          'l.com/v1/billing/plans/P-6KG67732XY2608640MFGL3RY/deactivate","rel":"'
          'self","method":"POST","encType":"application/json"}]}',
          HttpStatus.ok);
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

    mockHttpClient.addHandler(
        '/v1/billing/subscriptions',
        'POST',
        (request) async => Response(
            '{"status":"APPROVAL_PENDING","id":"I-1WSNAWATBCXP","create_time":"2'
            '021-09-28T17:31:33Z","links":[{"href":"https://www.sandbox.paypal.c'
            'om/webapps/billing/subscriptions?ba_token=BA-48M64319W7655191V","re'
            'l":"approve","method":"GET"},{"href":"https://api.sandbox.paypal.co'
            'm/v1/billing/subscriptions/I-1WSNAWATBCXP","rel":"edit","method":"P'
            'ATCH"},{"href":"https://api.sandbox.paypal.com/v1/billing/subscript'
            'ions/I-1WSNAWATBCXP","rel":"self","method":"GET"}],"custom_id":"cus'
            'tom_id"}',
            HttpStatus.created));

    mockHttpClient.addHandler(
        '/v1/billing/subscriptions/I-1WSNAWATBCXP',
        'GET',
        (request) async => Response(
            '{"status":"APPROVAL_PENDING","id":"I-1WSNAWATBCXP","create_time":"2'
            '021-09-28T17:31:33Z","links":[{"href":"https://www.sandbox.paypal.c'
            'om/webapps/billing/subscriptions?ba_token=BA-48M64319W7655191V","re'
            'l":"approve","method":"GET"},{"href":"https://api.sandbox.paypal.co'
            'm/v1/billing/subscriptions/I-1WSNAWATBCXP","rel":"edit","method":"P'
            'ATCH"},{"href":"https://api.sandbox.paypal.com/v1/billing/subscript'
            'ions/I-1WSNAWATBCXP","rel":"self","method":"GET"}],"custom_id":"'
            '$_subscriptionCustomId"}',
            HttpStatus.ok));

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

    mockHttpClient.addHandler(
        '/v1/billing/subscriptions/I-1WSNAWATBCXP/revise',
        'POST',
        (request) async => Response(
            '{"plan_id":"P-9DR273747C8107746MFGHYKY","shipping_amount":{"currenc'
            'y_code":"USD","value":"2.0"},"plan_overridden":false,"links":[{"hre'
            'f":"https://www.sandbox.paypal.com/webapps/billing/subscriptions/up'
            'date?ba_token=BA-5W858231P24644150","rel":"approve","method":"GET"}'
            ',{"href":"https://api.sandbox.paypal.com/v1/billing/subscriptions/I'
            '-1WSNAWATBCXP","rel":"edit","method":"PATCH"},{"href":"https://api.'
            'sandbox.paypal.com/v1/billing/subscriptions/I-1WSNAWATBCXP","rel":"'
            'self","method":"GET"},{"href":"https://api.sandbox.paypal.com/v1/bi'
            'lling/subscriptions/I-1WSNAWATBCXP/cancel","rel":"cancel","method":'
            '"POST"},{"href":"https://api.sandbox.paypal.com/v1/billing/subscrip'
            'tions/I-1WSNAWATBCXP/suspend","rel":"suspend","method":"POST"},{"hr'
            'ef":"https://api.sandbox.paypal.com/v1/billing/subscriptions/I-1WSN'
            'AWATBCXP/capture","rel":"capture","method":"POST"}]}',
            HttpStatus.ok));

    mockHttpClient.addHandler(
        '/v1/billing/subscriptions/I-1WSNAWATBCXP/suspend',
        'POST',
        (request) async => Response('', HttpStatus.noContent));

    mockHttpClient.addHandler(
        '/v1/billing/subscriptions/I-1WSNAWATBCXP/transactions',
        'GET',
        (request) async => Response(
            '{"transactions":[{"status":"COMPLETED","id":"8PC82346NG592983M","am'
            'ount_with_breakdown":{"gross_amount":{"currency_code":"USD","value"'
            ':"3.00"},"fee_amount":{"currency_code":"USD","value":"0.40"},"net_a'
            'mount":{"currency_code":"USD","value":"2.60"}},"payer_name":{"given'
            '_name":"John","surname":"Doe"},"payer_email":"sb-p8icr7702357@perso'
            'nal.example.com","time":"2021-09-27T18:04:05.000Z"}],"links":[{"hre'
            'f":"https://api.sandbox.paypal.com/v1/billing/subscriptions/I-BA70T'
            '9G41KJP/transactions?start_time=2021-09-01T07%3A50%3A20.940Z&end_ti'
            'me=2021-09-29T07%3A50%3A20.940Z","rel":"SELF","method":"GET"}]}',
            HttpStatus.ok));

    var paypalEnvironment = PayPalEnvironment.sandbox(
        clientId: 'clientId', clientSecret: 'clientSecret');
    _subscriptionsApi = SubscriptionsApi(
        PayPalHttpClient(paypalEnvironment, client: mockHttpClient));
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
