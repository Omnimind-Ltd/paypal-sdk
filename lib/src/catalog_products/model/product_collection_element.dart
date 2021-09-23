import 'package:json_annotation/json_annotation.dart';
import 'package:paypal_sdk/core.dart';

part 'product_collection_element.g.dart';

/// Product representing a good or a service
@JsonSerializable()
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
  @JsonKey(name: 'create_time')
  final String createTime;

  /// An array of request-related <a href="https://developer.paypal.com/docs/api/reference/api-responses/#hateoas-links">
  /// HATEOAS links</a>.
  final List<LinkDescription> links;

  const ProductCollectionElement(
      this.id, this.name, this.description, this.createTime, this.links);

  Map<String, dynamic> toJson() => _$ProductCollectionElementToJson(this);

  factory ProductCollectionElement.fromJson(Map<String, dynamic> json) =>
      _$ProductCollectionElementFromJson(json);

  @override
  String toString() {
    return 'ProductCollectionElement{id: $id, name: $name, '
        'description: $description, createTime: $createTime, links: $links}';
  }
}
