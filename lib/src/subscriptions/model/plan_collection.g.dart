// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanCollection _$PlanCollectionFromJson(Map<String, dynamic> json) =>
    PlanCollection(
      plans: (json['plans'] as List<dynamic>)
          .map((e) => BillingPlan.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalItems: json['total_items'] as int?,
      totalPages: json['total_pages'] as int?,
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => LinkDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlanCollectionToJson(PlanCollection instance) {
  final val = <String, dynamic>{
    'plans': instance.plans,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('total_items', instance.totalItems);
  writeNotNull('total_pages', instance.totalPages);
  writeNotNull('links', instance.links);
  return val;
}
