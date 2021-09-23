import 'package:json_annotation/json_annotation.dart';
import 'package:paypal_sdk/core.dart';

part 'product.g.dart';

/// Product representing a good or a service
@JsonSerializable()
class Product {
  static const String typePhysical = 'PHYSICAL';
  static const String typeDigital = 'DIGITAL';
  static const String typeService = 'SERVICE';

  /// The ID of the product.
  final String id;

  /// The product name.
  final String name;

  /// The product description.
  final String? description;

  /// The product type. Indicates whether the product is physical or digital goods, or a service.
  /// The possible values are:
  /// <ul>
  /// <li>
  /// PHYSICAL. Physical goods
  /// </li>
  /// <li>
  /// DIGITAL. Digital goods
  /// </li>
  /// <li>
  /// SERVICE. Product representing a service. Example: Tech Support
  /// </li>
  /// </ul>
  final String type;

  /// The product category. <a href="https://developer.paypal.com/docs/api/catalog-products/v1/#definition-product_category">
  /// Possible values</a>
  final String? category;

  /// The image URL for the product.
  @JsonKey(name: 'image_url')
  final String? imageUrl;

  /// The home page URL for the product.
  @JsonKey(name: 'home_url')
  final String? homeUrl;

  /// The date and time when the plan was created, in
  /// <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  @JsonKey(name: 'create_time')
  final String createTime;

  /// The date and time when the plan was last updated, in
  /// <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  @JsonKey(name: 'update_time')
  final String? updateTime;

  /// An array of request-related <a href="https://developer.paypal.com/docs/api/reference/api-responses/#hateoas-links">
  /// HATEOAS links</a>.
  final List<LinkDescription>? links;

  const Product(
      this.id,
      this.name,
      this.description,
      this.type,
      this.category,
      this.imageUrl,
      this.homeUrl,
      this.createTime,
      this.updateTime,
      this.links);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  @override
  String toString() {
    return 'Product{id: $id, name: $name, description: $description, '
        'type: $type, category: $category, imageUrl: $imageUrl, '
        'homeUrl: $homeUrl, createTime: $createTime, updateTime: $updateTime, '
        'links: $links}';
  }
}
