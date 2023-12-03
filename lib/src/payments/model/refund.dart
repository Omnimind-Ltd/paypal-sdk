import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_paypal_sdk/core.dart';

part 'refund.g.dart';

/// Refund request.
@JsonSerializable(fieldRename: FieldRename.snake)
class RefundRequest {
  /// The amount to refund. To refund a portion of the captured amount, specify an amount.
  /// If amount is not specified, an amount equal to captured amount - previous refunds
  /// is refunded. The amount must be a positive number and in the same currency as the
  /// one in which the payment was captured.
  final Money? amount;

  /// The API caller-provided external invoice number for this order. Appears in both
  /// the payer's transaction history and the emails that the payer receives.
  final String? invoiceId;

  /// The reason for the refund. Appears in both the payer's transaction history and
  /// the emails that the payer receives.
  final String? noteToPayer;

  const RefundRequest({this.amount, this.invoiceId, this.noteToPayer});

  Map<String, dynamic> toJson() => _$RefundRequestToJson(this);

  factory RefundRequest.fromJson(Map<String, dynamic> json) => _$RefundRequestFromJson(json);

  @override
  String toString() {
    return 'RefundRequest{amount: $amount, invoiceId: $invoiceId, noteToPayer: $noteToPayer}';
  }
}

/// Refund details.
@JsonSerializable(fieldRename: FieldRename.snake)
class Refund {
  /// The status of the refund.
  final RefundStatus? status;

  /// The details of the refund status.
  final RefundStatusDetails? statusDetails;

  /// The PayPal-generated ID for the refund.
  final String? id;

  /// The amount that the payee refunded to the payer.
  final Money? amount;

  /// The API caller-provided external invoice number for this order. Appears in
  /// both the payer's transaction history and the emails that the payer receives.
  final String? invoiceId;

  /// The reason for the refund. Appears in both the payer's transaction history
  /// and the emails that the payer receives.
  final String? noteToPayer;

  /// The breakdown of the refund.
  final SellerPayableBreakdown? sellerPayableBreakdown;

  /// An array of request-related HATEOAS links.
  final List<LinkDescription>? links;

  /// The date and time when the transaction occurred, in
  /// <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  final String? createTime;

  /// The date and time when the transaction was last updated, in
  /// <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  final String? updateTime;

  const Refund(this.status, this.statusDetails, this.id, this.amount, this.invoiceId,
      this.noteToPayer, this.sellerPayableBreakdown, this.links, this.createTime, this.updateTime);

  Map<String, dynamic> toJson() => _$RefundToJson(this);

  factory Refund.fromJson(Map<String, dynamic> json) => _$RefundFromJson(json);

  @override
  String toString() {
    return 'Refund{status: $status, statusDetails: $statusDetails, id: $id, amount: $amount, '
        'invoiceId: $invoiceId, noteToPayer: $noteToPayer, sellerPayableBreakdown: $sellerPayableBreakdown, '
        'links: $links, createTime: $createTime, updateTime: $updateTime}';
  }
}

/// The status of the refund.
enum RefundStatus {
  /// The refund was cancelled.
  @JsonValue('CANCELLED')
  cancelled,

  /// The refund is pending. For more information, see status_details.reason.
  @JsonValue('PENDING')
  pending,

  /// The funds for this transaction were debited to the customer's account.
  @JsonValue('COMPLETED')
  completed,
}

/// The detailed breakdown of the capture activity. This is not available for transactions that are in pending state.
@JsonSerializable(fieldRename: FieldRename.snake)
class SellerPayableBreakdown {
  /// The amount that the payee refunded to the payer.
  final Money? grossAmount;

  /// The PayPal fee that was refunded to the payer in the currency of the transaction. This fee might not match the PayPal fee that the payee paid when the payment was captured.
  final Money? paypalFee;

  /// he PayPal fee that was refunded to the payer in the receivable currency. Returned
  /// only in cases when the receivable currency is different from transaction
  /// currency. Example 'CNY'.
  final Money? paypalFeeInReceivableCurrency;

  /// The net amount that the payee's account is debited in the transaction currency.
  /// The net amount is calculated as gross_amount minus paypal_fee minus platform_fees.
  final Money? netAmount;

  /// The net amount that the payee's account is debited in the receivable currency.
  /// Returned only in cases when the receivable currency is different from transaction
  /// currency. Example 'CNY'.
  final Money? netAmountInReceivableCurrency;

  /// An array of platform or partner fees, commissions, or brokerage fees for the refund.
  final List<PlatformFee>? platformFees;

  /// An array of breakdown values for the net amount. Returned when the currency
  /// of the refund is different from the currency of the PayPal account where the
  /// payee holds their funds.
  final Money? netAmountBreakdown;

  /// The total amount refunded from the original capture to date. For example,
  /// if a payer makes a $100 purchase and was refunded $20 a week ago and was refunded
  /// $30 in this refund, the gross_amount is $30 for this refund and the total_refunded_amount is $50.
  final Money? totalRefundedAmount;

  const SellerPayableBreakdown(
      this.grossAmount,
      this.paypalFee,
      this.paypalFeeInReceivableCurrency,
      this.netAmount,
      this.netAmountInReceivableCurrency,
      this.platformFees,
      this.netAmountBreakdown,
      this.totalRefundedAmount);

  Map<String, dynamic> toJson() => _$SellerPayableBreakdownToJson(this);

  factory SellerPayableBreakdown.fromJson(Map<String, dynamic> json) =>
      _$SellerPayableBreakdownFromJson(json);

  @override
  String toString() {
    return 'SellerPayableBreakdown{grossAmount: $grossAmount, paypalFee: $paypalFee, '
        'paypalFeeInReceivableCurrency: $paypalFeeInReceivableCurrency, '
        'netAmount: $netAmount, netAmountInReceivableCurrency: $netAmountInReceivableCurrency, '
        'platformFees: $platformFees, netAmountBreakdown: $netAmountBreakdown, '
        'totalRefundedAmount: $totalRefundedAmount}';
  }
}
