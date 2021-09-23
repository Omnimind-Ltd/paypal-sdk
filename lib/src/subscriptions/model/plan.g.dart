// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Plan _$PlanFromJson(Map<String, dynamic> json) => Plan(
      json['id'] as String,
      json['product_id'] as String,
      json['status'] as String,
      json['name'] as String,
      json['description'] as String?,
      (json['billing_cycles'] as List<dynamic>?)
          ?.map((e) => BillingCycle.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['payment_preferences'] == null
          ? null
          : PaymentPreferences.fromJson(
              json['payment_preferences'] as Map<String, dynamic>),
      json['taxes'] == null
          ? null
          : Taxes.fromJson(json['taxes'] as Map<String, dynamic>),
      json['quantity_supported'] as bool?,
      json['create_time'] as String?,
      json['update_time'] as String?,
      (json['links'] as List<dynamic>?)
          ?.map((e) => LinkDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlanToJson(Plan instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'product_id': instance.productId,
    'status': instance.status,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('billing_cycles', instance.billingCycles);
  writeNotNull('payment_preferences', instance.paymentPreferences);
  writeNotNull('taxes', instance.taxes);
  writeNotNull('quantity_supported', instance.quantitySupported);
  writeNotNull('create_time', instance.createTime);
  writeNotNull('update_time', instance.updateTime);
  writeNotNull('links', instance.links);
  return val;
}
