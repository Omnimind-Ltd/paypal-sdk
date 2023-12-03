import 'package:flutter_paypal_sdk/core.dart';
import 'package:flutter_paypal_sdk/orders.dart';
import 'package:json_annotation/json_annotation.dart';

part 'purchase_unit.g.dart';

/// A purchase unit request item
@JsonSerializable(fieldRename: FieldRename.snake)
class PurchaseUnitRequest {
  /// The API caller-provided external ID for the purchase unit. Required for
  /// multiple purchase units when you must update the order through PATCH. If
  /// you omit this value and the order contains only one purchase unit, PayPal
  /// sets this value to default.
  final String? referenceId;

  /// The total order amount with an optional breakdown that provides details,
  /// such as the total item amount, total tax amount, shipping, handling,
  /// insurance, and discounts, if any. If you specify amount.breakdown, the
  /// amount equals item_total plus tax_total plus shipping plus handling plus
  /// insurance minus shipping_discount minus discount. The amount must be a
  /// positive number. For listed of supported currencies and decimal precision,
  /// see the PayPal REST APIs Currency Codes.
  final AmountWithBreakdown amount;

  /// The merchant who receives payment for this transaction.
  final Payee? payee;

  /// Any additional payment instructions to be consider during payment processing.
  /// This processing instruction is applicable for Capturing an order or
  /// Authorizing an Order.
  final PaymentInstruction? paymentInstruction;

  /// The purchase description.
  final String? description;

  /// The API caller-provided external ID. Used to reconcile client transactions
  /// with PayPal transactions. Appears in transaction and settlement reports
  /// but is not visible to the payer.
  final String? customId;

  /// The API caller-provided external invoice number for this order. Appears in
  /// both the payer's transaction history and the emails that the payer receives.
  final String? invoiceId;

  /// The soft descriptor is the dynamic text used to construct the statement
  /// descriptor that appears on a payer's card statement.
  ///
  /// If an Order is paid using the "PayPal Wallet", the statement descriptor will
  /// appear in following format on the payer's card statement:
  /// PAYPAL_prefix+(space)+merchant_descriptor+(space)+ soft_descriptor
  ///
  /// The PAYPAL prefix uses 8 characters. Only the first 22 characters will be displayed in the statement.
  /// For example, if:
  /// The PayPal prefix toggle is PAYPAL .
  /// The merchant descriptor in the profile is Janes Gift.
  /// The soft descriptor is 800-123-1234.
  /// Then, the statement descriptor on the card is PAYPAL Janes Gift 80.
  final String? softDescriptor;

  const PurchaseUnitRequest({
    this.referenceId,
    required this.amount,
    this.payee,
    this.paymentInstruction,
    this.description,
    this.customId,
    this.invoiceId,
    this.softDescriptor,
  });

  Map<String, dynamic> toJson() => _$PurchaseUnitRequestToJson(this);

  factory PurchaseUnitRequest.fromJson(Map<String, dynamic> json) =>
      _$PurchaseUnitRequestFromJson(json);

  @override
  String toString() {
    return 'PurchaseUnitRequest{referenceId: $referenceId, amount: $amount, '
        'payee: $payee, paymentInstruction: $paymentInstruction, description: $description, '
        'customId: $customId, invoiceId: $invoiceId, softDescriptor: $softDescriptor}';
  }
}

/// A purchase unit item
@JsonSerializable(fieldRename: FieldRename.snake)
class PurchaseUnit {
  /// The API caller-provided external ID for the purchase unit. Required for
  /// multiple purchase units when you must update the order through PATCH. If
  /// you omit this value and the order contains only one purchase unit, PayPal
  /// sets this value to default.
  final String? referenceId;

  /// The total order amount with an optional breakdown that provides details,
  /// such as the total item amount, total tax amount, shipping, handling,
  /// insurance, and discounts, if any. If you specify amount.breakdown, the
  /// amount equals item_total plus tax_total plus shipping plus handling plus
  /// insurance minus shipping_discount minus discount. The amount must be a
  /// positive number. For listed of supported currencies and decimal precision,
  /// see the PayPal REST APIs Currency Codes.
  final AmountWithBreakdown amount;

  /// The merchant who receives payment for this transaction.
  final Payee? payee;

  /// Any additional payment instructions to be consider during payment processing.
  /// This processing instruction is applicable for Capturing an order or
  /// Authorizing an Order.
  final PaymentInstruction? paymentInstruction;

  /// The purchase description.
  final String? description;

  /// The API caller-provided external ID. Used to reconcile client transactions
  /// with PayPal transactions. Appears in transaction and settlement reports
  /// but is not visible to the payer.
  final String? customId;

  /// The API caller-provided external invoice number for this order. Appears in
  /// both the payer's transaction history and the emails that the payer receives.
  final String? invoiceId;

  /// The soft descriptor is the dynamic text used to construct the statement
  /// descriptor that appears on a payer's card statement.
  ///
  /// If an Order is paid using the "PayPal Wallet", the statement descriptor will
  /// appear in following format on the payer's card statement:
  /// PAYPAL_prefix+(space)+merchant_descriptor+(space)+ soft_descriptor
  ///
  /// The PAYPAL prefix uses 8 characters. Only the first 22 characters will be displayed in the statement.
  /// For example, if:
  /// The PayPal prefix toggle is PAYPAL .
  /// The merchant descriptor in the profile is Janes Gift.
  /// The soft descriptor is 800-123-1234.
  /// Then, the statement descriptor on the card is PAYPAL Janes Gift 80.
  final String? softDescriptor;

  /// The PayPal-generated ID for the purchase unit. This ID appears in both the
  /// payer's transaction history and the emails that the payer receives. In
  /// addition, this ID is available in transaction and settlement reports that
  /// merchants and API callers can use to reconcile transactions. This ID is
  /// only available when an order is saved by calling v2/checkout/orders/id/save.
  final String? id;

  /// An array of items that the customer purchases from the merchant.
  final List<Item>? items;

  /// The shipping address and method.
  final ShippingDetail? shipping;

  /// The comprehensive history of payments for the purchase unit.
  final PaymentCollection? payments;

  PurchaseUnit(
      {this.referenceId,
      required this.amount,
      this.payee,
      this.paymentInstruction,
      this.description,
      this.customId,
      this.invoiceId,
      this.softDescriptor,
      this.id,
      this.items,
      this.shipping,
      this.payments});

  Map<String, dynamic> toJson() => _$PurchaseUnitToJson(this);

  factory PurchaseUnit.fromJson(Map<String, dynamic> json) => _$PurchaseUnitFromJson(json);

  @override
  String toString() {
    return 'PurchaseUnit{referenceId: $referenceId, amount: $amount, payee: $payee, '
        'paymentInstruction: $paymentInstruction, description: $description, '
        'customId: $customId, invoiceId: $invoiceId, softDescriptor: $softDescriptor, '
        'id: $id, items: $items, shipping: $shipping, payments: $payments}';
  }
}
