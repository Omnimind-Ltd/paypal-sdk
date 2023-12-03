import 'package:flutter_paypal_sdk/core.dart';
import 'package:json_annotation/json_annotation.dart';

import 'subscription.dart';

part 'transaction.g.dart';

/// A transaction for a subscription
@JsonSerializable(fieldRename: FieldRename.snake)
class Transaction {
  /// The status of the captured payment.
  final CaptureStatus? status;

  /// The PayPal-generated transaction ID.
  final String? id;

  /// The breakdown details for the amount. Includes the gross, tax, fee, and shipping amounts.
  final AmountWithBreakdown? amountWithBreakdown;

  /// The name of the customer.
  final Name? payerName;

  /// The email ID of the customer.
  final String? payerEmail;

  /// The date and time when the transaction was processed, in
  /// <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  final String? time;

  Transaction(
      {this.status, this.id, this.amountWithBreakdown, this.payerName, this.payerEmail, this.time});

  Map<String, dynamic> toJson() => _$TransactionToJson(this);

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);

  @override
  String toString() {
    return 'Transaction{status: $status, id: $id, '
        'amountWithBreakdown: $amountWithBreakdown, payerName: $payerName, '
        'payerEmail: $payerEmail, time: $time}';
  }
}

/// List transactions response
@JsonSerializable(fieldRename: FieldRename.snake)
class TransactionsList {
  /// An array of transactions.
  final List<Transaction> transactions;

  /// The total number of items.
  final int? totalItems;

  /// The total number of pages.
  final int? totalPages;

  /// An array of request-related HATEOAS links.
  final List<LinkDescription>? links;

  TransactionsList(this.transactions, this.totalItems, this.totalPages, this.links);

  Map<String, dynamic> toJson() => _$TransactionsListToJson(this);

  factory TransactionsList.fromJson(Map<String, dynamic> json) => _$TransactionsListFromJson(json);

  @override
  String toString() {
    return 'TransactionsList{transactions: $transactions, totalItems: $totalItems, '
        'totalPages: $totalPages, links: $links}';
  }
}

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
