import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_paypal_sdk/core.dart';

part 'product.g.dart';

/// The product type.
enum ProductType {
  /// Physical goods
  @JsonValue('PHYSICAL')
  physical,

  /// Digital goods
  @JsonValue('DIGITAL')
  digital,

  /// Product representing a service. Example: Tech Support
  @JsonValue('SERVICE')
  service,
}

/// Product representing a good or a service
@JsonSerializable(fieldRename: FieldRename.snake)
class Product {
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
  final ProductType? type;

  /// The product category. <a href="https://developer.paypal.com/docs/api/catalog-products/v1/#definition-product_category">
  /// Possible values</a>
  final String? category;

  /// The image URL for the product.
  final String? imageUrl;

  /// The home page URL for the product.
  final String? homeUrl;

  /// The date and time when the plan was created, in
  /// <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  final String createTime;

  /// The date and time when the plan was last updated, in
  /// <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  final String? updateTime;

  /// An array of request-related HATEOAS links.
  final List<LinkDescription>? links;

  const Product(
      {required this.id,
      required this.name,
      this.description,
      this.type,
      this.category,
      this.imageUrl,
      this.homeUrl,
      required this.createTime,
      this.updateTime,
      this.links});

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  @override
  String toString() {
    return 'Product{id: $id, name: $name, description: $description, '
        'type: $type, category: $category, imageUrl: $imageUrl, '
        'homeUrl: $homeUrl, createTime: $createTime, updateTime: $updateTime, '
        'links: $links}';
  }
}

/// A collection of catalog products
@JsonSerializable(fieldRename: FieldRename.snake)
class ProductCollection {
  /// An array of products.
  final List<ProductCollectionElement> products;

  /// The total number of items.
  /// Maximum value: 500000000.
  final int? totalItems;

  /// The total number of pages.
  /// Maximum value: 100000000.
  final int? totalPages;

  /// An array of request-related <a href="https://developer.paypal.com/docs/api/reference/api-responses/#hateoas-links">
  /// HATEOAS links.</a>
  final List<LinkDescription>? links;

  const ProductCollection({required this.products, this.totalItems, this.totalPages, this.links});

  Map<String, dynamic> toJson() => _$ProductCollectionToJson(this);

  factory ProductCollection.fromJson(Map<String, dynamic> json) =>
      _$ProductCollectionFromJson(json);

  @override
  String toString() {
    return 'ProductCollection{products: $products, totalItems: $totalItems, '
        'totalPages: $totalPages, links: $links}';
  }
}

/// Product representing a good or a service
@JsonSerializable(fieldRename: FieldRename.snake)
class ProductCollectionElement {
  /// The ID of the product.
  final String id;

  /// The product name.
  final String name;

  /// The product description.
  final String? description;

  /// The date and time when the plan was created, in
  /// <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  final String createTime;

  /// An array of request-related HATEOAS links.
  final List<LinkDescription> links;

  const ProductCollectionElement(this.id, this.name, this.description, this.createTime, this.links);

  Map<String, dynamic> toJson() => _$ProductCollectionElementToJson(this);

  factory ProductCollectionElement.fromJson(Map<String, dynamic> json) =>
      _$ProductCollectionElementFromJson(json);

  @override
  String toString() {
    return 'ProductCollectionElement{id: $id, name: $name, '
        'description: $description, createTime: $createTime, links: $links}';
  }
}

/// Create product request object
@JsonSerializable(fieldRename: FieldRename.snake)
class ProductRequest {
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
  final ProductType type;

  /// The product category. <a href="https://developer.paypal.com/docs/api/catalog-products/v1/#definition-product_category">
  /// Possible values</a>
  String? category;

  /// The image URL for the product.
  String? imageUrl;

  /// The home page URL for the product.
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

  factory ProductRequest.fromJson(Map<String, dynamic> json) => _$ProductRequestFromJson(json);

  @override
  String toString() {
    return 'ProductRequest{id: $id, name: $name, '
        'description: $description, type: $type, category: $category, '
        'imageUrl: $imageUrl, homeUrl: $homeUrl}';
  }
}
