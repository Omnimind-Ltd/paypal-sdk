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

ExchangeRate _$ExchangeRateFromJson(Map<String, dynamic> json) => ExchangeRate(
      json['source_currency'] as String,
      json['target_currency'] as String,
      json['value'] as String,
    );

Map<String, dynamic> _$ExchangeRateToJson(ExchangeRate instance) =>
    <String, dynamic>{
      'source_currency': instance.sourceCurrency,
      'target_currency': instance.targetCurrency,
      'value': instance.value,
    };
