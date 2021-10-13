import 'package:json_annotation/json_annotation.dart';
import 'package:paypal_sdk/core.dart';
import 'package:paypal_sdk/src/orders/model/platform_fee.dart';

part 'payment.g.dart';

/// The funds that are held on behalf of the merchant.
enum DisbursementMode {
  /// The funds are released to the merchant immediately.
  @JsonValue('INSTANCE')
  instant,

  /// The funds are held for a finite number of days. The actual duration depends
  /// on the region and type of integration. You can release the funds through a
  /// referenced payout. Otherwise, the funds disbursed automatically after the
  /// specified duration.
  @JsonValue('DELAYED')
  delayed,
}

/// The merchant-preferred payment methods.
enum PayeePreferred {
  /// Accepts any type of payment from the customer.
  unrestricted,

  /// Accepts only immediate payment from the customer. For example, credit card,
  /// PayPal balance, or instant ACH. Ensures that at the time of capture, the
  /// payment does not have the `pending` status.
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

/// The person or party who initiated or triggered the payment.
enum PaymentInitiator {
  /// Payment is initiated with the active engagement of the customer. e.g. a
  /// customer checking out on a merchant website.
  @JsonValue('CUSTOMER')
  customer,

  /// Payment is initiated by merchant on behalf of the customer without the #
  /// active engagement of customer. e.g. a merchant charging the monthly payment
  /// of a subscription to the customer.
  @JsonValue('MERCHANT')
  merchant,
}

/// Indicates the type of the stored payment_source payment.
enum PaymentType {
  /// One Time payment such as online purchase or donation. (e.g. Checkout with
  /// one-click).
  @JsonValue('ONE_TIME')
  oneTime,

  /// Payment which is part of a series of payments with fixed or variable amounts,
  /// following a fixed time interval. (e.g. Subscription payments).
  @JsonValue('RECURRING')
  recurring,

  /// Payment which is part of a series of payments that occur on a non-fixed
  /// schedule and/or have variable amounts. (e.g. Account Topup payments).
  @JsonValue('UNSCHEDULED')
  unscheduled,
}

/// Indicates if this is a first or subsequent payment using a stored payment
/// source (also referred to as stored credential or card on file).
enum Usage {
  /// Indicates the Initial/First payment with a payment_source that is intended
  /// to be stored upon successful processing of the payment.
  @JsonValue('FIRST')
  first,

  /// Indicates a payment using a stored payment_source which has been successfully
  /// used previously for a payment.
  @JsonValue('SUBSEQUENT')
  subsequent,

  /// Indicates that PayPal will derive the value of `FIRST` or `SUBSEQUENT`
  /// based on data available to PayPal.
  @JsonValue('DERIVED')
  derived,
}

/// Name of the card network through which the transaction was routed.
enum Network {
  /// Visa card.
  @JsonValue('VISA')
  visa,

  /// Mastecard card.
  @JsonValue('MASTERCARD')
  mastercard,

  /// Discover card.
  @JsonValue('DISCOVER')
  discover,

  /// American Express card.
  @JsonValue('AMEX')
  amex,

  /// Solo debit card.
  @JsonValue('SOLO')
  solo,

  /// Japan Credit Bureau card.
  @JsonValue('JCB')
  jcb,

  /// Military Star card.
  @JsonValue('STAR')
  star,

  /// Delta Airlines card.
  @JsonValue('DELTA')
  delta,

  /// Switch credit card.
  @JsonValue('SWITCH')
  switch_,

  /// Maestro credit card.
  @JsonValue('MAESTRO')
  maestro,

  /// Carte Bancaire (CB) credit card.
  @JsonValue('CB_NATIONALE')
  cbNationale,

  /// Configoga credit card.
  @JsonValue('CONFIGOGA')
  configoga,

  /// Confidis credit card.
  @JsonValue('CONFIDIS')
  confidis,

  /// Visa Electron credit card.
  @JsonValue('ELECTRON')
  electron,

  /// Cetelem credit card.
  @JsonValue('CETELEM')
  cetelem,

  /// China union pay credit card.
  @JsonValue('CHINA_UNION_PAY')
  chinaUnionPay,
}

/// A payment instruction.
@JsonSerializable(fieldRename: FieldRename.snake)
class PaymentInstruction {
  /// The funds that are held on behalf of the merchant.
  final DisbursementMode? disbursementMode;

