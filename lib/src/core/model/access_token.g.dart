// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessToken _$AccessTokenFromJson(Map<String, dynamic> json) => AccessToken(
      scope: json['scope'] as String,
      accessToken: json['access_token'] as String,
      tokenType: json['token_type'] as String,
      appId: json['app_id'] as String,
      expiresIn: json['expires_in'] as int,
      nonce: json['nonce'] as String,
    )..expiryDateTime = json['expiryDateTime'] == null
        ? null
        : DateTime.parse(json['expiryDateTime'] as String);

Map<String, dynamic> _$AccessTokenToJson(AccessToken instance) {
  final val = <String, dynamic>{
    'scope': instance.scope,
    'access_token': instance.accessToken,
    'token_type': instance.tokenType,
    'app_id': instance.appId,
    'expires_in': instance.expiresIn,
    'nonce': instance.nonce,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('expiryDateTime', instance.expiryDateTime?.toIso8601String());
  return val;
}
