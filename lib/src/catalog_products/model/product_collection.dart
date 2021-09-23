import 'package:json_annotation/json_annotation.dart';
import 'package:paypal_sdk/core.dart';
import 'package:paypal_sdk/src/catalog_products/model/product_collection_element.dart';

part 'product_collection.g.dart';

/// A collection of catalog products
@JsonSerializable()
class ProductCollection {
  /// An array of products.
  final List<ProductCollectionElement> products;

  /// The total number of items.
  /// Maximum value: 500000000.
  @JsonKey(name: 'total_items')
  final int? totalItems;

  /// The total number of pages.
  /// Maximum value: 100000000.
  @JsonKey(name: 'total_pages')
  final int? totalPages;

  /// An array of request-related <a href="https://developer.paypal.com/docs/api/reference/api-responses/#hateoas-links">
  /// HATEOAS links.</a>
  final List<LinkDescription>? links;

  const ProductCollection(
      {required this.products, this.totalItems, this.totalPages, this.links});

  Map<String, dynamic> toJson() => _$ProductCollectionToJson(this);

  factory ProductCollection.fromJson(Map<String, dynamic> json) =>
      _$ProductCollectionFromJson(json);

  @override
  String toString() {
    return 'ProductCollection{products: $products, totalItems: $totalItems, '
        'totalPages: $totalPages, links: $links}';
  }
}
