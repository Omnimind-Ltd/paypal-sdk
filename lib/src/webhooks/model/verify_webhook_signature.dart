import 'package:json_annotation/json_annotation.dart';

part 'verify_webhook_signature.g.dart';

/// Verifies a webhook signature.
@JsonSerializable(fieldRename: FieldRename.snake)
class VerifyWebhookSignatureRequest {
  /// The algorithm that PayPal uses to generate the signature and that you can
  /// use to verify the signature. Extract this value from the PAYPAL-AUTH-ALGO
  /// response header, which is received with the webhook notification.
  final String authAlgo;

  /// The X.509 public key certificate. Download the certificate from this URL
  /// and use it to verify the signature. Extract this value from the PAYPAL-CERT-URL
  /// response header, which is received with the webhook notification.
  final String certUrl;

  /// The ID of the HTTP transmission. Contained in the PAYPAL-TRANSMISSION-ID
  /// header of the notification message.
  final String transmissionId;

  /// The PayPal-generated asymmetric signature. Appears in the
  /// PAYPAL-TRANSMISSION-SIG header of the notification message.
  final String transmissionSig;

  /// The date and time of the HTTP transmission, in <a href="https://tools.ietf.org/html/rfc3339#section-5.6">
  /// Internet date and time format</a>. Appears in the PAYPAL-TRANSMISSION-TIME
  /// header of the notification message.
  final String transmissionTime;

  /// The ID of the webhook as configured in your Developer Portal account.
  final String webhookId;

  /// A webhook event notification.
  final String webhookEvent;

  VerifyWebhookSignatureRequest(
      {required this.authAlgo,
      required this.certUrl,
      required this.transmissionId,
      required this.transmissionSig,
      required this.transmissionTime,
      required this.webhookId,
      required this.webhookEvent});

  Map<String, dynamic> toJson() => _$VerifyWebhookSignatureRequestToJson(this);

  factory VerifyWebhookSignatureRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyWebhookSignatureRequestFromJson(json);

  @override
  String toString() {
    return 'VerifyWebhookSignatureRequest{authAlgo: $authAlgo, '
        'certUrl: $certUrl, transmissionId: $transmissionId, '
        'transmissionSig: $transmissionSig, transmissionTime: $transmissionTime, '
        'webhookId: $webhookId, webhookEvent: $webhookEvent}';
  }
}

/// Verification status.
enum VerificationStatus {
  /// Verification successful
  @JsonValue('SUCCESS')
  success,

  /// Verification failure
  @JsonValue('FAILURE')
  failure,
}

/// Verify webhook signature response
@JsonSerializable(fieldRename: FieldRename.snake)
class VerifyWebhookSignatureResponse {
  /// The status of the signature verification.
  final VerificationStatus verificationStatus;

  VerifyWebhookSignatureResponse(this.verificationStatus);

  Map<String, dynamic> toJson() => _$VerifyWebhookSignatureResponseToJson(this);

  factory VerifyWebhookSignatureResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyWebhookSignatureResponseFromJson(json);

  @override
  String toString() {
    return 'VerifyWebhookSignatureResponse{verificationStatus: $verificationStatus}';
  }
}
