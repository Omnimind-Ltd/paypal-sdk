import 'dart:convert';

import 'package:flutter_paypal_sdk/core.dart';
import 'package:flutter_paypal_sdk/src/payments/model/refund.dart';

import 'model/authorization.dart';
import 'model/capture.dart';

/// Payments API interface
class PaymentsApi {
  final PayPalHttpClient _payPalHttpClient;

  PaymentsApi(PayPalHttpClient payPalHttpClient) : _payPalHttpClient = payPalHttpClient;

  // Authorizations
  /// Shows details for an authorized payment, by ID.
  ///
  /// Parameter authorizationId: The ID of the authorized payment for which to show details.
  Future<Authorization> showDetailsForAuthorizedPayment(String authorizationId) async {
    var url = _payPalHttpClient.getUrl(
      '/v2/payments/authorizations/$authorizationId',
    );

    var response = await _payPalHttpClient.get(url);
    return Authorization.fromJson(jsonDecode(response.body));
  }

  /// Captures an authorized payment, by ID.
  ///
  /// Parameter authorizationId: The PayPal-generated ID for the authorized payment to capture.
  ///
  /// Parameter request: Capture request details
  ///
  /// Parameter payPalRequestId: The server stores keys for 45 days.
  ///
  /// Parameter prefer: 'minimal', The server returns a minimal response to optimize
  /// communication between the API caller and the server. A minimal response includes
  /// the id, status and HATEOAS links. 'representation', The server returns a complete
  /// resource representation, including the current state of the resource.
  Future<Capture> captureAuthorizedPayment(
    String authorizationId,
    CaptureRequest request, {
    String? payPalRequestId,
    Prefer? prefer,
  }) async {
    var url = _payPalHttpClient.getUrl(
      '/v2/payments/authorizations/$authorizationId/capture',
    );

    Map<String, String> headers = {};

    if (prefer != null) {
      headers['Prefer'] = preferTypeEnumMap[prefer]!;
    }

    if (payPalRequestId != null) {
      headers['PayPal-Request-Id'] = payPalRequestId;
    }

    var body = jsonEncode(request.toJson());
    var response = await _payPalHttpClient.post(url, headers: headers, body: body);
    return Capture.fromJson(jsonDecode(response.body));
  }

  /// Reauthorizes an authorized PayPal account payment, by ID. To ensure that funds
  /// are still available, reauthorize a payment after its initial three-day honor
  /// period expires. Within the 29-day authorization period, you can issue multiple
  /// re-authorizations after the honor period expires.
  ///
  /// If 30 days have transpired since the date of the original authorization, you
  /// must create an authorized payment instead of reauthorizing the original
  /// authorized payment.
  ///
  /// A reauthorized payment itself has a new honor period of three days.
  ///
  /// You can reauthorize an authorized payment once for up to 115% of the
  /// original authorized amount, not to exceed an increase of $75 USD.
  ///
  /// Supports only the amount request parameter.
  ///
  /// Note: This request is currently not supported for Partner use cases.
  ///
  /// Parameter authorizationId: The PayPal-generated ID for the authorized payment to reauthorize.
  ///
  /// Parameter amount: The amount to reauthorize for an authorized payment.
  ///
  /// Parameter payPalRequestId: The server stores keys for 45 days.
  ///
  /// Parameter prefer: 'minimal', The server returns a minimal response to optimize
  /// communication between the API caller and the server. A minimal response includes
  /// the id, status and HATEOAS links. 'representation', The server returns a complete
  /// resource representation, including the current state of the resource.
  Future<Authorization> reauthorizeAuthorizedPayment(
    String authorizationId,
    Money amount, {
    String? payPalRequestId,
    Prefer? prefer,
  }) async {
    var url = _payPalHttpClient.getUrl(
      '/v2/payments/authorizations/$authorizationId/reauthorize',
    );

    Map<String, String> headers = {};

    if (prefer != null) {
      headers['Prefer'] = preferTypeEnumMap[prefer]!;
    }

    if (payPalRequestId != null) {
      headers['PayPal-Request-Id'] = payPalRequestId;
    }

    var body = jsonEncode(amount.toJson());
    var response = await _payPalHttpClient.post(url, headers: headers, body: body);
    return Authorization.fromJson(jsonDecode(response.body));
  }

