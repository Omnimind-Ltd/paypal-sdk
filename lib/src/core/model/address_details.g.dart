// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressDetails _$AddressDetailsFromJson(Map<String, dynamic> json) =>
    AddressDetails(
      json['street_number'] as String?,
      json['street_name'] as String?,
      json['street_type'] as String?,
      json['delivery_service'] as String?,
      json['building_name'] as String?,
      json['sub_building'] as String?,
    );

Map<String, dynamic> _$AddressDetailsToJson(AddressDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('street_number', instance.streetNumber);
  writeNotNull('street_name', instance.streetName);
  writeNotNull('street_type', instance.streetType);
  writeNotNull('delivery_service', instance.deliveryService);
  writeNotNull('building_name', instance.buildingName);
  writeNotNull('sub_building', instance.subBuilding);
  return val;
}
