// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      json['id'] as String,
      json['name'] as String,
      json['description'] as String?,
      json['type'] as String,
      json['category'] as String?,
      json['image_url'] as String?,
      json['home_url'] as String?,
      json['create_time'] as String,
      json['update_time'] as String?,
      (json['links'] as List<dynamic>?)
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
  val['type'] = instance.type;
  writeNotNull('category', instance.category);
  writeNotNull('image_url', instance.imageUrl);
  writeNotNull('home_url', instance.homeUrl);
  val['create_time'] = instance.createTime;
  writeNotNull('update_time', instance.updateTime);
  writeNotNull('links', instance.links);
  return val;
}
