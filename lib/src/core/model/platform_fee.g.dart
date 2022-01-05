// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_fee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlatformFee _$PlatformFeeFromJson(Map<String, dynamic> json) => PlatformFee(
      amount: Money.fromJson(json['amount'] as Map<String, dynamic>),
      payee: json['payee'] == null
          ? null
          : Payee.fromJson(json['payee'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlatformFeeToJson(PlatformFee instance) {
  final val = <String, dynamic>{
    'amount': instance.amount,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('payee', instance.payee);
  return val;
}
