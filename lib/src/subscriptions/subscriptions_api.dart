import 'dart:convert';

import 'package:paypal_sdk/core.dart';

import 'model/plan.dart';
import 'model/pricing_scheme.dart';
import 'model/subscription.dart';

/// Subscriptions API interface
class SubscriptionsApi {
  final PayPalHttpClient _payPalHttpClient;

  SubscriptionsApi(PayPalHttpClient payPalHttpClient)
      : _payPalHttpClient = payPalHttpClient;
  // Plans
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
    var url = _payPalHttpClient.getUrl(
      '/v1/billing/plans',
      queryParameters: {
        'product_id': productId,
        'plan_ids': planIds,
        'page_size': pageSize?.toString(),
        'page': page?.toString(),
        'total_required': totalRequired?.toString(),
      },
    );

    var response = await _payPalHttpClient.get(url);
    return PlanCollection.fromJson(jsonDecode(response.body));
  }

  /// Creates a plan that defines pricing and billing cycle details for subscriptions.
  ///
  /// Parameter planRequest: The create plan request object
  ///
  /// Parameter paypalRequestId: The server stores keys for 72 hours.
  Future<Plan> createPlan(
    PlanRequest planRequest, {
    String? payPalRequestId,
  }) async {
    var url = _payPalHttpClient.getUrl('/v1/billing/plans');

    var headers =
        payPalRequestId != null ? {'PayPal-Request-Id': payPalRequestId} : null;

    var body = jsonEncode(planRequest.toJson());

    var response =
        await _payPalHttpClient.post(url, headers: headers, body: body);
    return Plan.fromJson(jsonDecode(response.body));
  }

  /// Updates a plan with the CREATED or ACTIVE status. For an INACTIVE plan, you can make only status updates.
  /// You can patch these attributes and objects:
  /// <ul>
  /// <li>
  /// description. Operations: replace
  /// </li>
  /// <li>
  /// payment_preferences.auto_bill_outstanding. Operations: replace
  /// </li>
  /// <li>
  /// taxes.percentage. Operations: replace
  /// </li>
  /// <li>
  /// payment_preferences.payment_failure_threshold. Operations: replace
  /// </li>
  /// <li>
  /// payment_preferences.setup_fee. Operations: replace
  /// </li>
  /// <li>
  /// payment_preferences.setup_fee_failure_action. Operations:	replace
  /// </li>
  /// </ul>
  ///
  /// Parameter planId: The ID of the plan.
  ///
  /// Parameter patchRequests: The list of updates.
  Future<void> updatePlan(String planId, List<Patch> patchRequests) async {
    var url = _payPalHttpClient.getUrl('/v1/billing/plans/$planId');

    var patchRequest = List.generate(
        patchRequests.length, (index) => patchRequests[index].toJson());

    var body = jsonEncode(patchRequest);

    await _payPalHttpClient.patch(url, body: body);
  }

  /// Shows details for a plan.
  ///
  /// Parameter planId: The ID of the plan.
  Future<Plan> showPlanDetails(String planId) async {
    var url = _payPalHttpClient.getUrl('/v1/billing/plans/$planId');

    var response = await _payPalHttpClient.get(url);
    return Plan.fromJson(jsonDecode(response.body));
  }

  /// Activates a plan.
  ///
  /// Parameter planId: The ID of the plan.
  Future<void> activatePlan(String planId) async {
    var url = _payPalHttpClient.getUrl('/v1/billing/plans/$planId/activate');
    await _payPalHttpClient.post(url);
  }

  /// Deactivates a plan.
  ///
  /// Parameter planId: The ID of the plan.
  Future<void> deactivatePlan(String planId) async {
    var url = _payPalHttpClient.getUrl('/v1/billing/plans/$planId/deactivate');
    await _payPalHttpClient.post(url);
  }

  /// Updates pricing for a plan. For example, you can update a regular billing
  /// cycle from $5 per month to $7 per month.
  ///
  /// Parameter planId: The ID of the plan.
  ///
  /// Parameter pricingSchemes: The update plan pricing request object
  Future<void> updatePlanPricing(
      String planId, PricingSchemesUpdateRequest pricingSchemes) async {
    var url = _payPalHttpClient
        .getUrl('/v1/billing/plans/$planId/update-pricing-schemes');

    var body = jsonEncode(pricingSchemes.toJson());

    await _payPalHttpClient.post(url, body: body);
  }

  // Subscriptions
  /// Creates a subscription.
  /// Parameter request: The create subscription request object
  ///
  /// Parameter prefer: The preferred server response upon successful completion
  /// of the request.
  ///
  /// Parameter paypalRequestId: The server stores keys for 72 hours.
  Future<Subscription> createSubscription(
    SubscriptionRequest request,
    Prefer? prefer,
    String? payPalRequestId,
  ) async {
    var url = _payPalHttpClient.getUrl('/v1/billing/subscriptions');

    Map<String, String>? headers;

    if (prefer != null) {
      headers = {'return': preferTypeEnumMap[prefer]!};
    }

    var body = jsonEncode(request.toJson());

    var response =
        await _payPalHttpClient.post(url, headers: headers, body: body);
    return Subscription.fromJson(jsonDecode(response.body));
  }
}