  /// Voids, or cancels, an authorized payment, by ID. You cannot void an authorized payment that has been fully captured.
  ///
  /// Parameter authorizationId: The PayPal-generated ID for the authorized payment to void.
  ///
  /// Parameter payPalAuthAssertion: An API-caller-provided JSON Web Token (JWT) assertion
  /// that identifies the merchant. For details, see
  /// <a href="https://developer.paypal.com/api/rest/requests/#paypal-auth-assertion">PayPal-Auth-Assertion</a>.
  ///
  /// Note:For three party transactions in which a partner is managing the API calls
  /// on behalf of a merchant, the partner must identify the merchant using either
  /// a PayPal-Auth-Assertion header or an access token with target_subject.
  Future<void> voidAuthorizedPayment(String authorizationId, {String? payPalAuthAssertion}) async {
    var url = _payPalHttpClient.getUrl(
      '/v2/payments/authorizations/$authorizationId/void',
    );

    Map<String, String> headers = {};

    if (payPalAuthAssertion != null) {
      headers['PayPal-Auth-Assertion'] = payPalAuthAssertion;
    }

    await _payPalHttpClient.post(url, headers: headers);
  }

  // Captures
  /// Shows details for a captured payment, by ID.
  ///
  /// Parameter captureId: The PayPal-generated ID for the captured payment for which to show details.
  Future<Capture> showCapturedPaymentDetails(String captureId) async {
    var url = _payPalHttpClient.getUrl('/v2/payments/captures/$captureId');

    var response = await _payPalHttpClient.get(url);
    return Capture.fromJson(jsonDecode(response.body));
  }

  /// Refunds a captured payment, by ID. For a full refund, include an empty payload
  /// in the JSON request body. For a partial refund, include an amount object
  /// in the JSON request body.
  ///
  /// Parameter captureId: The PayPal-generated ID for the captured payment to refund.
  ///
  /// Parameter request: The refund request details
  ///
  /// Parameter payPalRequestId: The server stores keys for 45 days.
  ///
  /// Parameter payPalAuthAssertion: An API-caller-provided JSON Web Token (JWT) assertion
  /// that identifies the merchant. For details, see
  /// <a href="https://developer.paypal.com/api/rest/requests/#paypal-auth-assertion">PayPal-Auth-Assertion</a>.
  ///
  /// Note:For three party transactions in which a partner is managing the API
  /// calls on behalf of a merchant, the partner must identify the merchant using
  /// either a PayPal-Auth-Assertion header or an access token with target_subject.
  Future<Refund> refundCapturedPayment(String captureId, RefundRequest request,
      {String? payPalRequestId, String? payPalAuthAssertion}) async {
    var url = _payPalHttpClient.getUrl(
      '/v2/payments/captures/$captureId/refund',
    );

    Map<String, String> headers = {};

    if (payPalAuthAssertion != null) {
      headers['PayPal-Auth-Assertion'] = payPalAuthAssertion;
    }

    if (payPalRequestId != null) {
      headers['PayPal-Request-Id'] = payPalRequestId;
    }

    var body = jsonEncode(request.toJson());
    var response = await _payPalHttpClient.post(url, headers: headers, body: body);
    return Refund.fromJson(jsonDecode(response.body));
  }

  // Refunds
  /// Shows details for a refund, by ID.
  ///
  /// Parameter refundId: The PayPal-generated ID for the refund for which to
  /// show details.
  Future<Refund> showRefundDetails(String refundId) async {
    var url = _payPalHttpClient.getUrl('/v2/payments/refunds/$refundId');

    var response = await _payPalHttpClient.get(url);
    return Refund.fromJson(jsonDecode(response.body));
  }
}
