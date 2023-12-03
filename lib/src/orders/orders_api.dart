import 'dart:convert';

import 'package:flutter_paypal_sdk/core.dart';
import 'package:flutter_paypal_sdk/orders.dart';

/// Orders API interface
class OrdersApi {
  final PayPalHttpClient _payPalHttpClient;

  OrdersApi(PayPalHttpClient payPalHttpClient) : _payPalHttpClient = payPalHttpClient;

  /// Creates an order
  ///
  /// Parameter request: The create order request object
  ///
  /// Parameter payPalRequestId: The server stores keys for 6 hours. The API callers
  /// can request the times to up to 72 hours by speaking to their Account Manager.
  ///
  /// Parameter payPalPartnerAttributionId:
  ///
  /// Parameter payPalClientMetadataId:
  ///
  /// Parameter prefer: 'minimal', The server returns a minimal response to optimize
  /// communication between the API caller and the server. A minimal response includes
  /// the id, status and HATEOAS links. 'representation', The server returns a complete
  /// resource representation, including the current state of the resource.
  Future<Order> createOrder(
    OrderRequest request, {
    String? payPalRequestId,
    String? payPalPartnerAttributionId,
    String? payPalClientMetadataId,
    Prefer? prefer,
  }) async {
    var uri = _payPalHttpClient.getUrl('/v2/checkout/orders');

    var headers = <String, String>{};

    if (payPalRequestId != null) {
      headers['PayPal-Request-Id'] = payPalRequestId;
    }

    if (payPalPartnerAttributionId != null) {
      headers['PayPal-Partner-Attribution-Id'] = payPalPartnerAttributionId;
    }

    if (payPalClientMetadataId != null) {
      headers['PayPal-Client-Metadata-Id'] = payPalClientMetadataId;
    }

    if (prefer != null) {
      headers['Prefer'] = preferTypeEnumMap[prefer]!;
    }

    var body = jsonEncode(request.toJson());

    var response = await _payPalHttpClient.post(uri, headers: headers, body: body);
    return Order.fromJson(jsonDecode(response.body));
  }

  /// Updates an order with a CREATED or APPROVED status. You cannot update an
  /// order with the COMPLETED status.
  ///
  /// To make an update, you must provide a reference_id. If you omit this value
  /// with an order that contains only one purchase unit, PayPal sets the value
  /// to default which enables you to use the path: "/purchase_units/@reference_id=='default'/{attribute-or-object}".
  ///
  /// <ul>
  /// <li>
  /// intent. Operations: replace
  /// </li>
  /// <li>
  /// payer. Operations: replace, add. Notes: Using replace op for payer will replace
  /// the whole payer object with the value sent in request.
  /// </li>
  /// <li>
  /// purchase_units. Operations: replace, add
  /// </li>
  /// <li>
  /// purchase_units[].custom_id. Operations: replace, add, remove
  /// </li>
  /// <li>
  /// purchase_units[].description. Operations: replace, add, remove
  /// </li>
  /// <li>
  /// purchase_units[].payee.email. Operations: replace
  /// </li>
  /// <li>
  /// purchase_units[].shipping.name. Operations: replace, add
  /// </li>
  /// <li>
  /// purchase_units[].shipping.address. Operations: replace, add
  /// </li>
  /// <li>
  /// purchase_units[].shipping.type. Operations: replace, add
  /// </li>
  /// <li>
  /// purchase_units[].soft_descriptor. Operations: replace, remove
  /// </li>
  /// <li>
  /// purchase_units[].amount. Operations: replace
  /// </li>
  /// <li>
  /// purchase_units[].invoice_id. Operations: replace, add, remove
  /// </li>
  /// <li>
  /// purchase_units[].payment_instruction. Operations: replace
  /// </li>
  /// <li>
  /// purchase_units[].payment_instruction.disbursement_mode. Operations: replace
  /// </li>
  /// <li>
  /// purchase_units[].payment_instruction.platform_fees. Operations: replace, add, remove.
  /// Notes: By default, disbursement_mode is INSTANT.
  /// </li>
  /// </ul>
  Future<void> updateOrder(String id, List<Patch> patchRequests) async {
    var url = _payPalHttpClient.getUrl('/v2/checkout/orders/$id');

    var patchRequest =
        List.generate(patchRequests.length, (index) => patchRequests[index].toJson());

    var body = jsonEncode(patchRequest);

    await _payPalHttpClient.patch(url, body: body);
  }

  /// Shows details for an order, by ID.
  ///
  /// Parameter id: The id of the order
  ///
  /// Parameter fields: A comma-separated list of fields that should be returned
  /// for the order. Valid filter field is payment_source.
  Future<Order> showOrderDetails(
    String id, {
    List<String>? fields,
  }) async {
    var queryParameters = fields != null ? {'fields': fields} : null;
    var uri = _payPalHttpClient.getUrl('/v2/checkout/orders/$id', queryParameters: queryParameters);

    var response = await _payPalHttpClient.get(uri);
    return Order.fromJson(jsonDecode(response.body));
  }

