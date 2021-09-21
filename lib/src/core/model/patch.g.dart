// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Patch _$PatchFromJson(Map<String, dynamic> json) => Patch(
      op: json['op'] as String,
      path: json['path'] as String,
      value: json['value'],
      from: json['from'] as String?,
    );

Map<String, dynamic> _$PatchToJson(Patch instance) {
  final val = <String, dynamic>{
    'op': instance.op,
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
