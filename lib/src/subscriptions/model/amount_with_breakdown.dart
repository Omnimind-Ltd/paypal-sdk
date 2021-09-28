import 'package:json_annotation/json_annotation.dart';
import 'package:paypal_sdk/core.dart';

part 'amount_with_breakdown.g.dart';

/// The breakdown details for the amount. Includes the gross, tax, fee, and
/// shipping amounts.
@JsonSerializable(fieldRename: FieldRename.snake)
class AmountWithBreakdown {
  /// The amount for this transaction.
  final Money grossAmount;

  /// The item total for the transaction.
  final Money? totalItemAmount;

  /// The fee details for the transaction.
  final Money? feeAmount;

  /// The shipping amount for the transaction.
  final Money? shippingAmount;

  /// The tax amount for the transaction.
  final Money? taxAmount;

  /// The net amount that the payee receives for this transaction in their
  /// PayPal account. The net amount is computed as gross_amount minus the
  /// paypal_fee.
  final Money? netAmount;

  AmountWithBreakdown(
      {required this.grossAmount,
      this.totalItemAmount,
      this.feeAmount,
      this.shippingAmount,
      this.taxAmount,
      this.netAmount});

  Map<String, dynamic> toJson() => _$AmountWithBreakdownToJson(this);

  factory AmountWithBreakdown.fromJson(Map<String, dynamic> json) =>
      _$AmountWithBreakdownFromJson(json);

  @override
  String toString() {
    return 'AmountWithBreakdown{grossAmount: $grossAmount, '
        'totalItemAmount: $totalItemAmount, feeAmount: $feeAmount, '
        'shippingAmount: $shippingAmount, taxAmount: $taxAmount, '
        'netAmount: $netAmount}';
  }
}
