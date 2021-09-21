// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billing_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillingPlan _$BillingPlanFromJson(Map<String, dynamic> json) => BillingPlan(
      id: json['id'] as String?,
      productId: json['product_id'] as String?,
      status: json['status'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      billingCycles: (json['billing_cycles'] as List<dynamic>?)
          ?.map((e) => BillingCycle.fromJson(e as Map<String, dynamic>))
          .toList(),
      paymentPreferences: json['payment_preferences'] == null
          ? null
          : PaymentPreferences.fromJson(
              json['payment_preferences'] as Map<String, dynamic>),
      taxes: json['taxes'] == null
          ? null
          : Taxes.fromJson(json['taxes'] as Map<String, dynamic>),
      quantitySupported: json['quantity_supported'] as bool?,
      createTime: json['create_time'] as String?,
      updateTime: json['update_time'] as String?,
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => LinkDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BillingPlanToJson(BillingPlan instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('product_id', instance.productId);
  writeNotNull('status', instance.status);
  writeNotNull('name', instance.name);
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
