import 'dart:convert';

import 'package:flutter_paypal_sdk/core.dart';

import 'model/product.dart';

/// Catalog Products interface
class CatalogProductsApi {
  final PayPalHttpClient _payPalHttpClient;

  CatalogProductsApi(PayPalHttpClient payPalHttpClient) : _payPalHttpClient = payPalHttpClient;

  /// Lists products.
  ///
  /// Parameter page_size: The number of items to return in the response.
  ///
  /// Parameter page: A non-zero integer which is the start index of the
  /// entire list of items to return in the response. The combination of page=1
  /// and page_size=20 returns the first 20 items. The combination of page=2 and
  /// page_size=20 returns the next 20 items.
  ///
  /// Parameter total_required: Indicates whether to show the total count in
  /// the response.
  Future<ProductCollection> listProducts({int? pageSize, int? page, bool? totalRequired}) async {
    var uri = _payPalHttpClient.getUrl(
      '/v1/catalogs/products',
      queryParameters: {
        'page_size': pageSize?.toString(),
        'page': page?.toString(),
        'total_required': totalRequired?.toString(),
      },
    );

    var response = await _payPalHttpClient.get(uri);
    return ProductCollection.fromJson(jsonDecode(response.body));
  }

  /// Creates a product.
  ///
  /// Parameter request: The create product request object
  ///
  /// Parameter payPalRequestId: The server stores keys for 6 hours. The API callers
  /// can request the times to up to 72 hours by speaking to their Account Manager.
  ///
  /// Parameter prefer: 'minimal', The server returns a minimal response to optimize
  /// communication between the API caller and the server. A minimal response includes
  /// the id, status and HATEOAS links. 'representation', The server returns a complete
  /// resource representation, including the current state of the resource.
  Future<Product> createProduct(
    ProductRequest request, {
    String? payPalRequestId,
    Prefer? prefer,
  }) async {
    var uri = _payPalHttpClient.getUrl('/v1/catalogs/products');

    var headers = <String, String>{};

    if (payPalRequestId != null) {
      headers['PayPal-Request-Id'] = payPalRequestId;
    }

    if (prefer != null) {
      headers['Prefer'] = preferTypeEnumMap[prefer]!;
    }

    var body = jsonEncode(request.toJson());

    var response = await _payPalHttpClient.post(uri, headers: headers, body: body);
    return Product.fromJson(jsonDecode(response.body));
  }

  /// Updates a product, by ID. You can patch these attributes and objects:
  /// <ul>
  /// <li>
  /// description. Operations: add, replace, remove
  /// </li>
  /// <li>
  /// category. Operations:	add, replace, remove
  /// </li>
  /// <li>
  /// image_url. Operations: add, replace, remove
  /// </li>
  /// <li>
  /// home_url. Operations:	add, replace, remove
  /// </li>
  /// </ul>
  Future<void> updateProduct(String productId, List<Patch> patchRequests) async {
    var uri = _payPalHttpClient.getUrl('/v1/catalogs/products/$productId');

    var patchRequest =
        List.generate(patchRequests.length, (index) => patchRequests[index].toJson());

    var body = jsonEncode(patchRequest);

    await _payPalHttpClient.patch(uri, body: body);
  }

  /// Shows details for a product, by ID.
  Future<Product> showProductDetails(String productId) async {
    var uri = _payPalHttpClient.getUrl('/v1/catalogs/products/$productId');
    var response = await _payPalHttpClient.get(uri);
    return Product.fromJson(jsonDecode(response.body));
  }
}
