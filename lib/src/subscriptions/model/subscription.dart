import 'package:flutter_paypal_sdk/core.dart';
import 'package:json_annotation/json_annotation.dart';

import 'billing_cycle.dart';
import 'payment.dart';
import 'plan.dart';

part 'subscription.g.dart';

/// The status of the subscription.
enum SubscriptionStatus {
  /// The subscription is created but not yet approved by the buyer.
  @JsonValue('APPROVAL_PENDING')
  approvalPending,

  /// The buyer has approved the subscription.
  @JsonValue('APPROVED')
  approved,

  /// The subscription is active.
  @JsonValue('ACTIVE')
  active,

  /// The subscription is suspended.
  @JsonValue('SUSPENDED')
  suspended,

  /// The subscription is cancelled.
  @JsonValue('CANCELLED')
  cancelled,

  /// The subscription is expired.
  @JsonValue('EXPIRED')
  expired,
}

/// Configures the label name to Continue or Subscribe Now for subscription
/// consent experience.
enum UserAction {
  /// After you redirect the customer to the PayPal subscription consent page, a
  /// Continue button appears. Use this option when you want to control the activation
  /// of the subscription and do not want PayPal to activate the subscription.
  @JsonValue('CONTINUE')
  continue_,

  ///  After you redirect the customer to the PayPal subscription consent page,
  ///  a Subscribe Now button appears. Use this option when you want PayPal to
  ///  activate the subscription.
  @JsonValue('SUBSCRIBE_NOW')
  subscribedNow,
}

/// The location from which the shipping address is derived.
enum ShippingPreference {
  ///  Get the customer-provided shipping address on the PayPal site.
  @JsonValue('GET_FROM_FILE')
  getFromFile,

  /// Redacts the shipping address from the PayPal site. Recommended for digital goods.
  @JsonValue('NO_SHIPPING')
  noShipping,

  ///  Get the merchant-provided address. The customer cannot change this address
  ///  on the PayPal site. If merchant does not pass an address, customer can
  ///  choose the address on PayPal pages.
  @JsonValue('SET_PROVIDED_ADDRESS')
  setProvidedAddress,
}

/// The type of capture.
enum CaptureType {
  /// The outstanding balance that the subscriber must clear.
  @JsonValue('OUTSTANDING_BALANCE')
  outstandingBalance,
}

/// The status of the captured payment.
enum CaptureStatus {
  /// The funds for this captured payment were credited to the payee's PayPal account.
  @JsonValue('COMPLETED')
  completed,

  /// The funds could not be captured.
  @JsonValue('DECLINED')
  declined,

  /// An amount less than this captured payment's amount was partially refunded
  /// to the payer.
  @JsonValue('PARTIALLY_REFUNDED')
  partiallyRefunded,

  /// The funds for this captured payment was not yet credited to the payee's
  /// PayPal account. For more information, see status.details.
  @JsonValue('PENDING')
  pending,

  ///  An amount greater than or equal to this captured payment's amount was
  ///  refunded to the payer.
  @JsonValue('REFUNDED')
  refunded,
}

/// A subscription.
@JsonSerializable(fieldRename: FieldRename.snake)
class Subscription {
  /// The PayPal-generated ID for the subscription.
  final String id;

  /// The ID of the plan.
  final String? planId;

  /// The status of the subscription.
  final SubscriptionStatus? status;

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

  /// An array of request-related HATEOAS links.
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

  factory Subscription.fromJson(Map<String, dynamic> json) => _$SubscriptionFromJson(json);

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

/// Capture authorized payment request
@JsonSerializable(fieldRename: FieldRename.snake)
class SubscriptionCaptureRequest {
  /// The reason or note for the subscription charge.
  final String note;

  /// The type of capture.
  final CaptureType captureType;

  /// The amount of the outstanding balance. This value cannot be greater than
  /// the current outstanding balance amount.
  final Money amount;

  const SubscriptionCaptureRequest({
    required this.note,
    required this.amount,
    this.captureType = CaptureType.outstandingBalance,
  });

  Map<String, dynamic> toJson() => _$SubscriptionCaptureRequestToJson(this);

  factory SubscriptionCaptureRequest.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionCaptureRequestFromJson(json);

  @override
  String toString() {
    return 'SubscriptionCaptureRequest{note: $note, captureType: $captureType, '
        'amount: $amount}';
  }
}

/// Updates the quantity of the product or service in a subscription. You can
/// also use this method to switch the plan and update the shipping_amount,
/// shipping_address values for the subscription. This type of update requires
/// the buyer's consent.
@JsonSerializable(fieldRename: FieldRename.snake)
class SubscriptionReviseRequest {
  /// The unique PayPal-generated ID for the plan.
  final String planId;

  /// The quantity of the product or service in the subscription.
  final String? quantity;

  /// The date and time when this change is effective, in
  /// <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  final String? effectiveTime;

  /// The shipping charges.
  final Money? shippingAmount;

  /// The shipping address of the subscriber.
  final AddressPortable? shippingAddress;

  /// The application context, which customizes the payer experience during the
  /// subscription approval process with PayPal.
  final ApplicationContext? applicationContext;

  /// An inline plan object to customise the subscription. You can override plan
  /// level default attributes by providing customised values for the subscription
  /// in this object. Any existing overrides will not be carried forward during
  /// subscription revise.
  final Plan? plan;

