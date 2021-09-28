// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentSource _$PaymentSourceFromJson(Map<String, dynamic> json) =>
    PaymentSource(
      Card.fromJson(json['card'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentSourceToJson(PaymentSource instance) =>
    <String, dynamic>{
      'card': instance.card,
    };
