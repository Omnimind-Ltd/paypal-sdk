// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_portable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressPortable _$AddressPortableFromJson(Map<String, dynamic> json) =>
    AddressPortable(
      json['address_line_1'] as String?,
      json['address_line_2'] as String?,
      json['address_line_3'] as String?,
      json['admin_area_4'] as String?,
      json['admin_area_3'] as String?,
      json['admin_area_2'] as String?,
      json['admin_area_1'] as String?,
      json['postal_code'] as String?,
      json['countryCode'] as String?,
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

  writeNotNull('address_line_1', instance.addressLine1);
  writeNotNull('address_line_2', instance.addressLine2);
  writeNotNull('address_line_3', instance.addressLine3);
  writeNotNull('admin_area_4', instance.adminArea4);
  writeNotNull('admin_area_3', instance.adminArea3);
  writeNotNull('admin_area_2', instance.adminArea2);
  writeNotNull('admin_area_1', instance.adminArea1);
  writeNotNull('postal_code', instance.postalCode);
  writeNotNull('countryCode', instance.countryCode);
  writeNotNull('address_details', instance.addressDetails);
  return val;
}
