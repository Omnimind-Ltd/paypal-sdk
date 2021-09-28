// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'frequency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Frequency _$FrequencyFromJson(Map<String, dynamic> json) => Frequency(
      intervalUnit: _$enumDecode(_$IntervalUnitEnumMap, json['interval_unit']),
      intervalCount: json['interval_count'] as int,
    );

Map<String, dynamic> _$FrequencyToJson(Frequency instance) => <String, dynamic>{
      'interval_unit': _$IntervalUnitEnumMap[instance.intervalUnit],
      'interval_count': instance.intervalCount,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$IntervalUnitEnumMap = {
  IntervalUnit.day: 'DAY',
  IntervalUnit.week: 'WEEK',
  IntervalUnit.month: 'MONTH',
  IntervalUnit.year: 'YEAR',
};
