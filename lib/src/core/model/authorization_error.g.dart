// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorization_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorizationError _$AuthorizationErrorFromJson(Map<String, dynamic> json) =>
    AuthorizationError(
      json['error'] as String,
      json['error_description'] as String,
    );

Map<String, dynamic> _$AuthorizationErrorToJson(AuthorizationError instance) =>
    <String, dynamic>{
      'error': instance.error,
      'error_description': instance.errorDescription,
    };
