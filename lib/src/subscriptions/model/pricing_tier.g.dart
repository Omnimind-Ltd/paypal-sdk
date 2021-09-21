// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricing_tier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PricingTier _$PricingTierFromJson(Map<String, dynamic> json) => PricingTier(
      startingQuantity: json['starting_quantity'] as String?,
      endingQuantity: json['ending_quantity'] as String?,
      amount: json['amount'] == null
          ? null
          : Money.fromJson(json['amount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PricingTierToJson(PricingTier instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('starting_quantity', instance.startingQuantity);
  writeNotNull('ending_quantity', instance.endingQuantity);
  writeNotNull('amount', instance.amount);
  return val;
}
