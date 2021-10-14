// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingDetail _$ShippingDetailFromJson(Map<String, dynamic> json) =>
    ShippingDetail(
      json['name'] == null
          ? null
          : Name.fromJson(json['name'] as Map<String, dynamic>),
      _$enumDecodeNullable(_$ShippingTypeEnumMap, json['type']),
      json['address'] == null
          ? null
          : AddressPortable.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShippingDetailToJson(ShippingDetail instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('type', _$ShippingTypeEnumMap[instance.type]);
  writeNotNull('address', instance.address);
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

const _$ShippingTypeEnumMap = {
  ShippingType.shipping: 'SHIPPING',
  ShippingType.pickupInPerson: 'PICKUP_IN_PERSON',
};
