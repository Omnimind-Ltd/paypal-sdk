import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_paypal_sdk/core.dart';

import 'seller.dart';

part 'capture.g.dart';

/// Captured payment details request body
@JsonSerializable(fieldRename: FieldRename.snake)
class CaptureRequest {
  /// The API caller-provided external invoice number for this order. Appears in
  /// both the payer's transaction history and the emails that the payer receives.
  final String? invoiceId;

  /// An informational note about this settlement. Appears in both the payer's
  /// transaction history and the emails that the payer receives.
  final String? noteToPayer;

  /// The amount to capture. To capture a portion of the full authorized amount,
  /// specify an amount. If amount is not specified, the full authorized amount
  /// is captured. The amount must be a positive number and in the same currency
  /// as the authorization against which the payment is being captured.
  final Money? amount;

  /// Indicates whether you can make additional captures against the authorized
  /// payment. Set to true if you do not intend to capture additional payments
  /// against the authorization. Set to false if you intend to capture additional
  /// payments against the authorization.
  final bool? finalCapture;

  /// Any additional payment instructions to be consider during payment processing.
  /// This processing instruction is applicable for Capturing an order or Authorizing an Order.
  final PaymentInstruction? paymentInstruction;

  /// The payment descriptor on the payer's account statement.
  final String? softDescriptor;

  const CaptureRequest(
      {this.invoiceId,
      this.noteToPayer,
      this.amount,
      this.finalCapture,
      this.paymentInstruction,
      this.softDescriptor});

  Map<String, dynamic> toJson() => _$CaptureRequestToJson(this);

  factory CaptureRequest.fromJson(Map<String, dynamic> json) => _$CaptureRequestFromJson(json);

  @override
  String toString() {
    return 'CaptureRequest{invoiceId: $invoiceId, noteToPayer: $noteToPayer, '
        'amount: $amount, finalCapture: $finalCapture, paymentInstruction: $paymentInstruction, '
        'softDescriptor: $softDescriptor}';
  }
}

/// Captured payment details.
@JsonSerializable(fieldRename: FieldRename.snake)
class Capture {
  /// The status of the captured payment.
  final CaptureStatus? status;

  /// The details of the captured payment status.
  final CaptureStatusDetails? statusDetails;

  /// The PayPal-generated ID for the captured payment.
  final String? id;

  /// The amount for this captured payment.
  final Money? amount;

  /// The API caller-provided external invoice number for this order. Appears in
  /// both the payer's transaction history and the emails that the payer receives.
  final String? invoiceId;

  /// The API caller-provided external ID. Used to reconcile API caller-initiated
  /// transactions with PayPal transactions. Appears in transaction and settlement reports.
  final String? customId;

  /// The level of protection offered as defined by <a href="https://www.paypal.com/us/webapps/mpp/security/seller-protection?_ga=1.140339635.1448511272.1641218402">PayPal Seller Protection for Merchants</a>.
  final SellerProtection? sellerProtection;

  /// Indicates whether you can make additional captures against the authorized payment.
  /// Set to true if you do not intend to capture additional payments against the authorization.
  /// Set to false if you intend to capture additional payments against the authorization.
  final bool? finalCapture;

  /// The detailed breakdown of the capture activity. This is not available for
  /// transactions that are in pending state.
  final SellerReceivableBreakdown? sellerReceivableBreakdown;

  /// The funds that are held on behalf of the merchant.
  final DisbursementMode? disbursementMode;

  /// An array of request-related HATEOAS links.
  final List<LinkDescription>? links;

  /// An object that provides additional processor information for a direct credit
  /// card transaction.
  final ProcessorResponse? processorResponse;

  /// The date and time when the transaction occurred, in
  /// <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  final String? createTime;

  /// The date and time when the transaction was last updated, in
  /// <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  final String? updateTime;

  const Capture(
      this.status,
      this.statusDetails,
      this.id,
      this.amount,
      this.invoiceId,
      this.customId,
      this.sellerProtection,
      this.finalCapture,
      this.sellerReceivableBreakdown,
      this.disbursementMode,
      this.links,
      this.processorResponse,
      this.createTime,
      this.updateTime);

  Map<String, dynamic> toJson() => _$CaptureToJson(this);

  factory Capture.fromJson(Map<String, dynamic> json) => _$CaptureFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CaptureStatusDetails {
  /// The reason why the captured payment status is PENDING or DENIED.
  final CaptureStatusReason? reason;

  const CaptureStatusDetails(this.reason);

  Map<String, dynamic> toJson() => _$CaptureStatusDetailsToJson(this);

  factory CaptureStatusDetails.fromJson(Map<String, dynamic> json) =>
      _$CaptureStatusDetailsFromJson(json);
}

/// The status of the captured payment.
enum CaptureStatus {
  /// The funds for this captured payment were credited to the payee's PayPal account.
  @JsonValue('COMPLETED')
  completed,

  /// The funds could not be captured.
  @JsonValue('DECLINED')
  declined,

  /// An amount less than this captured payment's amount was partially refunded to the payer.
  @JsonValue('PARTIALLY_REFUNDED')
  partiallyRefunded,

  /// The funds for this captured payment was not yet credited to the payee's PayPal account. For more information, see status.details.
  @JsonValue('PENDING')
  pending,

  /// An amount greater than or equal to this captured payment's amount was refunded to the payer.
  @JsonValue('REFUNDED')
  refunded,

  /// There was an error while capturing payment.
  @JsonValue('FAILED')
  failed,
}
