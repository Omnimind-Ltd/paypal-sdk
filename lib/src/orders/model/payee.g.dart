// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payee _$PayeeFromJson(Map<String, dynamic> json) => Payee(
      emailAddress: json['email_address'] as String?,
      merchantId: json['merchant_id'] as String?,
    );

Map<String, dynamic> _$PayeeToJson(Payee instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('email_address', instance.emailAddress);
  writeNotNull('merchant_id', instance.merchantId);
  return val;
}
