// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payer _$PayerFromJson(Map<String, dynamic> json) => Payer(
      emailAddress: json['email_address'] as String?,
      payerId: json['payer_id'] as String?,
    );

Map<String, dynamic> _$PayerToJson(Payer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email_address', instance.emailAddress);
  writeNotNull('payer_id', instance.payerId);
  return val;
}
