import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:paypal_sdk/core.dart';
import 'package:paypal_sdk/src/subscriptions/model/billing_cycle.dart';
import 'package:paypal_sdk/src/subscriptions/model/billing_plan.dart';
import 'package:paypal_sdk/src/subscriptions/model/frequency.dart';
import 'package:paypal_sdk/src/subscriptions/model/payment_preferences.dart';
import 'package:paypal_sdk/src/subscriptions/model/plan_collection.dart';
import 'package:paypal_sdk/src/subscriptions/subscriptions_api.dart';
import 'package:paypal_sdk/subscriptions.dart';
import 'package:test/test.dart';

import 'mock_http_client.dart';

void main() {
  late SubscriptionsApi _subscriptionsApi;

  String _planDescription = 'Test description';
  String _planStatus = BillingPlan.statusActive;
  PricingScheme _pricingScheme = PricingScheme(
      version: 3, fixedPrice: Money(currencyCode: 'GBP', value: '5.0'));

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
            '{"id":"P-2M115208E3051582AMFFP4UQ","product_id":"PROD-41223692GT225'
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
            'P-2M115208E3051582AMFFP4UQ/deactivate","rel":"self","method":"POST"'
            ',"encType":"application/json"}]}',
            HttpStatus.created));

    mockHttpClient.addHandler(
        '/v1/billing/plans/P-2M115208E3051582AMFFP4UQ', 'GET', (request) async {
      var pricingScheme = jsonEncode(_pricingScheme.toJson());
      return Response(
          '{"id":"P-2M115208E3051582AMFFP4UQ","product_id":"PROD-41223692GT22598'
          '1R","name":"Test plan","description":"$_planDescription","status":"'
          '$_planStatus","usage_type":"LICENSED","billing_cycles":[{"pricing_sch'
          'eme":$pricingScheme,"frequency":{"interval_unit":"MONTH","interval_co'
          'unt":1},"tenure_type":"REGULAR","sequence":1,"total_cycles":1}],"paym'
          'ent_preferences":{"service_type":"PREPAID","auto_bill_outstanding":tr'
          'ue,"setup_fee":{"currency_code":"GBP","value":"1.0"},"setup_fee_failu'
          're_action":"CANCEL","payment_failure_threshold":2},"quantity_supporte'
          'd":false,"create_time":"2021-09-22T09:58:42Z","update_time":"2021-09-'
          '22T09:58:42Z","links":[{"href":"https://api.sandbox.paypal.com/v1/bil'
          'ling/plans/P-2M115208E3051582AMFFP4UQ","rel":"self","method":"GET","e'
          'ncType":"application/json"},{"href":"https://api.sandbox.paypal.com/v'
          '1/billing/plans/P-2M115208E3051582AMFFP4UQ","rel":"edit","method":"PA'
          'TCH","encType":"application/json"},{"href":"https://api.sandbox.paypa'
          'l.com/v1/billing/plans/P-2M115208E3051582AMFFP4UQ/deactivate","rel":"'
          'self","method":"POST","encType":"application/json"}]}',
          HttpStatus.ok);
    });

    mockHttpClient
        .addHandler('/v1/billing/plans/P-2M115208E3051582AMFFP4UQ', 'PATCH',
            (request) async {
      var patches = jsonDecode(request.body);
      var patch = Patch.fromJson(patches.first);
      _planDescription = patch.value;
      return Response('', HttpStatus.noContent);
    });

    mockHttpClient.addHandler(
        '/v1/billing/plans/P-2M115208E3051582AMFFP4UQ/activate', 'POST',
        (request) async {
      _planStatus = BillingPlan.statusActive;
      return Response('', HttpStatus.noContent);
    });

    mockHttpClient.addHandler(
        '/v1/billing/plans/P-2M115208E3051582AMFFP4UQ/deactivate', 'POST',
        (request) async {
      _planStatus = BillingPlan.statusInactive;
      return Response('', HttpStatus.noContent);
    });

    mockHttpClient.addHandler(
        '/v1/billing/plans/P-2M115208E3051582AMFFP4UQ/update-pricing-schemes',
        'POST', (request) async {
      var updateRequest =
          PricingSchemesUpdateRequest.fromJson(jsonDecode(request.body));
      _pricingScheme = updateRequest.pricingSchemes.first.pricingScheme;
      return Response('', HttpStatus.noContent);
    });

    var paypalEnvironment = PayPalEnvironment.sandbox(
        clientId: 'clientId', clientSecret: 'clientSecret');
    _subscriptionsApi = SubscriptionsApi(
        PayPalHttpClient(paypalEnvironment, client: mockHttpClient));
  });

  test('Test list plans', () async {
    var planCollection = await _subscriptionsApi.listPlans();
    expect(planCollection is PlanCollection, true);
    expect(planCollection.plans.length, 1);
  });

  test('Test create plan', () async {
    var billingPlan = await _subscriptionsApi.createPlan(
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

  test('Test update plan', () async {
    var billingPlan =
        await _subscriptionsApi.showPlanDetails('P-2M115208E3051582AMFFP4UQ');
    expect(billingPlan.description, 'Test description');

    await _subscriptionsApi.updatePlan('P-2M115208E3051582AMFFP4UQ', [
      Patch(
          op: Patch.operationReplace,
          path: '/description',
          value: 'Test description updated')
    ]);

    billingPlan =
        await _subscriptionsApi.showPlanDetails('P-2M115208E3051582AMFFP4UQ');
    expect(billingPlan.description, 'Test description updated');

    await _subscriptionsApi.updatePlan('P-2M115208E3051582AMFFP4UQ', [
      Patch(
          op: Patch.operationReplace,
          path: '/description',
          value: 'Test description')
    ]);
  });

  test('Test show plan details', () async {
    var billingPlan =
        await _subscriptionsApi.showPlanDetails('P-2M115208E3051582AMFFP4UQ');
    expect(billingPlan.name, 'Test plan');
  });

  test('Test deactivate/activate plan', () async {
    var billingPlan =
        await _subscriptionsApi.showPlanDetails('P-2M115208E3051582AMFFP4UQ');
    expect(billingPlan.status, BillingPlan.statusActive);

    await _subscriptionsApi.deactivatePlan('P-2M115208E3051582AMFFP4UQ');

    billingPlan =
        await _subscriptionsApi.showPlanDetails('P-2M115208E3051582AMFFP4UQ');
    expect(billingPlan.status, BillingPlan.statusInactive);

    await _subscriptionsApi.activatePlan('P-2M115208E3051582AMFFP4UQ');

    billingPlan =
        await _subscriptionsApi.showPlanDetails('P-2M115208E3051582AMFFP4UQ');
    expect(billingPlan.status, BillingPlan.statusActive);
  });

  test('Test update pricing schemas', () async {
    var billingPlan =
        await _subscriptionsApi.showPlanDetails('P-2M115208E3051582AMFFP4UQ');
    var pricingSchema = billingPlan.billingCycles!.first.pricingScheme;
    expect(pricingSchema?.fixedPrice?.value, '5.0');
    expect(pricingSchema?.fixedPrice?.currencyCode, 'GBP');

    await _subscriptionsApi.updatePlanPricing(
        'P-2M115208E3051582AMFFP4UQ',
        PricingSchemesUpdateRequest([
          PricingSchemeUpdateRequest(
              billingCycleSequence: 1,
              pricingScheme: PricingScheme(
                fixedPrice: Money(currencyCode: 'GBP', value: '10.0'),
              ))
        ]));

    billingPlan =
        await _subscriptionsApi.showPlanDetails('P-2M115208E3051582AMFFP4UQ');
    pricingSchema = billingPlan.billingCycles!.first.pricingScheme;
    expect(pricingSchema?.fixedPrice?.value, '10.0');
    expect(pricingSchema?.fixedPrice?.currencyCode, 'GBP');

    await _subscriptionsApi.updatePlanPricing(
        'P-2M115208E3051582AMFFP4UQ',
        PricingSchemesUpdateRequest([
          PricingSchemeUpdateRequest(
              billingCycleSequence: 1,
              pricingScheme: PricingScheme(
                fixedPrice: Money(currencyCode: 'GBP', value: '5.0'),
              ))
        ]));

    billingPlan =
        await _subscriptionsApi.showPlanDetails('P-2M115208E3051582AMFFP4UQ');
    pricingSchema = billingPlan.billingCycles!.first.pricingScheme;
    expect(pricingSchema?.fixedPrice?.value, '5.0');
    expect(pricingSchema?.fixedPrice?.currencyCode, 'GBP');
  });
}
