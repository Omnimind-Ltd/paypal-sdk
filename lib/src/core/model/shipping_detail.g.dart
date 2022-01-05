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
      $enumDecodeNullable(_$ShippingTypeEnumMap, json['type']),
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

const _$ShippingTypeEnumMap = {
  ShippingType.shipping: 'SHIPPING',
  ShippingType.pickupInPerson: 'PICKUP_IN_PERSON',
};
