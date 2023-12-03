import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_paypal_sdk/core.dart';

import 'billing_cycle.dart';
import 'payment.dart';

part 'plan.g.dart';

/// The plan status.
enum PlanStatus {
  /// The plan was created.
  @JsonValue('CREATED')
  created,

  /// The plan is active.
  @JsonValue('ACTIVE')
  active,

  /// The plan is inactive.
  @JsonValue('INACTIVE')
  inactive,
}

/// Billing plan.
@JsonSerializable(fieldRename: FieldRename.snake)
class Plan {
  /// The unique PayPal-generated ID for the plan.
  final String id;

  /// The ID for the product.
  final String? productId;

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
  final PlanStatus status;

  /// The plan name.
  final String name;

  /// The detailed description of the plan.
  final String? description;

  /// An array of billing cycles for trial billing and regular billing. A plan
  /// can have at most two trial cycles and only one regular cycle.
  final List<BillingCycle>? billingCycles;

  /// The payment preferences for a subscription.
  final PaymentPreferences? paymentPreferences;

  /// The tax details.
  final Taxes? taxes;

  /// Indicates whether you can subscribe to this plan by providing a quantity for the goods or service.
  final bool? quantitySupported;

  /// The date and time when the plan was created, in
  /// <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  final String? createTime;

  /// The date and time when the plan was last updated, in
  /// <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  final String? updateTime;

  /// An array of request-related HATEOAS links.
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

/// Billing plan.
@JsonSerializable(fieldRename: FieldRename.snake)
class PlanRequest {
  /// The ID for the product.
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
  /// ACTIVE. The plan is active. You can only create subscriptions for a plan in this state.
  /// </li>
  /// </ul>
  final PlanStatus? status;

  /// The detailed description of the plan.
  final String? description;

  /// An array of billing cycles for trial billing and regular billing. A plan
  /// can have at most two trial cycles and only one regular cycle.
  final List<BillingCycle> billingCycles;

  /// The payment preferences for a subscription.
  final PaymentPreferences paymentPreferences;

  /// The tax details.
  final Taxes? taxes;

  /// Indicates whether you can subscribe to this plan by providing a quantity for the goods or service.
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

  factory PlanRequest.fromJson(Map<String, dynamic> json) => _$PlanRequestFromJson(json);
}

/// A collection of billing plans
@JsonSerializable(fieldRename: FieldRename.snake)
class PlanCollection {
  /// An array of plans.
  final List<Plan> plans;

  /// The total number of items.
  /// Maximum value: 500000000.
  final int? totalItems;

  /// The total number of pages.
  /// Maximum value: 100000000.
  final int? totalPages;

  /// An array of request-related <a href="https://developer.paypal.com/docs/api/reference/api-responses/#hateoas-links">
  /// HATEOAS links.</a>
  final List<LinkDescription>? links;

  const PlanCollection({required this.plans, this.totalItems, this.totalPages, this.links});

  Map<String, dynamic> toJson() => _$PlanCollectionToJson(this);

  factory PlanCollection.fromJson(Map<String, dynamic> json) => _$PlanCollectionFromJson(json);

  @override
  String toString() {
    return 'PlanCollection{plans: $plans, totalItems: $totalItems, '
        'totalPages: $totalPages, links: $links}';
  }
}

/// Taxes.
@JsonSerializable()
class Taxes {
  /// The tax percentage on the billing amount.
  String? percentage;

  /// Indicates whether the tax was already included in the billing amount.
  bool? inclusive;

  Taxes({this.percentage, this.inclusive});

  Map<String, dynamic> toJson() => _$TaxesToJson(this);

  factory Taxes.fromJson(Map<String, dynamic> json) => _$TaxesFromJson(json);

  @override
  String toString() {
    return 'Taxes{percentage: $percentage, inclusive: $inclusive}';
  }
}
