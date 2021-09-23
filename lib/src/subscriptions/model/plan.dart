import 'package:json_annotation/json_annotation.dart';
import 'package:paypal_sdk/src/core/model/link_description.dart';
import 'package:paypal_sdk/src/subscriptions/model/billing_cycle.dart';
import 'package:paypal_sdk/src/subscriptions/model/payment_preferences.dart';
import 'package:paypal_sdk/src/subscriptions/model/taxes.dart';

part 'plan.g.dart';

/// Billing plan.
@JsonSerializable()
class Plan {
  static const String statusCreated = 'CREATED';
  static const String statusInactive = 'INACTIVE';
  static const String statusActive = 'ACTIVE';

  /// The unique PayPal-generated ID for the plan.
  final String id;

  /// The ID for the product.
  @JsonKey(name: 'product_id')
  final String productId;

  /// The plan status. The possible values are:
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
  final String status;

  /// The plan name.
  final String name;

  /// The detailed description of the plan.
  final String? description;

  /// An array of billing cycles for trial billing and regular billing. A plan
  /// can have at most two trial cycles and only one regular cycle.
  @JsonKey(name: 'billing_cycles')
  final List<BillingCycle>? billingCycles;

  /// The payment preferences for a subscription.
  @JsonKey(name: 'payment_preferences')
  final PaymentPreferences? paymentPreferences;

  /// The tax details.
  final Taxes? taxes;

  /// Indicates whether you can subscribe to this plan by providing a quantity for the goods or service.
  @JsonKey(name: 'quantity_supported')
  final bool? quantitySupported;

  /// The date and time when the plan was created, in
  /// <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  @JsonKey(name: 'create_time')
  final String? createTime;

  /// The date and time when the plan was last updated, in
  /// <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  @JsonKey(name: 'update_time')
  final String? updateTime;

  /// An array of request-related <a href="https://developer.paypal.com/docs/api/reference/api-responses/#hateoas-links">
  /// HATEOAS links</a>.
  final List<LinkDescription>? links;

  const Plan(
    this.id,
    this.productId,
    this.status,
    this.name,
    this.description,
    this.billingCycles,
    this.paymentPreferences,
    this.taxes,
    this.quantitySupported,
    this.createTime,
    this.updateTime,
    this.links,
  );

  Map<String, dynamic> toJson() => _$PlanToJson(this);

  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);

  @override
  String toString() {
    return 'Plan{id: $id, productId: $productId, status: $status, '
        'name: $name, description: $description, '
        'quantitySupported: $quantitySupported, createTime: $createTime, '
        'updateTime: $updateTime, links: $links}';
  }
}
