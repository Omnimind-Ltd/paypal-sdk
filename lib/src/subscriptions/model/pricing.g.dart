// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PricingScheme _$PricingSchemeFromJson(Map<String, dynamic> json) =>
    PricingScheme(
      version: json['version'] as int?,
      fixedPrice: json['fixed_price'] == null
          ? null
          : Money.fromJson(json['fixed_price'] as Map<String, dynamic>),
      pricingModel:
          _$enumDecodeNullable(_$PricingModelEnumMap, json['pricing_model']),
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
  writeNotNull('pricing_model', _$PricingModelEnumMap[instance.pricingModel]);
  writeNotNull('tiers', instance.tiers);
  writeNotNull('create_time', instance.createTime);
  writeNotNull('update_time', instance.updateTime);
  return val;
}

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$PricingModelEnumMap = {
  PricingModel.volume: 'VOLUME',
  PricingModel.tiered: 'TIERED',
};

PricingSchemesUpdateRequest _$PricingSchemesUpdateRequestFromJson(
        Map<String, dynamic> json) =>
    PricingSchemesUpdateRequest(
      (json['pricing_schemes'] as List<dynamic>)
          .map((e) =>
              PricingSchemeUpdateRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PricingSchemesUpdateRequestToJson(
        PricingSchemesUpdateRequest instance) =>
    <String, dynamic>{
      'pricing_schemes': instance.pricingSchemes,
    };

PricingSchemeUpdateRequest _$PricingSchemeUpdateRequestFromJson(
        Map<String, dynamic> json) =>
    PricingSchemeUpdateRequest(
      billingCycleSequence: json['billing_cycle_sequence'] as int,
      pricingScheme: PricingScheme.fromJson(
          json['pricing_scheme'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PricingSchemeUpdateRequestToJson(
        PricingSchemeUpdateRequest instance) =>
    <String, dynamic>{
      'billing_cycle_sequence': instance.billingCycleSequence,
      'pricing_scheme': instance.pricingScheme,
    };

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
