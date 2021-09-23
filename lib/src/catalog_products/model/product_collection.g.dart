// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCollection _$ProductCollectionFromJson(Map<String, dynamic> json) =>
    ProductCollection(
      products: (json['products'] as List<dynamic>)
          .map((e) =>
              ProductCollectionElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalItems: json['total_items'] as int?,
      totalPages: json['total_pages'] as int?,
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => LinkDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductCollectionToJson(ProductCollection instance) {
  final val = <String, dynamic>{
    'products': instance.products,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('total_items', instance.totalItems);
  writeNotNull('total_pages', instance.totalPages);
  writeNotNull('links', instance.links);
  return val;
}
