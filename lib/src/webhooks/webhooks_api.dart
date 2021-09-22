import 'dart:convert';

import 'package:paypal_sdk/core.dart';

import 'model/verify_webhook_signature.dart';

/// Webhooks API interface
class WebhooksApi {
  final PayPalHttpClient _payPalHttpClient;

  WebhooksApi(PayPalHttpClient payPalHttpClient)
      : _payPalHttpClient = payPalHttpClient;

  Future<VerifyWebhookSignatureResponse> verifyWebhookSignature(
      VerifyWebhookSignatureRequest request) async {
    var url =
        _payPalHttpClient.getUrl('/v1/notifications/verify-webhook-signature');

    var body = jsonEncode(request.toJson());

    var response = await _payPalHttpClient.post(url, body: body);
    return VerifyWebhookSignatureResponse.fromJson(jsonDecode(response.body));
  }
}
