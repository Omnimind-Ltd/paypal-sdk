// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'name.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Name _$NameFromJson(Map<String, dynamic> json) => Name(
      prefix: json['prefix'] as String?,
      givenName: json['given_name'] as String?,
      surname: json['surname'] as String?,
      middleName: json['middle_name'] as String?,
      suffix: json['suffix'] as String?,
      fullName: json['full_name'] as String?,
    );

Map<String, dynamic> _$NameToJson(Name instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('prefix', instance.prefix);
  writeNotNull('given_name', instance.givenName);
  writeNotNull('surname', instance.surname);
  writeNotNull('middle_name', instance.middleName);
  writeNotNull('suffix', instance.suffix);
  writeNotNull('full_name', instance.fullName);
  return val;
}
