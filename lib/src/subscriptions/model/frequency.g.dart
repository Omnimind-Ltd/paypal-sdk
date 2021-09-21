// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'frequency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Frequency _$FrequencyFromJson(Map<String, dynamic> json) => Frequency(
      intervalUnit: json['interval_unit'] as String,
      intervalCount: json['interval_count'] as int,
    );

Map<String, dynamic> _$FrequencyToJson(Frequency instance) => <String, dynamic>{
      'interval_unit': instance.intervalUnit,
      'interval_count': instance.intervalCount,
    };
