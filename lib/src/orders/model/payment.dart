import 'package:json_annotation/json_annotation.dart';
import 'package:paypal_sdk/core.dart';

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

/// The reason why the refund has the PENDING or FAILED status.
enum RefundStatusReason {
  ///  The customer's account is funded through an eCheck, which has not yet cleared.
  @JsonValue('ECHECK')
  echeck,
}

/// The status of the refund.
enum RefundStatusValue {
  /// The refund was cancelled.
  @JsonValue('CANCELLED')
  cancelled,

  ///  The refund is pending. For more information, see status_details.reason.
  @JsonValue('PENDING')
  pending,

  /// The funds for this transaction were debited to the customer's account.
  @JsonValue('COMPLETED')
  completed,
}

/// The reason why the captured payment status is PENDING or DENIED.
enum CaptureStatusDetails {
  /// The payer initiated a dispute for this captured payment with PayPal.
  @JsonValue('BUYER_COMPLAINT')
  buyerComplaint,

  /// The captured funds were reversed in response to the payer disputing this
  /// captured payment with the issuer of the financial instrument used to pay for this captured payment.
  @JsonValue('CHARGEBACK')
  chargeback,

  /// The payer paid by an eCheck that has not yet cleared.
  @JsonValue('ECHECK')
  echeck,

  /// Visit your online account. In your **Account Overview**, accept and deny this payment.
  @JsonValue('INTERNATIONAL_WITHDRAWAL')
  internationalWithdrawal,

  /// No additional specific reason can be provided. For more information about this captured payment, visit your account online or contact PayPal.
  @JsonValue('OTHER')
  other,

  /// The captured payment is pending manual review.
  @JsonValue('PENDING_REVIEW')
  pendingReview,

  /// The payee has not yet set up appropriate receiving preferences for their account.
  /// For more information about how to accept or deny this payment, visit your account
  /// online. This reason is typically offered in scenarios such as when the currency
  /// of the captured payment is different from the primary holding currency of the payee.
  @JsonValue('RECEIVING_PREFERENCE_MANDATES_MANUAL_ACTION')
  receivingPreferenceMandatesManualAction,

  /// The captured funds were refunded.
  @JsonValue('REFUNDED')
  refunded,

  /// The payer must send the funds for this captured payment. This code generally appears for manual EFTs.
  @JsonValue('TRANSACTION_APPROVED_AWAITING_FUNDING')
  transactionApprovedAwaitingFunding,

  /// The payee does not have a PayPal account.
  @JsonValue('UNILATERAL')
  unilateral,

  /// The payee's PayPal account is not verified.
  @JsonValue('VERIFICATION_REQUIRED')
  verificationRequired,
}

/// Indicates whether the transaction is eligible for seller protection. For
/// information, see <a href="https://www.paypal.com/us/webapps/mpp/security/seller-protection?_ga=1.13945719.134270098.1627037710">
/// PayPal Seller Protection for Merchants</a>.
enum SellerProtectionStatus {
  /// Your PayPal balance remains intact if the customer claims that they did not
  /// receive an item or the account holder claims that they did not authorize the payment.
  @JsonValue('ELIGIBLE')
  eligible,

  /// Your PayPal balance remains intact if the customer claims that they did
  /// not receive an item.
  @JsonValue('PARTIALLY_ELIGIBLE')
  partiallyEligible,

  /// This transaction is not eligible for seller protection.
  @JsonValue('NOT_ELIGIBLE')
  notEligible,
}

/// The condition that is covered for the transaction.
enum DisputeCategoryValue {
  /// The payer paid for an item that they did not receive.
  @JsonValue('ITEM_NOT_RECEIVED')
  itemNotReceived,

  /// The payer did not authorize the payment.
  @JsonValue('UNAUTHORIZED_TRANSACTION')
  unauthorizedTransaction,
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

/// A payment source with token
@JsonSerializable()
class PaymentSourceToken {
  /// The tokenized payment source to fund a payment.
  final Token token;

  const PaymentSourceToken(this.token);

  Map<String, dynamic> toJson() => _$PaymentSourceTokenToJson(this);

