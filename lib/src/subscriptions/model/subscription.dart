import 'package:json_annotation/json_annotation.dart';
import 'package:paypal_sdk/core.dart';
import 'package:paypal_sdk/src/subscriptions/model/application_context.dart';

import 'billing_cycle.dart';
import 'payment_details.dart';
import 'plan.dart';
import 'subscriber.dart';

part 'subscription.g.dart';

/// A subscription.
@JsonSerializable(fieldRename: FieldRename.snake)
class Subscription {
  /// The PayPal-generated ID for the subscription.
  final String id;

  /// The ID of the plan.
  final String planId;

  /// The status of the subscription.
  final String? status;

  /// The reason or notes for the status of the subscription.
  final String? statusChangeNote;

  /// The date and time, in <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  final String? statusUpdateTime;

  /// The date and time, in <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  final String? startTime;

  /// The quantity of the product in the subscription.
  final String? quantity;

  /// The currency and amount for a financial transaction, such as a balance or payment due.
  final Money? shippingAmount;

  /// The subscriber response information.
  final Subscriber? subscriber;

  /// The billing details for the subscription. If the subscription was or is
  /// active, these fields are populated.
  final SubscriptionBillingInfo? billingInfo;

  /// The date and time, in
  /// <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  final String? createTime;

  /// The date and time, in
  /// <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  final String? updateTime;

  /// The custom id for the subscription. Can be invoice id.
  final String? customId;

  /// Indicates whether the subscription has overridden any plan attributes.
  final bool? planOverridden;

  /// Indicates whether the subscription has overridden any plan attributes.
  final Plan? plan;

  /// An array of request-related <a href="https://developer.paypal.com/docs/api/reference/api-responses/#hateoas-links">
  /// HATEOAS links</a>.
  final List<LinkDescription>? links;

  const Subscription(
      this.id,
      this.planId,
      this.status,
      this.statusChangeNote,
      this.statusUpdateTime,
      this.startTime,
      this.quantity,
      this.shippingAmount,
      this.subscriber,
      this.billingInfo,
      this.createTime,
      this.updateTime,
      this.customId,
      this.planOverridden,
      this.plan,
      this.links);

  Map<String, dynamic> toJson() => _$SubscriptionToJson(this);

  factory Subscription.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFromJson(json);

  @override
  String toString() {
    return 'Subscription{id: $id, planId: $planId, status: $status, '
        'statusChangeNote: $statusChangeNote, statusUpdateTime: $statusUpdateTime, '
        'startTime: $startTime, quantity: $quantity, shippingAmount: $shippingAmount, '
        'subscriber: $subscriber, billingInfo: $billingInfo, createTime: $createTime, '
        'updateTime: $updateTime, customId: $customId, planOverridden: $planOverridden, '
        'plan: $plan, links: $links}';
  }
}

/// The subscriber billing information.
@JsonSerializable(fieldRename: FieldRename.snake)
class SubscriptionBillingInfo {
  /// The total pending bill amount, to be paid by the subscriber.
  final Money outstandingBalance;

  /// The trial and regular billing executions.
  final List<CycleExecution>? cycleExecutions;

  /// The details for the last payment of the subscription.
  final LastPaymentDetails? lastPayment;

  /// The next date and time for billing this subscription, in
  /// <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  final String? nextBillingTime;

  /// The date and time when the final billing cycle occurs, in
  /// <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  final String? finalPaymentTime;

  /// The number of consecutive payment failures. Resets to 0 after a successful
  /// payment. If this reaches the payment_failure_threshold value, the subscription
  /// updates to the SUSPENDED state.
  final int failedPaymentsCount;

  /// The details for the last failed payment of the subscription.
  final FailedPaymentDetails? lastFailedPayment;

  SubscriptionBillingInfo(
      {required this.outstandingBalance,
      this.cycleExecutions,
      this.lastPayment,
      this.nextBillingTime,
      this.finalPaymentTime,
      required this.failedPaymentsCount,
      this.lastFailedPayment});

  Map<String, dynamic> toJson() => _$SubscriptionBillingInfoToJson(this);

  factory SubscriptionBillingInfo.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionBillingInfoFromJson(json);

  @override
  String toString() {
    return 'SubscriptionBillingInfo{outstandingBalance: $outstandingBalance, '
        'cycleExecutions: $cycleExecutions, lastPayment: $lastPayment, '
        'nextBillingTime: $nextBillingTime, finalPaymentTime: $finalPaymentTime, '
        'failedPaymentsCount: $failedPaymentsCount, lastFailedPayment: $lastFailedPayment}';
  }
}

/// Create subscription request.
@JsonSerializable(fieldRename: FieldRename.snake)
class SubscriptionRequest {
  /// The ID of the plan.
  final String planId;

  /// The quantity of the product in the subscription.
  final String? quantity;

  /// The shipping charges.
  final Money? shippingAmount;

  /// The subscriber request information .
  final Subscriber? subscriber;

  /// The billing details for the subscription. If the subscription was or is
  /// active, these fields are populated.
  final SubscriptionBillingInfo? billingInfo;

  /// The application context, which customizes the payer experience during the
  /// subscription approval process with PayPal.
  final ApplicationContext? applicationContext;

  /// The custom id for the subscription. Can be invoice id.
  final String? customId;

  /// An inline plan object to customise the subscription. You can override plan
  /// level default attributes by providing customised values for the subscription in this object.
  final Plan? plan;

  SubscriptionRequest(
      {required this.planId,
      this.quantity,
      this.shippingAmount,
      this.subscriber,
      this.billingInfo,
      this.applicationContext,
      this.customId,
      this.plan});

  Map<String, dynamic> toJson() => _$SubscriptionRequestToJson(this);

  factory SubscriptionRequest.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionRequestFromJson(json);

  @override
  String toString() {
    return 'SubscriptionRequest{planId: $planId, quantity: $quantity, '
        'shippingAmount: $shippingAmount, subscriber: $subscriber, '
        'billingInfo: $billingInfo, applicationContext: $applicationContext, '
        'customId: $customId, plan: $plan}';
  }
}
