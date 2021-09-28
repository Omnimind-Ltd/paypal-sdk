// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Patch _$PatchFromJson(Map<String, dynamic> json) => Patch(
      op: _$enumDecode(_$PatchOperationEnumMap, json['op']),
      path: json['path'] as String,
      value: json['value'],
      from: json['from'] as String?,
    );

Map<String, dynamic> _$PatchToJson(Patch instance) {
  final val = <String, dynamic>{
    'op': _$PatchOperationEnumMap[instance.op],
    'path': instance.path,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('value', instance.value);
  writeNotNull('from', instance.from);
  return val;
}

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

const _$PatchOperationEnumMap = {
  PatchOperation.add: 'add',
  PatchOperation.remove: 'remove',
  PatchOperation.replace: 'replace',
  PatchOperation.move: 'move',
  PatchOperation.copy: 'copy',
  PatchOperation.test: 'test',
};