  SubscriptionReviseRequest(
      {required this.planId,
      this.quantity,
      this.effectiveTime,
      this.shippingAmount,
      this.shippingAddress,
      this.applicationContext,
      this.plan});

  Map<String, dynamic> toJson() => _$SubscriptionReviseRequestToJson(this);

  factory SubscriptionReviseRequest.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionReviseRequestFromJson(json);

  @override
  String toString() {
    return 'SubscriptionReviseRequest{planId: $planId, quantity: $quantity, '
        'effectiveTime: $effectiveTime, shippingAmount: $shippingAmount, '
        'shippingAddress: $shippingAddress, applicationContext: $applicationContext, '
        'plan: $plan}';
  }
}

/// The subscription revise response.
@JsonSerializable(fieldRename: FieldRename.snake)
class SubscriptionReviseResponse {
  /// The ID of the plan.
  final String? planId;

  /// The quantity of the product in the subscription.
  final String? quantity;

  /// The date and time when this change is effective, in
  /// <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  final String? effectiveTime;

  /// The currency and amount for a financial transaction, such as a balance or payment due.
  final Money? shippingAmount;

  /// The subscriber response information.
  final Subscriber? subscriber;

  /// The shipping address of the subscriber.
  final AddressPortable? shippingAddress;

  /// Indicates whether the subscription has overridden any plan attributes.
  final bool? planOverridden;

  /// Indicates whether the subscription has overridden any plan attributes.
  final Plan? plan;

  /// An array of request-related HATEOAS links.
  final List<LinkDescription>? links;

  const SubscriptionReviseResponse(
      this.planId,
      this.quantity,
      this.effectiveTime,
      this.shippingAmount,
      this.subscriber,
      this.shippingAddress,
      this.planOverridden,
      this.plan,
      this.links);

  Map<String, dynamic> toJson() => _$SubscriptionReviseResponseToJson(this);

  factory SubscriptionReviseResponse.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionReviseResponseFromJson(json);
}

/// A subscriber.
@JsonSerializable(fieldRename: FieldRename.snake)
class Subscriber {
  /// The name of the payer. Supports only the given_name and surname properties.
  final Name? name;

  /// The email address of the payer.
  final String? emailAddress;

  /// The PayPal-assigned ID for the payer.
  final String payerId;

  /// The phone number of the customer. Available only when you enable the Contact
  /// Telephone Number option in the
  /// <a href="https://www.paypal.com/cgi-bin/customerprofileweb?cmd=_profile-website-payments&_ga=1.219663193.134270098.1627037710">
  /// Profile & Settings</a> for the merchant's PayPal account. The phone.phone_number
  /// supports only national_number.
  final Phone? phone;

  /// The shipping details.
  final ShippingDetail? shippingAddress;

  /// The payment source used to fund the payment.
  final PaymentSource? paymentSource;

  const Subscriber(
      {this.name,
      this.emailAddress,
      required this.payerId,
      this.phone,
      this.shippingAddress,
      this.paymentSource});

  Map<String, dynamic> toJson() => _$SubscriberToJson(this);

  factory Subscriber.fromJson(Map<String, dynamic> json) => _$SubscriberFromJson(json);

  @override
  String toString() {
    return 'Subscriber{name: $name, emailAddress: $emailAddress, payerId: $payerId, '
        'phone: $phone, shippingAddress: $shippingAddress, paymentSource: $paymentSource}';
  }
}

/// The application context, which customizes the payer experience during the
/// subscription approval process with PayPal.
@JsonSerializable(fieldRename: FieldRename.snake)
class ApplicationContext {
  /// The label that overrides the business name in the PayPal account on the PayPal site.
  final String? brandName;

  /// The BCP 47-formatted locale of pages that the PayPal payment experience shows.
  /// PayPal supports a five-character code. For example, da-DK, he-IL, id-ID,
  /// ja-JP, no-NO, pt-BR, ru-RU, sv-SE, th-TH, zh-CN, zh-HK, or zh-TW.
  final String? locale;

  /// The location from which the shipping address is derived.
  final ShippingPreference? shippingPreference;

  /// Configures the label name to Continue or Subscribe Now for subscription
  /// consent experience.
  final UserAction? userAction;

  /// The customer and merchant payment preferences. Currently only PAYPAL payment
  /// method is supported.
  final PaymentMethod? paymentMethod;

  /// The URL where the customer is redirected after the customer approves the payment.
  final String returnUrl;

  /// The URL where the customer is redirected after the customer cancels the payment.
  final String cancelUrl;

  const ApplicationContext(
      {this.brandName,
      this.locale,
      this.shippingPreference,
      this.userAction,
      this.paymentMethod,
      required this.returnUrl,
      required this.cancelUrl});

  Map<String, dynamic> toJson() => _$ApplicationContextToJson(this);

  factory ApplicationContext.fromJson(Map<String, dynamic> json) =>
      _$ApplicationContextFromJson(json);

  @override
  String toString() {
    return 'ApplicationContext{brandName: $brandName, locale: $locale, '
        'shippingPreference: $shippingPreference, userAction: $userAction, '
        'paymentMethod: $paymentMethod, returnUrl: $returnUrl, cancelUrl: $cancelUrl}';
  }
}
