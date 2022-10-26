// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      type: $enumDecodeNullable(_$ProductTypeEnumMap, json['type']),
      category: json['category'] as String?,
      imageUrl: json['image_url'] as String?,
      homeUrl: json['home_url'] as String?,
      createTime: json['create_time'] as String,
      updateTime: json['update_time'] as String?,
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => LinkDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) {
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
  writeNotNull('type', _$ProductTypeEnumMap[instance.type]);
  writeNotNull('category', instance.category);
  writeNotNull('image_url', instance.imageUrl);
  writeNotNull('home_url', instance.homeUrl);
  val['create_time'] = instance.createTime;
  writeNotNull('update_time', instance.updateTime);
  writeNotNull('links', instance.links);
  return val;
}

const _$ProductTypeEnumMap = {
  ProductType.physical: 'PHYSICAL',
  ProductType.digital: 'DIGITAL',
  ProductType.service: 'SERVICE',
};

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

ProductRequest _$ProductRequestFromJson(Map<String, dynamic> json) =>
    ProductRequest(
      name: json['name'] as String,
      type: $enumDecode(_$ProductTypeEnumMap, json['type']),
      id: json['id'] as String?,
      description: json['description'] as String?,
      category: json['category'] as String?,
      imageUrl: json['image_url'] as String?,
      homeUrl: json['home_url'] as String?,
    );

Map<String, dynamic> _$ProductRequestToJson(ProductRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['name'] = instance.name;
  writeNotNull('description', instance.description);
  val['type'] = _$ProductTypeEnumMap[instance.type]!;
  writeNotNull('category', instance.category);
  writeNotNull('image_url', instance.imageUrl);
  writeNotNull('home_url', instance.homeUrl);
  return val;
}
