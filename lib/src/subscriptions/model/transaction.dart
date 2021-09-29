import 'package:json_annotation/json_annotation.dart';
import 'package:paypal_sdk/core.dart';

import 'amount_with_breakdown.dart';
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
      {this.status,
      this.id,
      this.amountWithBreakdown,
      this.payerName,
      this.payerEmail,
      this.time});

  Map<String, dynamic> toJson() => _$TransactionToJson(this);

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

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

  /// An array of request-related <a href="https://developer.paypal.com/docs/api/reference/api-responses/#hateoas-links">
  /// HATEOAS links</a>.
  final List<LinkDescription>? links;

  TransactionsList(
      this.transactions, this.totalItems, this.totalPages, this.links);

  Map<String, dynamic> toJson() => _$TransactionsListToJson(this);

  factory TransactionsList.fromJson(Map<String, dynamic> json) =>
      _$TransactionsListFromJson(json);

  @override
  String toString() {
    return 'TransactionsList{transactions: $transactions, totalItems: $totalItems, '
        'totalPages: $totalPages, links: $links}';
  }
}
