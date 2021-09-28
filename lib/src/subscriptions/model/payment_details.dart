import 'package:json_annotation/json_annotation.dart';
import 'package:paypal_sdk/core.dart';

part 'payment_details.g.dart';

/// The details of the last payment.
@JsonSerializable(fieldRename: FieldRename.snake)
class LastPaymentDetails {
  /// The status of the captured payment.
  final String? status;

  /// The last payment amount.
  final Money? amount;

  /// The date and time when the last payment was made, in
  /// <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  final String? time;

  const LastPaymentDetails({this.status, this.amount, this.time});

  Map<String, dynamic> toJson() => _$LastPaymentDetailsToJson(this);

  factory LastPaymentDetails.fromJson(Map<String, dynamic> json) =>
      _$LastPaymentDetailsFromJson(json);

  @override
  String toString() {
    return 'LastPaymentDetails{status: $status, amount: $amount, time: $time}';
  }
}

/// The reason code for the payment failure.
enum FailedPaymentReason {
  /// PayPal declined the payment due to one or more customer issues.
  paymentDenied,

  /// An internal server error has occurred.
  internalServerError,

  /// The payee account is not in good standing and cannot receive payments.
  payeeAccountRestricted,

  /// The payer account is not in good standing and cannot make payments.
  payerAccountRestricted,

  /// Payer cannot pay for this transaction.
  payerCannotPay,

  /// The transaction exceeds the payer's sending limit.
  sendingLimitExceeded,

  /// The transaction exceeds the receiver's receiving limit.
  transactionReceivingLimitExceeded,

  /// The transaction is declined due to a currency mismatch.
  currencyMismatch,
}

/// Failed payment details.
@JsonSerializable(fieldRename: FieldRename.snake)
class FailedPaymentDetails {
  /// The failed payment amount.
  final Money amount;

  /// The date and time when the failed payment was made, in
  /// <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  final String time;

  /// The reason code for the payment failure.
  final FailedPaymentReason? reasonCode;

  /// The time when the retry attempt for the failed payment occurs, in
  /// <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  final String? nextPaymentRetryTime;

  const FailedPaymentDetails(
      {required this.amount,
      required this.time,
      this.reasonCode,
      this.nextPaymentRetryTime});

  Map<String, dynamic> toJson() => _$FailedPaymentDetailsToJson(this);

  factory FailedPaymentDetails.fromJson(Map<String, dynamic> json) =>
      _$FailedPaymentDetailsFromJson(json);

  @override
  String toString() {
    return 'FailedPaymentDetails{amount: $amount, time: $time, reasonCode: $reasonCode, '
        'nextPaymentRetryTime: $nextPaymentRetryTime}';
  }
}
