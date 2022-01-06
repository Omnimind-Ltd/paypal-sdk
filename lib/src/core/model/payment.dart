import 'package:json_annotation/json_annotation.dart';

import 'money.dart';
import 'platform_fee.dart';

part 'payment.g.dart';

/// The reason why the captured payment status is PENDING or DENIED.
enum CaptureStatusReason {
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

/// The reason why the refund has the PENDING or FAILED status.
enum RefundStatusReason {
  ///  The customer's account is funded through an eCheck, which has not yet cleared.
  @JsonValue('ECHECK')
  echeck,
}
