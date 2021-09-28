// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amount_with_breakdown.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AmountWithBreakdown _$AmountWithBreakdownFromJson(Map<String, dynamic> json) =>
    AmountWithBreakdown(
      grossAmount: Money.fromJson(json['gross_amount'] as Map<String, dynamic>),
      totalItemAmount: json['total_item_amount'] == null
          ? null
          : Money.fromJson(json['total_item_amount'] as Map<String, dynamic>),
      feeAmount: json['fee_amount'] == null
          ? null
          : Money.fromJson(json['fee_amount'] as Map<String, dynamic>),
      shippingAmount: json['shipping_amount'] == null
          ? null
          : Money.fromJson(json['shipping_amount'] as Map<String, dynamic>),
      taxAmount: json['tax_amount'] == null
          ? null
          : Money.fromJson(json['tax_amount'] as Map<String, dynamic>),
      netAmount: json['net_amount'] == null
          ? null
          : Money.fromJson(json['net_amount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AmountWithBreakdownToJson(AmountWithBreakdown instance) {
  final val = <String, dynamic>{
    'gross_amount': instance.grossAmount,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('total_item_amount', instance.totalItemAmount);
  writeNotNull('fee_amount', instance.feeAmount);
  writeNotNull('shipping_amount', instance.shippingAmount);
  writeNotNull('tax_amount', instance.taxAmount);
  writeNotNull('net_amount', instance.netAmount);
  return val;
}