  /// Authorizes payment for an order. To successfully authorize payment for an
  /// order, the buyer must first approve the order or a valid payment_source must
  /// be provided in the request. A buyer can approve the order upon being redirected
  /// to the rel:approve URL that was returned in the HATEOAS links in the create
  /// order response.
  ///
  /// Parameter id: The ID of the order for which to authorize.
  ///
  /// Parameter paymentSource: The source of payment for the order, which can be
  /// a token or a card. Use this object only if you have not redirected the user
  /// after order creation to approve the payment. In such cases, the user-selected
  /// payment method in the PayPal flow is implicitly used.
  ///
  /// Parameter payPalRequestId: The server stores keys for 6 hours. The API callers
  /// can request the times to up to 72 hours by speaking to their Account Manager.
  ///
  /// Parameter payPalPartnerAttributionId:
  ///
  /// Parameter payPalClientMetadataId:
  ///
  /// Parameter prefer: 'minimal', The server returns a minimal response to optimize
  /// communication between the API caller and the server. A minimal response includes
  /// the id, status and HATEOAS links. 'representation', The server returns a complete
  /// resource representation, including the current state of the resource.
  ///
  /// Parameter payPalAuthAssertion: An API-caller-provided JSON Web Token (JWT)
  /// assertion that identifies the merchant. For details, see PayPal-Auth-Assertion.
  Future<Order> authorizePaymentForOrder(
    String id, {
    PaymentSourceToken? paymentSource,
    String? payPalRequestId,
    String? payPalAuthAssertion,
    String? payPalClientMetadataId,
    Prefer? prefer,
  }) async {
    var uri = _payPalHttpClient.getUrl('/v2/checkout/orders/$id/authorize');

    var headers = <String, String>{'Content-Type': 'application/json'};

    if (payPalRequestId != null) {
      headers['PayPal-Request-Id'] = payPalRequestId;
    }

    if (payPalAuthAssertion != null) {
      headers['PayPal-Auth-Assertion'] = payPalAuthAssertion;
    }

    if (payPalClientMetadataId != null) {
      headers['PayPal-Client-Metadata-Id'] = payPalClientMetadataId;
    }

    if (prefer != null) {
      headers['Prefer'] = preferTypeEnumMap[prefer]!;
    }

    var body = paymentSource != null ? jsonEncode(paymentSource.toJson()) : null;

    var response = await _payPalHttpClient.post(uri, headers: headers, body: body);
    return Order.fromJson(jsonDecode(response.body));
  }

  /// Captures payment for an order. To successfully capture payment for an order,
  /// the buyer must first approve the order or a valid payment_source must be
  /// provided in the request. A buyer can approve the order upon being redirected
  /// to the rel:approve URL that was returned in the HATEOAS links in the create
  /// order response.
  ///
  /// Parameter id: The ID of the order for which to authorize.
  ///
  /// Parameter paymentSource: The source of payment for the order, which can be
  /// a token or a card. Use this object only if you have not redirected the user
  /// after order creation to approve the payment. In such cases, the user-selected
  /// payment method in the PayPal flow is implicitly used.
  ///
  /// Parameter payPalRequestId: The server stores keys for 6 hours. The API callers
  /// can request the times to up to 72 hours by speaking to their Account Manager.
  ///
  /// Parameter payPalPartnerAttributionId:
  ///
  /// Parameter payPalClientMetadataId:
  ///
  /// Parameter prefer: 'minimal', The server returns a minimal response to optimize
  /// communication between the API caller and the server. A minimal response includes
  /// the id, status and HATEOAS links. 'representation', The server returns a complete
  /// resource representation, including the current state of the resource.
  ///
  /// Parameter payPalAuthAssertion: An API-caller-provided JSON Web Token (JWT)
  /// assertion that identifies the merchant. For details, see PayPal-Auth-Assertion.
  Future<Order> capturePayment(
    String id, {
    PaymentSourceToken? paymentSource,
    String? payPalRequestId,
    String? payPalAuthAssertion,
    String? payPalClientMetadataId,
    Prefer? prefer,
  }) async {
    var uri = _payPalHttpClient.getUrl('/v2/checkout/orders/$id/capture');

    var headers = <String, String>{'Content-Type': 'application/json'};

    if (payPalRequestId != null) {
      headers['PayPal-Request-Id'] = payPalRequestId;
    }

    if (payPalAuthAssertion != null) {
      headers['PayPal-Auth-Assertion'] = payPalAuthAssertion;
    }

    if (payPalClientMetadataId != null) {
      headers['PayPal-Client-Metadata-Id'] = payPalClientMetadataId;
    }

    if (prefer != null) {
      headers['Prefer'] = preferTypeEnumMap[prefer]!;
    }

    var body = paymentSource != null ? jsonEncode(paymentSource.toJson()) : null;

    var response = await _payPalHttpClient.post(uri, headers: headers, body: body);
    return Order.fromJson(jsonDecode(response.body));
  }
}
