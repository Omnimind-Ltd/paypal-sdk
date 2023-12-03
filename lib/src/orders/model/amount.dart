import 'package:flutter_paypal_sdk/core.dart';
import 'package:json_annotation/json_annotation.dart';

part 'amount.g.dart';

/// Amount with breakdown.
@JsonSerializable(fieldRename: FieldRename.snake)
class AmountWithBreakdown {
  /// The <a href="https://developer.paypal.com/docs/integration/direct/rest/currency-codes/">
  /// three-character ISO-4217 currency code</a> that identifies the currency.
  final String currencyCode;

  /// The value, which might be:
  /// <ul>
  /// <li>
  /// An integer for currencies like JPY that are not typically fractional.
  /// </li>
  /// <li>
  ///  A decimal fraction for currencies like TND that are subdivided into thousandths.
  /// </li>
  /// For the required number of decimal places for a currency code, see
  /// <a href="https://developer.paypal.com/docs/integration/direct/rest/currency-codes/">Currency Codes</a>.
  final String value;

  /// The breakdown of the amount. Breakdown provides details such as total item
  /// amount, total tax amount, shipping, handling, insurance, and discounts,
  /// if any.
  final AmountBreakdown? breakdown;

  const AmountWithBreakdown({
    required this.currencyCode,
    required this.value,
    this.breakdown,
  });

  Map<String, dynamic> toJson() => _$AmountWithBreakdownToJson(this);

  factory AmountWithBreakdown.fromJson(Map<String, dynamic> json) =>
      _$AmountWithBreakdownFromJson(json);

  @override
  String toString() {
    return 'AmountWithBreakdown{currencyCode: $currencyCode, value: $value, '
        'breakdown: $breakdown}';
  }
}

/// Amount breakdown.
@JsonSerializable(fieldRename: FieldRename.snake)
class AmountBreakdown {
  /// The subtotal for all items. Required if the request includes
  /// purchase_units[].items[].unit_amount. Must equal the sum of
  /// (items[].unit_amount * items[].quantity) for all items. item_total.value
  /// can not be a negative number.
  final Money? itemTotal;

  /// The shipping fee for all items within a given purchase_unit. shipping.value
  /// can not be a negative number.
  final Money? shipping;

  /// The handling fee for all items within a given purchase_unit. handling.value
  /// can not be a negative number.
  final Money? handling;

  /// The total tax for all items. Required if the request includes purchase_units.items.tax.
  /// Must equal the sum of (items[].tax * items[].quantity) for all items.
  /// tax_total.value can not be a negative number.
  final Money? taxTotal;

  /// The insurance fee for all items within a given purchase_unit. insurance.value
  /// can not be a negative number.
  final Money? insurance;

  /// The shipping discount for all items within a given purchase_unit.
  /// shipping_discount.value can not be a negative number.
  final Money? shippingDiscount;

  /// The discount for all items within a given purchase_unit. discount.value
  /// can not be a negative number.
  final Money? discount;

  const AmountBreakdown({
    this.itemTotal,
    this.shipping,
    this.handling,
    this.taxTotal,
    this.insurance,
    this.shippingDiscount,
    this.discount,
  });

  Map<String, dynamic> toJson() => _$AmountBreakdownToJson(this);

  factory AmountBreakdown.fromJson(Map<String, dynamic> json) => _$AmountBreakdownFromJson(json);

  @override
  String toString() {
    return 'AmountBreakdown{itemTotal: $itemTotal, shipping: $shipping, '
        'handling: $handling, taxTotal: $taxTotal, insurance: $insurance, '
        'shippingDiscount: $shippingDiscount, discount: $discount}';
  }
}
