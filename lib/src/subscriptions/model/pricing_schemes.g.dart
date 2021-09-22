// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricing_schemes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PricingSchemes _$PricingSchemesFromJson(Map<String, dynamic> json) =>
    PricingSchemes(
      (json['pricing_schemes'] as List<dynamic>)
          .map((e) => PricingScheme.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PricingSchemesToJson(PricingSchemes instance) =>
    <String, dynamic>{
      'pricing_schemes': instance.pricingSchemes,
    };
