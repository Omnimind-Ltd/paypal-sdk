import 'dart:convert';

import 'package:paypal_sdk/core.dart';
import 'package:paypal_sdk/src/subscriptions/model/billing_cycle.dart';
import 'package:paypal_sdk/src/subscriptions/model/billing_plan.dart';
import 'package:paypal_sdk/src/subscriptions/model/payment_preferences.dart';
import 'package:paypal_sdk/src/subscriptions/model/taxes.dart';

import 'model/plan_collection.dart';

/// Subscriptions API interface
class SubscriptionsApi {
  final PayPalHttpClient _payPalHttpClient;

  SubscriptionsApi(PayPalHttpClient payPalHttpClient)
      : _payPalHttpClient = payPalHttpClient;

  /// Lists billing plans.
  ///
  /// Parameter productId: Filters the response by a Product ID.
  ///
  /// Parameter plans_ids: Filters the response by list of plan IDs. Filter
  /// supports upto 10 plan IDs.
  ///
  /// Parameter page_size: The number of items to return in the response.
  ///
  /// Parameter page: A non-zero integer which is the start index of the
  /// entire list of items to return in the response. The combination of page=1
  /// and page_size=20 returns the first 20 items. The combination of page=2 and
  /// page_size=20 returns the next 20 items.
  ///
  /// Parameter total_required: Indicates whether to show the total count in
  /// the response.
  Future<PlanCollection> listPlans(
      {String? productId,
      String? planIds,
      int? pageSize,
      int? page,
      bool? totalRequired}) async {
    var uri = _payPalHttpClient.getUri(
      '/v1/billing/plans',
      queryParameters: {
        'product_id': productId,
        'plan_ids': planIds,
        'page_size': pageSize?.toString(),
        'page': page?.toString(),
        'total_required': totalRequired?.toString(),
      },
    );

    var response = await _payPalHttpClient.get(uri);
    return PlanCollection.fromJson(jsonDecode(response.body));
  }

  /// Creates a plan that defines pricing and billing cycle details for subscriptions.
  ///
  /// Parameter productId: The ID of the product.
  ///
  /// Parameter name: The plan name.
  ///
  /// Parameter billingCycles: An array of billing cycles for trial billing and
  /// regular billing. A plan can have at most two trial cycles and only one
  /// regular cycle.
  ///
  /// Parameter paymentPreferences: The payment preferences for a subscription.
  ///
  /// Parameter taxes: The tax details.
  ///
  /// Parameter status: The initial state of the plan. Allowed input values are
  /// CREATED and ACTIVE.
  ///
  /// The possible values are:
  /// <ul>
  /// <li>
  /// CREATED. The plan was created. You cannot create subscriptions for a plan
  /// in this state.
  /// </li>
  /// <li>
  /// INACTIVE. The plan is inactive.
  /// </li>
  /// <li>
  /// ACTIVE. The plan is active. You can only create subscriptions for a plan
  /// in this state.
  /// </li>
  /// </ul>
  ///
  /// Parameter description: The detailed description of the plan.
  ///
  /// Parameter quantitySupported: Indicates whether you can subscribe to this
  /// plan by providing a quantity for the goods or service.
  ///
  /// Parameter paypalRequestId: The server stores keys for 72 hours.
  Future<BillingPlan> createPlan({
    required String productId,
    required String name,
    required List<BillingCycle> billingCycles,
    required PaymentPreferences paymentPreferences,
    Taxes? taxes,
    String? status,
    String? description,
    bool? quantitySupported,
    String? payPalRequestId,
  }) async {
    var uri = _payPalHttpClient.getUri('/v1/billing/plans');

    var headers =
        payPalRequestId != null ? {'PayPal-Request-Id': payPalRequestId} : null;

    var body = jsonEncode(BillingPlan(
        productId: productId,
        name: name,
        billingCycles: billingCycles,
        paymentPreferences: paymentPreferences,
        taxes: taxes,
        status: status,
        description: description,
        quantitySupported: quantitySupported));

    var response =
        await _payPalHttpClient.post(uri, headers: headers, body: body);
    return BillingPlan.fromJson(jsonDecode(response.body));
  }
}
