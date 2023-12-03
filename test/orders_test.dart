import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:flutter_paypal_sdk/core.dart';
import 'package:flutter_paypal_sdk/orders.dart';
import 'package:test/test.dart';

import 'helper/mock_http_client.dart';
import 'helper/util.dart';

void main() {
  late OrdersApi ordersApi;

  String orderDescription = 'Test description';

  setUp(() {
    var mockHttpClient = MockHttpClient(MockHttpClientHandler());

    mockHttpClient.addHandler('/v2/checkout/orders', 'POST', (request) async {
      var json = await getJson('orders/create_order.json');
      return Response(json, HttpStatus.created);
    });

    mockHttpClient.addHandler('/v2/checkout/orders/74D431066L401592Y', 'PATCH', (request) async {
      var patches = jsonDecode(request.body);
      var patch = Patch.fromJson(patches.first);
      orderDescription = patch.value;
      return Response('', HttpStatus.noContent);
    });

    mockHttpClient.addHandler('/v2/checkout/orders/74D431066L401592Y', 'GET', (request) async {
      var json = await getJson('orders/show_order_details.json');

      json = json.replaceAll('Test description', orderDescription);

      return Response(jsonEncode(Order.fromJson(jsonDecode(json))), HttpStatus.ok);
    });

    var paypalEnvironment =
        PayPalEnvironment.sandbox(clientId: 'clientId', clientSecret: 'clientSecret');
    ordersApi = OrdersApi(PayPalHttpClient(paypalEnvironment, client: mockHttpClient));
  });

  test('Test create order', () async {
    var order = await ordersApi.createOrder(OrderRequest(
        intent: OrderRequestIntent.capture,
        purchaseUnits: [
          PurchaseUnitRequest(amount: AmountWithBreakdown(currencyCode: 'GBP', value: '10.00'))
        ]));

    expect(order.id != null, true);
  });

  test('Test update order', () async {
    var order = await ordersApi.showOrderDetails('74D431066L401592Y');
    expect(order.purchaseUnits!.first.description, 'Test description');

    await ordersApi.updateOrder('74D431066L401592Y', [
      Patch(
          op: PatchOperation.add,
          path: '/purchase_units/@reference_id==\'default\'/description',
          value: 'Test description updated')
    ]);

    order = await ordersApi.showOrderDetails('74D431066L401592Y');
    expect(order.purchaseUnits!.first.description, 'Test description updated');

    await ordersApi.updateOrder('74D431066L401592Y', [
      Patch(
          op: PatchOperation.replace,
          path: '/purchase_units/@reference_id==\'default\'/description',
          value: 'Test description')
    ]);
  });

  test('Test show order details', () async {
    var order = await ordersApi.showOrderDetails('74D431066L401592Y');

    expect(order.id, '74D431066L401592Y');
    expect(order.purchaseUnits!.first.description, 'Test description');
  });
}
