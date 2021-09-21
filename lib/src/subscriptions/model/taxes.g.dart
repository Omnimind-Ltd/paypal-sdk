// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taxes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Taxes _$TaxesFromJson(Map<String, dynamic> json) => Taxes(
      percentage: json['percentage'] as String?,
      inclusive: json['inclusive'] as bool?,
    );

Map<String, dynamic> _$TaxesToJson(Taxes instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('percentage', instance.percentage);
  writeNotNull('inclusive', instance.inclusive);
  return val;
}
