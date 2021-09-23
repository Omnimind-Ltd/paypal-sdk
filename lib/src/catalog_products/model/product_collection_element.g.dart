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
      json['description'] as String,
      json['create_time'] as String,
      (json['links'] as List<dynamic>)
          .map((e) => LinkDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductCollectionElementToJson(
        ProductCollectionElement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'create_time': instance.createTime,
      'links': instance.links,
    };
