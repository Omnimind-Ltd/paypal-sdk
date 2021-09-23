import 'package:json_annotation/json_annotation.dart';
import 'package:paypal_sdk/src/subscriptions/model/billing_cycle.dart';
import 'package:paypal_sdk/src/subscriptions/model/payment_preferences.dart';
import 'package:paypal_sdk/src/subscriptions/model/taxes.dart';

part 'plan_request.g.dart';

/// Billing plan.
@JsonSerializable()
class PlanRequest {
  static const String statusCreated = 'CREATED';
  static const String statusActive = 'ACTIVE';

  /// The ID for the product.
  @JsonKey(name: 'product_id')
  final String productId;

  /// The plan name.
  final String name;

  /// The plan status. Allowed input values are CREATED and ACTIVE.
  /// The possible values are:
  /// <ul>
  /// <li>
  /// CREATED. The plan was created. You cannot create subscriptions for a plan in this state.
  /// </li>
  /// <li>
  /// INACTIVE. The plan is inactive.
  /// </li>
  /// <li>
  /// ACTIVE. The plan is active. You can only create subscriptions for a plan in this state.
  /// </li>
  /// </ul>
  final String? status;

  /// The detailed description of the plan.
  final String? description;

  /// An array of billing cycles for trial billing and regular billing. A plan
  /// can have at most two trial cycles and only one regular cycle.
  @JsonKey(name: 'billing_cycles')
  final List<BillingCycle> billingCycles;

  /// The payment preferences for a subscription.
  @JsonKey(name: 'payment_preferences')
  final PaymentPreferences paymentPreferences;

  /// The tax details.
  final Taxes? taxes;

  /// Indicates whether you can subscribe to this plan by providing a quantity for the goods or service.
  @JsonKey(name: 'quantity_supported')
  final bool? quantitySupported;

  const PlanRequest({
    required this.productId,
    required this.name,
    this.status,
    this.description,
    required this.billingCycles,
    required this.paymentPreferences,
    this.taxes,
    this.quantitySupported,
  });

  Map<String, dynamic> toJson() => _$PlanRequestToJson(this);

  factory PlanRequest.fromJson(Map<String, dynamic> json) =>
      _$PlanRequestFromJson(json);
}
