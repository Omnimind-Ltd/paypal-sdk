import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_paypal_sdk/core.dart';

import 'seller.dart';

part 'authorization.g.dart';

/// Details for authorized payment
@JsonSerializable(fieldRename: FieldRename.snake)
class Authorization {
  /// The status for the authorized payment.
  final AuthorizationStatus? status;

  /// The details of the authorized order pending status.
  final AuthorizationStatusDetails? statusDetails;

  /// The PayPal-generated ID for the authorized payment.
  final String? id;

  /// The amount for this authorized payment.
  final Money? amount;

  /// The API caller-provided external invoice number for this order. Appears in
  /// both the payer's transaction history and the emails that the payer receives.
  final String? invoiceId;

  /// The API caller-provided external ID. Used to reconcile API caller-initiated
  /// transactions with PayPal transactions. Appears in transaction and settlement reports.
  final String? customId;

  /// The level of protection offered as defined by
  /// <a href="https://www.paypal.com/us/webapps/mpp/security/seller-protection?_ga=1.115286407.1448511272.1641218402">PayPal Seller Protection for Merchants.</a>
  final SellerProtection? sellerProtection;

  /// The date and time when the authorized payment expires, in
  /// <a href="https://datatracker.ietf.org/doc/h
  final String? expirationTime;

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

  const Authorization(
      this.status,
      this.statusDetails,
      this.id,
      this.amount,
      this.invoiceId,
      this.customId,
      this.sellerProtection,
      this.expirationTime,
      this.links,
      this.createTime,
      this.updateTime);

  Map<String, dynamic> toJson() => _$AuthorizationToJson(this);

  factory Authorization.fromJson(Map<String, dynamic> json) => _$AuthorizationFromJson(json);

  @override
  String toString() {
    return 'Authorization{status: $status, statusDetails: $statusDetails, id: $id, '
        'amount: $amount, invoiceId: $invoiceId, customId: $customId, '
        'sellerProtection: $sellerProtection, expirationTime: $expirationTime, '
        'links: $links, createTime: $createTime, updateTime: $updateTime}';
  }
}

/// The details of the authorized order pending status.
@JsonSerializable()
class AuthorizationStatusDetails {
  /// The reason why the authorized status is pending.
  final AuthorizationStatusReason reason;

  const AuthorizationStatusDetails(this.reason);

  Map<String, dynamic> toJson() => _$AuthorizationStatusDetailsToJson(this);

  factory AuthorizationStatusDetails.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationStatusDetailsFromJson(json);

  @override
  String toString() {
    return 'AuthorizationStatusDetails{reason: $reason}';
  }
}

enum AuthorizationStatusReason {
  /// Authorization is pending manual review.
  @JsonValue('PENDING_REVIEW')
  pendingReview,
}

/// The status for the authorized payment.
enum AuthorizationStatus {
  /// The authorized payment is created. No captured payments have been made for this authorized payment.
  @JsonValue('CREATED')
  created,

  /// The authorized payment has one or more captures against it. The sum of these captured payments is greater than the amount of the original authorized payment.
  @JsonValue('CAPTURED')
  captured,

  /// PayPal cannot authorize funds for this authorized payment.
  @JsonValue('DENIED')
  denied,

  /// The authorized payment has expired.
  @JsonValue('EXPIRED')
  expired,

  /// A captured payment was made for the authorized payment for an amount that is less than the amount of the original authorized payment.
  @JsonValue('PARTIALLY_CAPTURED')
  partiallyCaptured,

  /// The payment which was authorized for an amount that is less than the originally requested amount.
  @JsonValue('PARTIALLY_CREATED')
  partiallyCreated,

  /// The authorized payment was voided. No more captured payments can be made against this authorized payment.
  @JsonValue('VOIDED')
  voided,

  /// The created authorization is in pending state. For more information, see status.details.
  @JsonValue('PENDING')
  pending,
}
