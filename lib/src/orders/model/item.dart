import 'package:flutter_paypal_sdk/core.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

/// The item category type.
enum ItemCategory {
  /// Goods that are stored, delivered, and used in their electronic format. This
  /// value is not currently supported for API callers that leverage the
  /// [PayPal for Commerce Platform](<a href="https://www.paypal.com/us/webapps/mpp/commerce-platform">https://www.paypal.com/us/webapps/mpp/commerce-platform</a>) product.
  @JsonValue('DIGITAL_GOODS')
  digitalGoods,

  /// A tangible item that can be shipped with proof of delivery.
  @JsonValue('PHYSICAL_GOODS')
  physicalGoods,

  /// A contribution or gift for which no good or service is exchanged, usually to a not for profit organization.
  @JsonValue('DONATION')
  donation,
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Item {
  /// The item name or title.
  final String? name;

  /// The item price or rate per unit. If you specify unit_amount,
  /// purchase_units[].amount.breakdown.item_total is required. Must equal
  /// unit_amount * quantity for all items. unit_amount.value can not be a negative number.
  final Money unitAmount;

  /// The item tax for each unit. If tax is specified,
  /// purchase_units[].amount.breakdown.tax_total is required. Must equal tax *
  /// quantity for all items. tax.value can not be a negative number.
  final Money? tax;

  /// The item quantity. Must be a whole number.
  final String quantity;

  /// The detailed item description.
  final String? description;

  /// The stock keeping unit (SKU) for the item.
  final String? sku;

  /// The item category type.
  final ItemCategory? category;

  const Item({
    this.name,
    required this.unitAmount,
    this.tax,
    required this.quantity,
    this.description,
    this.sku,
    this.category,
  });

  Map<String, dynamic> toJson() => _$ItemToJson(this);

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  @override
  String toString() {
    return 'Item{name: $name, unitAmount: $unitAmount, tax: $tax, '
        'quantity: $quantity, description: $description, sku: $sku, '
        'category: $category}';
  }
}
