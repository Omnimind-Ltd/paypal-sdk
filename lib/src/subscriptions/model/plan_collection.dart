import 'package:json_annotation/json_annotation.dart';
import 'package:paypal_sdk/src/core/model/link_description.dart';

import 'billing_plan.dart';

part 'plan_collection.g.dart';

/// A collection of billing plans
@JsonSerializable()
class PlanCollection {
  /// An array of plans.
  List<BillingPlan> plans;

  /// The total number of items.
  /// Maximum value: 500000000.
  @JsonKey(name: 'total_items')
  int? totalItems;

  /// The total number of pages.
  /// Maximum value: 100000000.
  @JsonKey(name: 'total_pages')
  int? totalPages;

  /// An array of request-related <a href="https://developer.paypal.com/docs/api/reference/api-responses/#hateoas-links">
  /// HATEOAS links.</a>
  List<LinkDescription>? links;

  PlanCollection(
      {required this.plans, this.totalItems, this.totalPages, this.links});

  Map<String, dynamic> toJson() => _$PlanCollectionToJson(this);

  factory PlanCollection.fromJson(Map<String, dynamic> json) =>
      _$PlanCollectionFromJson(json);

  @override
  String toString() {
    return 'PlanCollection{plans: $plans, totalItems: $totalItems, '
        'totalPages: $totalPages, links: $links}';
  }
}
