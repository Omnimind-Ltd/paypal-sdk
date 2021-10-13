// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AmountWithBreakdown _$AmountWithBreakdownFromJson(Map<String, dynamic> json) =>
    AmountWithBreakdown(
      currencyCode: json['currency_code'] as String,
      value: json['value'] as String,
      breakdown: json['breakdown'] == null
          ? null
          : AmountBreakdown.fromJson(json['breakdown'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AmountWithBreakdownToJson(AmountWithBreakdown instance) {
  final val = <String, dynamic>{
    'currency_code': instance.currencyCode,
    'value': instance.value,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('breakdown', instance.breakdown);
  return val;
}

AmountBreakdown _$AmountBreakdownFromJson(Map<String, dynamic> json) =>
    AmountBreakdown(
      itemTotal: json['item_total'] == null
          ? null
          : Money.fromJson(json['item_total'] as Map<String, dynamic>),
      shipping: json['shipping'] == null
          ? null
          : Money.fromJson(json['shipping'] as Map<String, dynamic>),
      handling: json['handling'] == null
          ? null
          : Money.fromJson(json['handling'] as Map<String, dynamic>),
      taxTotal: json['tax_total'] == null
          ? null
          : Money.fromJson(json['tax_total'] as Map<String, dynamic>),
      insurance: json['insurance'] == null
          ? null
          : Money.fromJson(json['insurance'] as Map<String, dynamic>),
      shippingDiscount: json['shipping_discount'] == null
          ? null
          : Money.fromJson(json['shipping_discount'] as Map<String, dynamic>),
      discount: json['discount'] == null
          ? null
          : Money.fromJson(json['discount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AmountBreakdownToJson(AmountBreakdown instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('item_total', instance.itemTotal);
  writeNotNull('shipping', instance.shipping);
  writeNotNull('handling', instance.handling);
  writeNotNull('tax_total', instance.taxTotal);
  writeNotNull('insurance', instance.insurance);
  writeNotNull('shipping_discount', instance.shippingDiscount);
  writeNotNull('discount', instance.discount);
  return val;
}
