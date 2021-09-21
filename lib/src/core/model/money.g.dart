// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Money _$MoneyFromJson(Map<String, dynamic> json) => Money(
      currencyCode: json['currency_code'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$MoneyToJson(Money instance) => <String, dynamic>{
      'currency_code': instance.currencyCode,
      'value': instance.value,
    };
