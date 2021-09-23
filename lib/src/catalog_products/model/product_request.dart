import 'package:json_annotation/json_annotation.dart';

part 'product_request.g.dart';

/// Create product request object
@JsonSerializable()
class ProductRequest {
  static const String typePhysical = 'PHYSICAL';
  static const String typeDigital = 'DIGITAL';
  static const String typeService = 'SERVICE';

  /// The ID of the product. You can specify the SKU for the product. If you omit
  /// the ID, the system generates it. System-generated IDs have the PROD- prefix.
  String? id;

  /// The product name.
  final String name;

  /// The product description.
  String? description;

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
  String? category;

  /// The image URL for the product.
  @JsonKey(name: 'image_url')
  String? imageUrl;

  /// The home page URL for the product.
  @JsonKey(name: 'home_url')
  String? homeUrl;

  ProductRequest({
    required this.name,
    required this.type,
    this.id,
    this.description,
    this.category,
    this.imageUrl,
    this.homeUrl,
  });

  Map<String, dynamic> toJson() => _$ProductRequestToJson(this);

  factory ProductRequest.fromJson(Map<String, dynamic> json) =>
      _$ProductRequestFromJson(json);

  @override
  String toString() {
    return 'ProductRequest{id: $id, name: $name, '
        'description: $description, type: $type, category: $category, '
        'imageUrl: $imageUrl, homeUrl: $homeUrl}';
  }
}
