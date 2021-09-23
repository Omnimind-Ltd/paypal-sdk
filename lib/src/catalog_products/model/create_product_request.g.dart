// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_product_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateProductRequest _$CreateProductRequestFromJson(
        Map<String, dynamic> json) =>
    CreateProductRequest(
      name: json['name'] as String,
      type: json['type'] as String,
      id: json['id'] as String?,
      description: json['description'] as String?,
      category: json['category'] as String?,
      imageUrl: json['image_url'] as String?,
      homeUrl: json['home_url'] as String?,
    );

Map<String, dynamic> _$CreateProductRequestToJson(
    CreateProductRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['name'] = instance.name;
  writeNotNull('description', instance.description);
  val['type'] = instance.type;
  writeNotNull('category', instance.category);
  writeNotNull('image_url', instance.imageUrl);
  writeNotNull('home_url', instance.homeUrl);
  return val;
}
