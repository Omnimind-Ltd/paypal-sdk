// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

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

AddressPortable _$AddressPortableFromJson(Map<String, dynamic> json) =>
    AddressPortable(
      json['address_line1'] as String?,
      json['address_line2'] as String?,
      json['address_line3'] as String?,
      json['admin_area4'] as String?,
      json['admin_area3'] as String?,
      json['admin_area2'] as String?,
      json['admin_area1'] as String?,
      json['postal_code'] as String?,
      json['country_code'] as String?,
      json['address_details'] == null
          ? null
          : AddressDetails.fromJson(
              json['address_details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddressPortableToJson(AddressPortable instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('address_line1', instance.addressLine1);
  writeNotNull('address_line2', instance.addressLine2);
  writeNotNull('address_line3', instance.addressLine3);
  writeNotNull('admin_area4', instance.adminArea4);
  writeNotNull('admin_area3', instance.adminArea3);
  writeNotNull('admin_area2', instance.adminArea2);
  writeNotNull('admin_area1', instance.adminArea1);
  writeNotNull('postal_code', instance.postalCode);
  writeNotNull('country_code', instance.countryCode);
  writeNotNull('address_details', instance.addressDetails);
  return val;
}