  factory PaymentSourceToken.fromJson(Map<String, dynamic> json) =>
      _$PaymentSourceTokenFromJson(json);

  @override
  String toString() {
    return 'PaymentSourceToken{token: $token}';
  }
}

/// A payment source token.
@JsonSerializable()
class Token {
  /// The PayPal-generated ID for the token.
  final String id;

  /// The tokenization method that generated the ID.
  final String type;

  const Token(this.id, this.type);

  Map<String, dynamic> toJson() => _$TokenToJson(this);

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  @override
  String toString() {
    return 'Token{id: $id, type: $type}';
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

/// A collection of payments
@JsonSerializable(fieldRename: FieldRename.snake)
class PaymentCollection {
  /// An array of authorized payments for a purchase unit. A purchase unit can
  /// have zero or more authorized payments.
  final List<AuthorizationWithAdditionalData>? authorizations;

  /// An array of captured payments for a purchase unit. A purchase unit can have
  /// zero or more captured payments.
  final List<Capture>? captures;

  /// An array of refunds for a purchase unit. A purchase unit can have zero or
  /// more refunds.
  final List<Refund>? refunds;

  const PaymentCollection({this.authorizations, this.captures, this.refunds});

  Map<String, dynamic> toJson() => _$PaymentCollectionToJson(this);

  factory PaymentCollection.fromJson(Map<String, dynamic> json) =>
      _$PaymentCollectionFromJson(json);

  @override
  String toString() {
    return 'PaymentCollection{authorizations: $authorizations, captures: $captures, '
        'refunds: $refunds}';
  }
}

/// Authorization with additional data.
@JsonSerializable(fieldRename: FieldRename.snake)
class AuthorizationWithAdditionalData {
  /// The processor response for card transactions.
  final ProcessorResponse processorResponse;

  const AuthorizationWithAdditionalData(this.processorResponse);

  Map<String, dynamic> toJson() =>
      _$AuthorizationWithAdditionalDataToJson(this);

  factory AuthorizationWithAdditionalData.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationWithAdditionalDataFromJson(json);

  @override
  String toString() {
    return 'AuthorizationWithAdditionalData{processorResponse: $processorResponse}';
  }
}

/// A capture.
@JsonSerializable(fieldRename: FieldRename.snake)
class Capture {
  /// The status of the captured payment.
  final String? status;

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

  /// The level of protection offered as defined by
  /// <a href="https://www.paypal.com/us/webapps/mpp/security/seller-protection?_ga=1.38717539.134270098.1627037710">
  /// PayPal Seller Protection for Merchants</a>.
  final SellerProtection? sellerProtection;

  /// Indicates whether you can make additional captures against the authorized payment.
  /// Set to true if you do not intend to capture additional payments against the
  /// authorization. Set to false if you intend to capture additional payments
  /// against the authorization.
  final bool? finalCapture;

  /// The detailed breakdown of the capture activity. This is not available for
  /// transactions that are in pending state.
  final SellerReceivableBreakdown? sellerReceivableBreakdown;

  /// The funds that are held on behalf of the merchant.
  final String? disbursementMode;

  /// An object that provides additional processor information for a direct
  /// credit card transaction.
  final ProcessorResponse? processorResponse;

  /// The date and time when the transaction occurred, in
  /// <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  final String? createTime;

  /// The date and time when the transaction was last updated, in
  /// <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  final String? updateTime;

  /// An array of request-related <a href="https://developer.paypal.com/docs/api/reference/api-responses/#hateoas-links">
  /// HATEOAS links</a>.
  final List<LinkDescription>? links;

  const Capture(
      {this.status,
      this.statusDetails,
      this.id,
      this.amount,
      this.invoiceId,
      this.customId,
      this.sellerProtection,
      this.finalCapture,
      this.sellerReceivableBreakdown,
      this.disbursementMode,
      this.processorResponse,
      this.createTime,
      this.updateTime,
      this.links});

  Map<String, dynamic> toJson() => _$CaptureToJson(this);

  factory Capture.fromJson(Map<String, dynamic> json) =>
      _$CaptureFromJson(json);

  @override
  String toString() {
    return 'Capture{status: $status, statusDetails: $statusDetails, id: $id, '
        'amount: $amount, invoiceId: $invoiceId, customId: $customId, '
        'sellerProtection: $sellerProtection, finalCapture: $finalCapture, '
        'sellerReceivableBreakdown: $sellerReceivableBreakdown, '
        'disbursementMode: $disbursementMode, processorResponse: $processorResponse, '
        'createTime: $createTime, updateTime: $updateTime, links: $links}';
  }
}

/// A refund.
@JsonSerializable(fieldRename: FieldRename.snake)
class Refund {
  /// The status of the refund.
  final String? status;

  /// The details of the refund status.
  final RefundStatus? statusDetails;

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
  final String? sellerPayableBreakdown;

  /// The date and time when the transaction occurred, in
  /// <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  final String? createTime;

  /// The date and time when the transaction was last updated, in
  /// <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  final String? updateTime;

  /// An array of request-related <a href="https://developer.paypal.com/docs/api/reference/api-responses/#hateoas-links">
  /// HATEOAS links</a>.
  final List<LinkDescription>? links;

  const Refund({
    this.status,
    this.statusDetails,
    this.id,
    this.amount,
    this.invoiceId,
    this.noteToPayer,
    this.sellerPayableBreakdown,
    this.createTime,
    this.updateTime,
    this.links,
  });

  Map<String, dynamic> toJson() => _$RefundToJson(this);

  factory Refund.fromJson(Map<String, dynamic> json) => _$RefundFromJson(json);

  @override
  String toString() {
    return 'Refund{status: $status, statusDetails: $statusDetails, id: $id, '
        'amount: $amount, invoiceId: $invoiceId, noteToPayer: $noteToPayer, '
        'sellerPayableBreakdown: $sellerPayableBreakdown, createTime: $createTime, '
        'updateTime: $updateTime, links: $links}';
  }
}

/// The refund status.
@JsonSerializable(fieldRename: FieldRename.snake)
class RefundStatus {
  /// The status of the refund.
  final RefundStatusValue? status;

  /// The details of the refund status.
  final RefundStatusDetails? statusDetails;

  const RefundStatus({this.status, this.statusDetails});

  Map<String, dynamic> toJson() => _$RefundStatusToJson(this);

  factory RefundStatus.fromJson(Map<String, dynamic> json) =>
      _$RefundStatusFromJson(json);

  @override
  String toString() {
    return 'RefundStatus{status: $status, statusDetails: $statusDetails}';
  }
}

/// The refund status details.
@JsonSerializable(fieldRename: FieldRename.snake)
class RefundStatusDetails {
  /// The reason why the refund has the PENDING or FAILED status.
  final RefundStatusReason reason;

  const RefundStatusDetails(this.reason);

  Map<String, dynamic> toJson() => _$RefundStatusDetailsToJson(this);

  factory RefundStatusDetails.fromJson(Map<String, dynamic> json) =>
      _$RefundStatusDetailsFromJson(json);

  @override
  String toString() {
    return 'RefundStatusDetails{reason: $reason}';
  }
}

/// Seller protection.
@JsonSerializable(fieldRename: FieldRename.snake)
class SellerProtection {
  /// Indicates whether the transaction is eligible for seller protection. For
  /// information, see <a href="https://www.paypal.com/us/webapps/mpp/security/seller-protection?_ga=1.13945719.134270098.1627037710">
  /// PayPal Seller Protection for Merchants</a>.
  final SellerProtectionStatus? status;

  /// An array of conditions that are covered for the transaction.
  final List<DisputeCategory>? disputeCategories;

  const SellerProtection({this.status, this.disputeCategories});

  Map<String, dynamic> toJson() => _$SellerProtectionToJson(this);

  factory SellerProtection.fromJson(Map<String, dynamic> json) =>
      _$SellerProtectionFromJson(json);

  @override
  String toString() {
    return 'SellerProtection{status: $status, disputeCategories: $disputeCategories}';
  }
}

/// Dispute category.
@JsonSerializable(fieldRename: FieldRename.snake)
class DisputeCategory {
  /// The condition that is covered for the transaction.
  final DisputeCategoryValue disputeCategory;

  const DisputeCategory(this.disputeCategory);

  Map<String, dynamic> toJson() => _$DisputeCategoryToJson(this);

  factory DisputeCategory.fromJson(Map<String, dynamic> json) =>
      _$DisputeCategoryFromJson(json);

  @override
  String toString() {
    return 'DisputeCategory{disputeCategory: $disputeCategory}';
  }
}

/// Seller receivable breakdown.
@JsonSerializable(fieldRename: FieldRename.snake)
class SellerReceivableBreakdown {
  /// The amount for this captured payment in the currency of the transaction.
  final Money grossAmount;

  /// The applicable fee for this captured payment in the currency of the transaction.
  final Money? paypalFee;

  /// The applicable fee for this captured payment in the receivable currency.
  /// Returned only in cases the fee is charged in the receivable currency. Example 'CNY'.
  final Money? paypalFeeInReceivableCurrency;

  /// The net amount that the payee receives for this captured payment in their
  /// PayPal account. The net amount is computed as gross_amount minus the
  /// paypal_fee minus the platform_fees.
  final Money? netAmount;

  /// The net amount that is credited to the payee's PayPal account. Returned
  /// only when the currency of the captured payment is different from the
  /// currency of the PayPal account where the payee wants to credit the funds.
  /// The amount is computed as net_amount times exchange_rate.
  final Money? receivableAmount;

  /// The exchange rate that determines the amount that is credited to the payee's
  /// PayPal account. Returned when the currency of the captured payment is different
  /// from the currency of the PayPal account where the payee wants to credit the funds.
  final ExchangeRate? exchangeRate;

  /// An array of platform or partner fees, commissions, or brokerage fees that
  /// associated with the captured payment.
  final List<PlatformFee>? platformFees;

  const SellerReceivableBreakdown(
      {required this.grossAmount,
      this.paypalFee,
      this.paypalFeeInReceivableCurrency,
      this.netAmount,
      this.receivableAmount,
      this.exchangeRate,
      this.platformFees});

  Map<String, dynamic> toJson() => _$SellerReceivableBreakdownToJson(this);

  factory SellerReceivableBreakdown.fromJson(Map<String, dynamic> json) =>
      _$SellerReceivableBreakdownFromJson(json);

  @override
  String toString() {
    return 'SellerReceivableBreakdown{grossAmount: $grossAmount, paypalFee: $paypalFee, '
        'paypalFeeInReceivableCurrency: $paypalFeeInReceivableCurrency, '
        'netAmount: $netAmount, receivableAmount: $receivableAmount, '
        'exchangeRate: $exchangeRate, platformFees: $platformFees}';
  }
}

/// Processor response. See <a href="https://developer.paypal.com/docs/api/orders/v2/#definition-processor_response">docs</a>
/// for possible values
@JsonSerializable(fieldRename: FieldRename.snake)
class ProcessorResponse {
  /// The address verification code for Visa, Discover, Mastercard, or American Express transactions.
  final String? avsCode;

  /// The card verification value code for for Visa, Discover, Mastercard, or American Express.
  final String? cvvCode;

  /// Processor response code for the non-PayPal payment processor errors
  final String? responseCode;

  /// The declined payment transactions might have payment advice codes. The card
  /// networks, like Visa and Mastercard, return payment advice codes.
  final String? paymentAdviceCode;

  const ProcessorResponse(
      {this.avsCode, this.cvvCode, this.responseCode, this.paymentAdviceCode});

  Map<String, dynamic> toJson() => _$ProcessorResponseToJson(this);

  factory ProcessorResponse.fromJson(Map<String, dynamic> json) =>
      _$ProcessorResponseFromJson(json);

  @override
  String toString() {
    return 'ProcessorResponse{avsCode: $avsCode, cvvCode: $cvvCode, '
        'responseCode: $responseCode, paymentAdviceCode: $paymentAdviceCode}';
  }
}
