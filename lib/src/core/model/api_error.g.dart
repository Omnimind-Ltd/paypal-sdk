// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiError _$ApiErrorFromJson(Map<String, dynamic> json) => ApiError(
      name: json['name'] as String?,
      message: json['message'] as String?,
      debugId: json['debug_id'] as String?,
      informationLink: json['information_link'] as String?,
      details: (json['details'] as List<dynamic>?)
          ?.map((e) => ApiErrorDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => LinkDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ApiErrorToJson(ApiError instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('message', instance.message);
  writeNotNull('debug_id', instance.debugId);
  writeNotNull('information_link', instance.informationLink);
  writeNotNull('details', instance.details);
  writeNotNull('links', instance.links);
  return val;
}
