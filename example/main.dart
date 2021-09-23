import 'package:paypal_sdk/catalog_products.dart';
import 'package:paypal_sdk/core.dart';
import 'package:paypal_sdk/src/catalog_products/model/product_request.dart';

const _clientId = 'clientId';
const _clientSecret = 'clientSecret';

void main() async {
  AccessToken? accessToken; // load existing token if available

  var paypalEnvironment = PayPalEnvironment.sandbox(
      clientId: _clientId, clientSecret: _clientSecret);

  var payPalHttpClient =
      PayPalHttpClient(paypalEnvironment, accessToken: accessToken,
          accessTokenUpdatedCallback: (accessToken) async {
    // Persist token
  });

  var productsApi = CatalogProductsApi(payPalHttpClient);

  // Get product details
  try {
    var product = await productsApi.showProductDetails('product_id');
    print(product);
  } catch (e) {
    print(e);
  }

  // List products
  try {
    var productsCollection = await productsApi.listProducts();

    for (var product in productsCollection.products) {
      print(product);
    }
  } catch (e) {
    print(e);
  }

  // Create product
  try {
    var createProductRequest = ProductRequest(
        name: 'test_product',
        type: Product.typeDigital,
        description: 'test_description');

    var product = await productsApi.createProduct(createProductRequest);

    print(product);
  } catch (e) {
    print(e);
  }

  // Update product
  try {
    await productsApi.updateProduct('product_id', [
      Patch(
          op: Patch.operationReplace,
          path: '/description',
          value: 'Updated description')
    ]);
  } catch (e) {
    print(e);
  }
}
