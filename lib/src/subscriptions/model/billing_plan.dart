import 'package:json_annotation/json_annotation.dart';
import 'package:paypal_sdk/src/core/model/link_description.dart';
import 'package:paypal_sdk/src/subscriptions/model/billing_cycle.dart';
import 'package:paypal_sdk/src/subscriptions/model/payment_preferences.dart';
import 'package:paypal_sdk/src/subscriptions/model/taxes.dart';

part 'billing_plan.g.dart';

/// Billing plan.
@JsonSerializable()
class BillingPlan {
  static const String statusCreated = 'CREATED';
  static const String statusInactive = 'INACTIVE';
  static const String statusActive = 'ACTIVE';

  /// The unique PayPal-generated ID for the plan.
  String? id;

  /// The ID for the product.
  @JsonKey(name: 'product_id')
  String? productId;

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
  String? status;

  /// The plan name.
  String? name;

  /// The detailed description of the plan.
  String? description;

  /// An array of billing cycles for trial billing and regular billing. A plan
  /// can have at most two trial cycles and only one regular cycle.
  @JsonKey(name: 'billing_cycles')
  List<BillingCycle>? billingCycles;

  /// The payment preferences for a subscription.
  @JsonKey(name: 'payment_preferences')
  PaymentPreferences? paymentPreferences;

  /// The tax details.
  Taxes? taxes;

  /// Indicates whether you can subscribe to this plan by providing a quantity for the goods or service.
  @JsonKey(name: 'quantity_supported')
  bool? quantitySupported;

  /// The date and time when the plan was created, in
  /// <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  @JsonKey(name: 'create_time')
  String? createTime;

  /// The date and time when the plan was last updated, in
  /// <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  @JsonKey(name: 'update_time')
  String? updateTime;

  /// An array of request-related <a href="https://developer.paypal.com/docs/api/reference/api-responses/#hateoas-links">
  /// HATEOAS links</a>.
  List<LinkDescription>? links;

  BillingPlan({
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
  });

  Map<String, dynamic> toJson() => _$BillingPlanToJson(this);

  factory BillingPlan.fromJson(Map<String, dynamic> json) =>
      _$BillingPlanFromJson(json);

  @override
  String toString() {
    return 'BillingPlan{id: $id, productId: $productId, status: $status, '
        'name: $name, description: $description, '
        'quantitySupported: $quantitySupported, createTime: $createTime, '
        'updateTime: $updateTime, links: $links}';
  }
}
