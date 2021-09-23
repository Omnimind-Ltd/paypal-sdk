// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlanRequest _$PlanRequestFromJson(Map<String, dynamic> json) => PlanRequest(
      productId: json['product_id'] as String,
      name: json['name'] as String,
      status: json['status'] as String?,
      description: json['description'] as String?,
      billingCycles: (json['billing_cycles'] as List<dynamic>)
          .map((e) => BillingCycle.fromJson(e as Map<String, dynamic>))
          .toList(),
      paymentPreferences: PaymentPreferences.fromJson(
          json['payment_preferences'] as Map<String, dynamic>),
      taxes: json['taxes'] == null
          ? null
          : Taxes.fromJson(json['taxes'] as Map<String, dynamic>),
      quantitySupported: json['quantity_supported'] as bool?,
    );

Map<String, dynamic> _$PlanRequestToJson(PlanRequest instance) {
  final val = <String, dynamic>{
    'product_id': instance.productId,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', instance.status);
  writeNotNull('description', instance.description);
  val['billing_cycles'] = instance.billingCycles;
  val['payment_preferences'] = instance.paymentPreferences;
  writeNotNull('taxes', instance.taxes);
  writeNotNull('quantity_supported', instance.quantitySupported);
  return val;
}
