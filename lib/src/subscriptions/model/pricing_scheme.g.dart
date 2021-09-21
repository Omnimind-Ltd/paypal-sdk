// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricing_scheme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PricingScheme _$PricingSchemeFromJson(Map<String, dynamic> json) =>
    PricingScheme(
      version: json['version'] as int?,
      fixedPrice: json['fixed_price'] == null
          ? null
          : Money.fromJson(json['fixed_price'] as Map<String, dynamic>),
      pricingModel: json['pricing_model'] as String?,
      tiers: (json['tiers'] as List<dynamic>?)
          ?.map((e) => PricingTier.fromJson(e as Map<String, dynamic>))
          .toList(),
      createTime: json['create_time'] as String?,
      updateTime: json['update_time'] as String?,
    );

Map<String, dynamic> _$PricingSchemeToJson(PricingScheme instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('version', instance.version);
  writeNotNull('fixed_price', instance.fixedPrice);
  writeNotNull('pricing_model', instance.pricingModel);
  writeNotNull('tiers', instance.tiers);
  writeNotNull('create_time', instance.createTime);
  writeNotNull('update_time', instance.updateTime);
  return val;
}
