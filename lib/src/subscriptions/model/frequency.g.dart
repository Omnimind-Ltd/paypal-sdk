// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'frequency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Frequency _$FrequencyFromJson(Map<String, dynamic> json) => Frequency(
      intervalUnit: $enumDecode(_$IntervalUnitEnumMap, json['interval_unit']),
      intervalCount: json['interval_count'] as int,
    );

Map<String, dynamic> _$FrequencyToJson(Frequency instance) => <String, dynamic>{
      'interval_unit': _$IntervalUnitEnumMap[instance.intervalUnit]!,
      'interval_count': instance.intervalCount,
    };

const _$IntervalUnitEnumMap = {
  IntervalUnit.day: 'DAY',
  IntervalUnit.week: 'WEEK',
  IntervalUnit.month: 'MONTH',
  IntervalUnit.year: 'YEAR',
};
