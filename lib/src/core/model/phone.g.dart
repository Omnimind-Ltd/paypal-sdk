// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Phone _$PhoneFromJson(Map<String, dynamic> json) => Phone(
      countryCode: json['country_code'] as String,
      nationalNumber: json['national_number'] as String,
      extensionNumber: json['extension_number'] as String?,
    );

Map<String, dynamic> _$PhoneToJson(Phone instance) {
  final val = <String, dynamic>{
    'country_code': instance.countryCode,
    'national_number': instance.nationalNumber,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('extension_number', instance.extensionNumber);
  return val;
}

PhoneWithType _$PhoneWithTypeFromJson(Map<String, dynamic> json) =>
    PhoneWithType(
      _$enumDecode(_$PhoneTypeEnumMap, json['phone_type']),
      Phone.fromJson(json['phone_number'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PhoneWithTypeToJson(PhoneWithType instance) =>
    <String, dynamic>{
      'phone_type': _$PhoneTypeEnumMap[instance.phoneType],
      'phone_number': instance.phoneNumber,
    };

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

const _$PhoneTypeEnumMap = {
  PhoneType.fax: 'FAX',
  PhoneType.home: 'HOME',
  PhoneType.mobile: 'MOBILE',
  PhoneType.other: 'OTHER',
  PhoneType.pager: 'PAGER',
  PhoneType.work: 'WORK',
};
