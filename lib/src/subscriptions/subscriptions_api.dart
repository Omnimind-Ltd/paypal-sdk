import 'dart:convert';

import 'package:flutter_paypal_sdk/core.dart';
import 'package:flutter_paypal_sdk/src/subscriptions/model/transaction.dart';

import 'model/plan.dart';
import 'model/pricing.dart';
import 'model/subscription.dart';

/// Subscriptions API interface
class SubscriptionsApi {
  final PayPalHttpClient _payPalHttpClient;

  SubscriptionsApi(PayPalHttpClient payPalHttpClient) : _payPalHttpClient = payPalHttpClient;
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
      {String? productId, String? planIds, int? pageSize, int? page, bool? totalRequired}) async {
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

    var headers = payPalRequestId != null ? {'PayPal-Request-Id': payPalRequestId} : null;

    var body = jsonEncode(planRequest.toJson());

    var response = await _payPalHttpClient.post(url, headers: headers, body: body);
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

    var patchRequest =
        List.generate(patchRequests.length, (index) => patchRequests[index].toJson());

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
  Future<void> updatePlanPricing(String planId, PricingSchemesUpdateRequest pricingSchemes) async {
    var url = _payPalHttpClient.getUrl('/v1/billing/plans/$planId/update-pricing-schemes');

    var body = jsonEncode(pricingSchemes.toJson());

    await _payPalHttpClient.post(url, body: body);
  }

  // Subscriptions
  /// Creates a subscription.
  ///
  /// Parameter request: The create subscription request object
  ///
  /// Parameter paypalRequestId: The server stores keys for 72 hours.
  ///
  /// Parameter prefer: 'minimal', The server returns a minimal response to optimize
  /// communication between the API caller and the server. A minimal response includes
  /// the id, status and HATEOAS links. 'representation', The server returns a complete
  /// resource representation, including the current state of the resource.
  Future<Subscription> createSubscription(
    SubscriptionRequest request, {
    String? payPalRequestId,
    Prefer? prefer,
  }) async {
    var url = _payPalHttpClient.getUrl('/v1/billing/subscriptions');

    Map<String, String> headers = {};

    if (prefer != null) {
      headers['Prefer'] = preferTypeEnumMap[prefer]!;
    }

    if (payPalRequestId != null) {
      headers['PayPal-Request-Id'] = payPalRequestId;
    }

    var body = jsonEncode(request.toJson());

    var response = await _payPalHttpClient.post(url, headers: headers, body: body);
    return Subscription.fromJson(jsonDecode(response.body));
  }

  /// Updates a subscription which could be in ACTIVE or SUSPENDED status. You
  /// can override plan level default attributes by providing customised values
  /// for plan path in the patch request.
  /// <ul>
  /// <li>
  /// You cannot update attributes that have already completed (Example - trial
  /// cycles can’t be updated if completed).
  /// </li>
  /// <li>
  /// Once overridden, changes to plan resource will not impact subscription.
  /// </li>
  /// <li>
  /// Any price update will not impact billing cycles within next 10 days
  /// (Applicable only for subscriptions funded by PayPal account).
  /// </li>
  /// </ul>
  /// Following are the fields eligible for patch:
  /// <ul>
  /// <li>
  /// billing_info.outstanding_balance. Operations: replace
  /// </li>
  /// <li>
  /// custom_id. Operations: add, replace
  /// </li>
  /// <li>
  /// plan.billing_cycles[@sequence==n]. pricing_scheme.fixed_price. Operations: add, replace
  /// </li>
  /// <li>
  /// plan.billing_cycles[@sequence==n]. pricing_scheme.tiers. Operations: replace
  /// </li>
  /// <li>
  /// plan.billing_cycles[@sequence==n].total_cycles. Operations: replace
  /// </li>
  /// <li>
  /// plan.payment_preferences.auto_bill_outstanding. Operations: replace
  /// </li>
  /// <li>
  /// plan.payment_preferences.payment_failure_threshold. Operations: replace
  /// </li>
  /// <li>
  /// plan.taxes.inclusive. Operations: add, replace
  /// </li>
  /// <li>
  /// plan.taxes.percentage. Operations: add, replace
  /// </li>
  /// <li>
  /// shipping_amount. Operations: add, replace
  /// </li>
  /// <li>
  /// start_time. Operations: replace
  /// </li>
  /// <li>
  /// subscriber.shipping_address. Operations: add, replace
  /// </li>
  /// <li>
  /// subscriber.payment_source (for subscriptions funded by card payments). Operations: replace
  /// </li>
  /// </ul>
  Future<void> updateSubscription(String subscriptionId, List<Patch> patchRequests) async {
    var url = _payPalHttpClient.getUrl('/v1/billing/subscriptions/$subscriptionId');

    var patchRequest =
        List.generate(patchRequests.length, (index) => patchRequests[index].toJson());

    var body = jsonEncode(patchRequest);

    await _payPalHttpClient.patch(url, body: body);
  }

  /// Shows details for a subscription, by ID.
  ///
  /// Parameter subscriptionId: The ID of the subscription
  ///
  /// Parameter fields: List of fields that are to be returned in the response.
  /// Possible value for fields are last_failed_payment and plan.
  Future<Subscription> showSubscriptionDetails(String subscriptionId,
      {List<String>? fields}) async {
    var queryParameters = fields != null ? <String, dynamic>{'fields': fields} : null;

    var url = _payPalHttpClient.getUrl('/v1/billing/subscriptions/$subscriptionId',
        queryParameters: queryParameters);

    var response = await _payPalHttpClient.get(url);
    return Subscription.fromJson(jsonDecode(response.body));
  }

  /// Activates the subscription.
  ///
  /// Parameter subscriptionId: The ID of the subscription
  ///
  /// Parameter reason: The reason for activation of a subscription. Required to
  /// reactivate the subscription.
  Future<void> activateSubscription(String subscriptionId, String reason) async {
    var url = _payPalHttpClient.getUrl('/v1/billing/subscriptions/$subscriptionId/activate');

    var body = jsonEncode(Reason(reason).toJson());

    await _payPalHttpClient.post(url, body: body);
  }

  /// Cancels the subscription.
  /// Parameter subscriptionId: The ID of the subscription
  ///
  /// Parameter reason: The reason for the cancellation of a subscription.
  Future<void> cancelSubscription(String subscriptionId, String reason) async {
    var url = _payPalHttpClient.getUrl('/v1/billing/subscriptions/$subscriptionId/cancel');

    var body = jsonEncode(Reason(reason).toJson());

    await _payPalHttpClient.post(url, body: body);
  }

  /// Captures an authorized payment from the subscriber on the subscription.
  ///
  /// Parameter subscriptionId: The ID of the subscription
  ///
  /// Parameter request: The subscription capture request
  ///
  /// Parameter paypalRequestId: The server stores keys for 72 hours.
  Future<Transaction> captureAuthorizedPaymentOnSubscription(
    String subscriptionId,
    SubscriptionCaptureRequest request, {
    String? payPalRequestId,
  }) async {
    var url = _payPalHttpClient.getUrl('/v1/billing/subscriptions/$subscriptionId/capture');

    var headers = payPalRequestId != null ? {'PayPal-Request-Id': payPalRequestId} : null;

    var body = jsonEncode(request.toJson());

    var response = await _payPalHttpClient.post(url, headers: headers, body: body);

    return Transaction.fromJson(jsonDecode(response.body));
  }

  /// Updates the quantity of the product or service in a subscription. You can
  /// also use this method to switch the plan and update the shipping_amount,
  /// shipping_address values for the subscription. This type of update requires
  /// the buyer's consent.
  ///
  /// Parameter subscriptionId: The ID of the subscription
  ///
  /// Parameter request: The subscription revise request
  Future<SubscriptionReviseResponse> reviseSubscription(
    String subscriptionId,
    SubscriptionReviseRequest request,
  ) async {
    var url = _payPalHttpClient.getUrl('/v1/billing/subscriptions/$subscriptionId/revise');

    var body = jsonEncode(request.toJson());

    var response = await _payPalHttpClient.post(url, body: body);

    return SubscriptionReviseResponse.fromJson(jsonDecode(response.body));
  }

  /// Suspends the subscription.
  ///
  /// Parameter subscriptionId: The ID of the subscription
  ///
  /// Parameter reason: The reason for suspenson of the subscription.
  Future<void> suspendSubscription(String subscriptionId, Reason reason) async {
    var url = _payPalHttpClient.getUrl('/v1/billing/subscriptions/$subscriptionId/suspend');

    var body = jsonEncode(reason.toJson());

    await _payPalHttpClient.post(url, body: body);
  }

  /// Lists transactions for a subscription.
  ///
  /// Parameter subscriptionId: The ID of the subscription
  ///
  /// Parameter startTime: The start time of the range of transactions to list.
  ///
  /// Parameter endTime: The end time of the range of transactions to list.
  Future<TransactionsList> listTransactions(
      String subscriptionId, String startTime, String endTime) async {
    var url = _payPalHttpClient
        .getUrl('/v1/billing/subscriptions/$subscriptionId/transactions', queryParameters: {
      'start_time': startTime,
      'end_time': endTime,
    });

    var response = await _payPalHttpClient.get(url);
    return TransactionsList.fromJson(jsonDecode(response.body));
  }
}
