import 'dart:convert';

import 'package:paypal_sdk/core.dart';
import 'package:paypal_sdk/src/catalog_products/model/create_product_request.dart';

import 'model/product.dart';
import 'model/product_collection.dart';

/// Catalog Products interface
class CatalogProductsApi {
  final PayPalHttpClient _payPalHttpClient;

  CatalogProductsApi(PayPalHttpClient payPalHttpClient)
      : _payPalHttpClient = payPalHttpClient;

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
  Future<ProductCollection> listProducts(
      {int? pageSize, int? page, bool? totalRequired}) async {
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
  /// Parameter id: The ID of the product. You can specify the SKU for the
  /// product. If you omit the ID, the system generates it. System-generated IDs
  /// have the PROD- prefix.
  /// Minimum length: 6.
  /// Maximum length: 50.
  ///
  /// Parameter name: The product name.
  /// Minimum length: 1.
  /// Maximum length: 127.
  ///
  /// Parameter type: The product type. Indicates whether the product is physical
  /// or tangible goods, or a service. The possible values are:
  /// <ul>
  /// <li>
  /// PHYSICAL. Physical goods.
  /// </li>
  /// <li>
  /// DIGITAL. Digital goods.
  /// </li>
  /// <li>
  /// SERVICE. A service. For example, technical support.
  /// </li>
  /// </ul>
  ///
  /// Parameter category: The product category. <a href="https://developer.paypal.com/docs/api/catalog-products/v1/#definition-product_category">
  /// Possible values</a>
  ///
  /// Parameter image_url: The image URL for the product.
  ///
  /// Parameter home_url: The home page URL for the product.
  Future<Product> createProduct(
    CreateProductRequest request, {
    String? payPalRequestId,
  }) async {
    var uri = _payPalHttpClient.getUrl('/v1/catalogs/products');

    var headers =
        payPalRequestId != null ? {'PayPal-Request-Id': payPalRequestId} : null;

    var body = jsonEncode(request.toJson());

    var response =
        await _payPalHttpClient.post(uri, headers: headers, body: body);
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
  Future<void> updateProduct(
      String productId, List<Patch> patchRequests) async {
    var uri = _payPalHttpClient.getUrl('/v1/catalogs/products/$productId');

    var patchRequest = List.generate(
        patchRequests.length, (index) => patchRequests[index].toJson());

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
