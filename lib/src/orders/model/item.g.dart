// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      name: json['name'] as String?,
      unitAmount: Money.fromJson(json['unit_amount'] as Map<String, dynamic>),
      tax: json['tax'] == null
          ? null
          : Money.fromJson(json['tax'] as Map<String, dynamic>),
      quantity: json['quantity'] as String,
      description: json['description'] as String?,
      sku: json['sku'] as String?,
      category: $enumDecodeNullable(_$ItemCategoryEnumMap, json['category']),
    );

Map<String, dynamic> _$ItemToJson(Item instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  val['unit_amount'] = instance.unitAmount;
  writeNotNull('tax', instance.tax);
  val['quantity'] = instance.quantity;
  writeNotNull('description', instance.description);
  writeNotNull('sku', instance.sku);
  writeNotNull('category', _$ItemCategoryEnumMap[instance.category]);
  return val;
}

const _$ItemCategoryEnumMap = {
  ItemCategory.digitalGoods: 'DIGITAL_GOODS',
  ItemCategory.physicalGoods: 'PHYSICAL_GOODS',
  ItemCategory.donation: 'DONATION',
};