  /// This field is only enabled for selected merchants/partners to use and provides
  /// the ability to trigger a specific pricing rate/plan for a payment transaction.
  /// The list of eligible 'payee_pricing_tier_id' would be provided to you by your
  /// Account Manager. Specifying values other than the one provided to you by your
  /// account manager would result in an error.
  final String? payeePricingTierId;

  /// An array of various fees, commissions, tips, or donations. This field is
  /// only applicable to merchants that been enabled for PayPal Commerce Platform
  /// for Marketplaces and Platforms capability.
  final List<PlatformFee>? platformFee;

  const PaymentInstruction({
    this.disbursementMode,
    this.payeePricingTierId,
    this.platformFee,
  });

  Map<String, dynamic> toJson() => _$PaymentInstructionToJson(this);

  factory PaymentInstruction.fromJson(Map<String, dynamic> json) =>
      _$PaymentInstructionFromJson(json);

  @override
  String toString() {
    return 'PaymentInstruction{disbursementMode: $disbursementMode, '
        'payeePricingTierId: $payeePricingTierId, platformFee: $platformFee}';
  }
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

/// A stored payment source
@JsonSerializable(fieldRename: FieldRename.snake)
class StoredPaymentSource {
  /// The person or party who initiated or triggered the payment.
  final PaymentInitiator paymentInitiator;

  /// Indicates the type of the stored payment_source payment.
  final PaymentType paymentType;

  /// Indicates if this is a first or subsequent payment using a stored payment
  /// source (also referred to as stored credential or card on file).
  final Usage? usage;

  /// Reference values used by the card network to identify a transaction
  final NetworkTransactionReference? networkTransactionReference;

  const StoredPaymentSource({
    required this.paymentInitiator,
    required this.paymentType,
    this.usage,
    this.networkTransactionReference,
  });

  Map<String, dynamic> toJson() => _$StoredPaymentSourceToJson(this);

  factory StoredPaymentSource.fromJson(Map<String, dynamic> json) =>
      _$StoredPaymentSourceFromJson(json);

  @override
  String toString() {
    return 'StoredPaymentSource{paymentInitiator: $paymentInitiator, '
        'paymentType: $paymentType, usage: $usage, '
        'networkTransactionReference: $networkTransactionReference}';
  }
}

/// The network transaction reference
@JsonSerializable(fieldRename: FieldRename.snake)
class NetworkTransactionReference {
  /// Transaction reference id returned by the scheme. For Visa and Amex, this
  /// is the "Tran id" field in response. For MasterCard, this is the "BankNet
  /// reference id" field in response. For Discover, this is the "NRID" field
  /// in response.
  final String id;

  /// The date that the transaction was authorized by the scheme. For MasterCard,
  /// this is the "BankNet reference date" field in response.
  final String? date;

  /// Name of the card network through which the transaction was routed.
  final Network network;

  const NetworkTransactionReference({
    required this.id,
    this.date,
    required this.network,
  });

  Map<String, dynamic> toJson() => _$NetworkTransactionReferenceToJson(this);

  factory NetworkTransactionReference.fromJson(Map<String, dynamic> json) =>
      _$NetworkTransactionReferenceFromJson(json);

  @override
  String toString() {
    return 'NetworkTransactionReference{id: $id, date: $date, network: $network}';
  }
}

/// A payment source
@JsonSerializable()
class PaymentSource {
  /// The payment card used to fund the payment. Card can be a credit or debit card.
  final Card card;

  const PaymentSource(this.card);

  Map<String, dynamic> toJson() => _$PaymentSourceToJson(this);

  factory PaymentSource.fromJson(Map<String, dynamic> json) =>
      _$PaymentSourceFromJson(json);

  @override
  String toString() {
    return 'PaymentSource{card: $card}';
  }
}

/// A payment card.
@JsonSerializable(fieldRename: FieldRename.snake)
class Card {
  /// The card holder's name as it appears on the card.
  final String? name;

  /// The billing address for this card. Supports only the address_line_1,
  /// address_line_2, admin_area_1, admin_area_2, postal_code, and country_code properties.
  final AddressPortable? billingAddress;

  /// The last digits of the payment card.
  final String? lastDigits;

  /// The card brand or network. Typically used in the response.
  final Network? brand;

  Card({this.name, this.billingAddress, this.lastDigits, this.brand});

  Map<String, dynamic> toJson() => _$CardToJson(this);

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);

  @override
  String toString() {
    return 'Card{name: $name, billingAddress: $billingAddress, '
        'lastDigits: $lastDigits, brand: $brand}';
  }
}
