import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_paypal_sdk/core.dart';

part 'seller.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SellerProtection {
  /// Indicates whether the transaction is eligible for seller protection. For information,
  /// see <a href="https://www.paypal.com/us/webapps/mpp/security/seller-protection?_ga=1.149233846.1448511272.1641218402">PayPal Seller Protection for Merchants</a>.
  final SellerProtectionStatus? status;

  /// The condition that is covered for the transaction.
  final List<DisputeCategory>? disputeCategories;

  const SellerProtection(this.status, this.disputeCategories);

  Map<String, dynamic> toJson() => _$SellerProtectionToJson(this);

  factory SellerProtection.fromJson(Map<String, dynamic> json) => _$SellerProtectionFromJson(json);

  @override
  String toString() {
    return 'SellerProtection{status: $status, disputeCategories: $disputeCategories}';
  }
}

/// Indicates whether the transaction is eligible for seller protection. For information,
/// see <a href="https://www.paypal.com/us/webapps/mpp/security/seller-protection?_ga=1.149233846.1448511272.1641218402">PayPal Seller Protection for Merchants</a>.
enum SellerProtectionStatus {
  /// Your PayPal balance remains intact if the customer claims that they did not
  /// receive an item or the account holder claims that they did not authorize the payment.
  @JsonValue('ELIGIBLE')
  eligible,

  /// Your PayPal balance remains intact if the customer claims that they did not receive an item.
  @JsonValue('PARTIALLY_ELIGIBLE')
  partiallyEligible,

  /// This transaction is not eligible for seller protection.
  @JsonValue('NOT_ELIGIBLE')
  notEligible,
}

/// The condition that is covered for the transaction.
enum DisputeCategory {
  /// The payer paid for an item that they did not receive.
  @JsonValue('ITEM_NOT_RECEIVED')
  itemNotReceived,

  /// The payer did not authorize the payment.
  @JsonValue('UNAUTHORIZED_TRANSACTION')
  unauthorizedTransaction,
}

/// The detailed breakdown of the capture activity. This is not available for transactions that are in pending state.
@JsonSerializable(fieldRename: FieldRename.snake)
class SellerReceivableBreakdown {
  /// The amount for this captured payment in the currency of the transaction.
  final Money? grossAmount;

  /// The applicable fee for this captured payment in the currency of the transaction.
  final Money? paypalFee;

  /// The applicable fee for this captured payment in the receivable currency.
  /// Returned only in cases the fee is charged in the receivable currency. Example 'CNY'.
  final Money? paypalFeeInReceivableCurrency;

  /// The net amount that the payee receives for this captured payment in their
  /// PayPal account. The net amount is computed as gross_amount minus the paypal_fee minus the platform_fees.
  final Money? netAmount;

  /// The net amount that is credited to the payee's PayPal account. Returned only
  /// when the currency of the captured payment is different from the currency of
  /// the PayPal account where the payee wants to credit the funds. The amount
  /// is computed as net_amount times exchange_rate.
  final Money? receivableAmount;

  /// The exchange rate that determines the amount that is credited to the payee's
  /// PayPal account. Returned when the currency of the captured payment is different
  /// from the currency of the PayPal account where the payee wants to credit the funds.
  final ExchangeRate? exchangeRate;

  /// An array of platform or partner fees, commissions, or brokerage fees that
  /// associated with the captured payment.
  final List<PlatformFee>? platformFees;

  const SellerReceivableBreakdown(
      this.grossAmount,
      this.paypalFee,
      this.paypalFeeInReceivableCurrency,
      this.netAmount,
      this.receivableAmount,
      this.exchangeRate,
      this.platformFees);

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
