// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorDetails _$ApiErrorDetailsFromJson(Map<String, dynamic> json) =>
    ApiErrorDetails(
      field: json['field'] as String?,
      value: json['value'] as String?,
      location: json['location'] as String?,
      issue: json['issue'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ApiErrorDetailsToJson(ApiErrorDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('field', instance.field);
  writeNotNull('value', instance.value);
  writeNotNull('location', instance.location);
  val['issue'] = instance.issue;
  writeNotNull('description', instance.description);
  return val;
}
