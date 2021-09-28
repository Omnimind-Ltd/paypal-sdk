// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingDetail _$ShippingDetailFromJson(Map<String, dynamic> json) =>
    ShippingDetail(
      Name.fromJson(json['name'] as Map<String, dynamic>),
      json['type'] as String,
      AddressPortable.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShippingDetailToJson(ShippingDetail instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'address': instance.address,
    };
