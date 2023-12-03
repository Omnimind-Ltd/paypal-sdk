import 'package:flutter_paypal_sdk/core.dart';
import 'package:json_annotation/json_annotation.dart';

import 'card.dart';

part 'payment.g.dart';

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

/// The merchant-preferred payment methods.
enum PayeePreferred {
  /// Accepts any type of payment from the customer.
  @JsonValue('UNRESTRICTED')
  unrestricted,

  /// Accepts only immediate payment from the customer. For example, credit card,
  /// PayPal balance, or instant ACH. Ensures that at the time of capture, the
  /// payment does not have the `pending` status.
  @JsonValue('IMMEDIATE_PAYMENT_REQUIRED')
  immediatePaymentRequired,
}

/// NACHA (the regulatory body governing the ACH network) requires that API callers
/// (merchants, partners) obtain the consumer’s explicit authorization before
/// initiating a transaction. To stay compliant, you’ll need to make sure that
/// you retain a compliant authorization for each transaction that you originate
/// to the ACH Network using this API. ACH transactions are categorized (using
/// SEC codes) by how you capture authorization from the Receiver (the person whose
/// bank account is being debited or credited). PayPal supports the following
/// SEC codes.
enum StandardEntryClassCode {
  ///  The API caller (merchant/partner) accepts authorization and payment
  ///  information from a consumer over the telephone.
  @JsonValue('TEL')
  tel,

  /// The API caller (merchant/partner) accepts Debit transactions from a consumer
  /// on their website.
  @JsonValue('WEB')
  web,

  /// Cash concentration and disbursement for corporate debit transaction. Used
  /// to disburse or consolidate funds. Entries are usually Optional high-dollar,
  /// low-volume, and time-critical. (e.g. intra-company transfers or invoice
  /// payments to suppliers).
  @JsonValue('CCD')
  ccd,

  /// Prearranged payment and deposit entries. Used for debit payments authorized
  /// by a consumer account holder, and usually initiated by a company. These
  /// are usually recurring debits (such as insurance premiums).
  @JsonValue('PPD')
  ppd,
}

/// The action to take on the subscription if the initial payment for the
/// setup fails.
enum SetupFeeFailureAction {
  /// Continues the subscription if the initial payment for the setup
  @JsonValue('CONTINUE')
  continue_,

  /// Cancels the subscription if the initial payment for the setup
  @JsonValue('CANCEL')
  cancel,
}

/// A payment source
@JsonSerializable()
class PaymentSource {
  /// The payment card used to fund the payment. Card can be a credit or debit card.
  final Card card;

  const PaymentSource(this.card);

  Map<String, dynamic> toJson() => _$PaymentSourceToJson(this);

  factory PaymentSource.fromJson(Map<String, dynamic> json) => _$PaymentSourceFromJson(json);

  @override
  String toString() {
    return 'PaymentSource{card: $card}';
  }
}

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
      {required this.amount, required this.time, this.reasonCode, this.nextPaymentRetryTime});

  Map<String, dynamic> toJson() => _$FailedPaymentDetailsToJson(this);

  factory FailedPaymentDetails.fromJson(Map<String, dynamic> json) =>
      _$FailedPaymentDetailsFromJson(json);

  @override
  String toString() {
    return 'FailedPaymentDetails{amount: $amount, time: $time, reasonCode: $reasonCode, '
        'nextPaymentRetryTime: $nextPaymentRetryTime}';
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class PaymentMethod {
  /// The customer-selected payment method on the merchant site.
  final String? payerSelected;

  /// The merchant-preferred payment methods.
  final PayeePreferred? payeePreferred;

  /// NACHA (the regulatory body governing the ACH network) requires that API callers
  /// (merchants, partners) obtain the consumer’s explicit authorization before
  /// initiating a transaction. To stay compliant, you’ll need to make sure that
  /// you retain a compliant authorization for each transaction that you originate
  /// to the ACH Network using this API. ACH transactions are categorized
  /// (using SEC codes) by how you capture authorization from the Receiver
  /// (the person whose bank account is being debited or credited). PayPal
  /// supports the following SEC codes.
  final StandardEntryClassCode? standardEntryClassCode;

  const PaymentMethod({this.payerSelected, this.payeePreferred, this.standardEntryClassCode});

  Map<String, dynamic> toJson() => _$PaymentMethodToJson(this);

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => _$PaymentMethodFromJson(json);

  @override
  String toString() {
    return 'PaymentMethod{payerSelected: $payerSelected, payeePreferred: $payeePreferred, '
        'standardEntryClassCode: $standardEntryClassCode}';
  }
}

/// Payment preferences.
@JsonSerializable(fieldRename: FieldRename.snake)
class PaymentPreferences {
  /// Indicates whether to automatically bill the outstanding amount in the next
  /// billing cycle.
  bool? autoBillOutstanding;

  /// The initial set-up fee for the service.
  Money? setupFee;

  /// The action to take on the subscription if the initial payment for the
  /// setup fails.
  ///
  /// The possible values are:
  /// <ul>
  /// <li>
  /// CONTINUE. Continues the subscription if the initial payment for the setup
  /// fails.
  /// </li>
  /// <li>
  /// CANCEL. Cancels the subscription if the initial payment for the setup
  /// fails.
  /// </li>
  /// </ul>
  SetupFeeFailureAction? setupFeeFailureAction;

  /// The maximum number of payment failures before a subscription is suspended.
  /// For example, if payment_failure_threshold is 2, the subscription
  /// automatically updates to the SUSPEND state if two consecutive payments
  /// fail.
  int? paymentFailureThreshold;

  PaymentPreferences(
      {this.autoBillOutstanding,
      this.setupFee,
      this.setupFeeFailureAction,
      this.paymentFailureThreshold});

  Map<String, dynamic> toJson() => _$PaymentPreferencesToJson(this);

  factory PaymentPreferences.fromJson(Map<String, dynamic> json) =>
      _$PaymentPreferencesFromJson(json);

  @override
  String toString() {
    return 'PaymentPreferences{autoBillOutstanding: $autoBillOutstanding, '
        'setupFee: $setupFee, setupFeeFailureAction: $setupFeeFailureAction, '
        'paymentFailureThreshold: $paymentFailureThreshold}';
  }
}
