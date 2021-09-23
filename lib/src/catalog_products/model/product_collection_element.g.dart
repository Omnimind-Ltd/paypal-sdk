// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_collection_element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCollectionElement _$ProductCollectionElementFromJson(
        Map<String, dynamic> json) =>
    ProductCollectionElement(
      json['id'] as String,
      json['name'] as String,
      json['description'] as String?,
      json['create_time'] as String,
      (json['links'] as List<dynamic>)
          .map((e) => LinkDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductCollectionElementToJson(
    ProductCollectionElement instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  val['create_time'] = instance.createTime;
  val['links'] = instance.links;
  return val;
}
