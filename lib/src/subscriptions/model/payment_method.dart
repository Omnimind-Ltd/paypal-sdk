import 'package:json_annotation/json_annotation.dart';

part 'payment_method.g.dart';

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

/// The payment method.
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

  const PaymentMethod(
      {this.payerSelected, this.payeePreferred, this.standardEntryClassCode});

  Map<String, dynamic> toJson() => _$PaymentMethodToJson(this);

  factory PaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodFromJson(json);

  @override
  String toString() {
    return 'PaymentMethod{payerSelected: $payerSelected, payeePreferred: $payeePreferred, '
        'standardEntryClassCode: $standardEntryClassCode}';
  }
}
