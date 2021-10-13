import 'dart:convert';

import 'package:paypal_sdk/core.dart';
import 'package:paypal_sdk/src/orders/model/order.dart';

/// Orders API interface
class OrdersApi {
  final PayPalHttpClient _payPalHttpClient;

  OrdersApi(PayPalHttpClient payPalHttpClient)
      : _payPalHttpClient = payPalHttpClient;

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

    var response =
        await _payPalHttpClient.post(uri, headers: headers, body: body);
    return Order.fromJson(jsonDecode(response.body));
  }
}
