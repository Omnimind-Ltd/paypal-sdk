import 'package:paypal_sdk/catalog_products.dart';
import 'package:paypal_sdk/core.dart';

const _clientId = 'clientId';
const _clientSecret = 'clientSecret';

void main() async {
  var paypalEnvironment = PayPalEnvironment.sandbox(
      clientId: _clientId, clientSecret: _clientSecret);

  var payPalHttpClient = PayPalHttpClient(paypalEnvironment);

  // Access token is posted to stream whenever client re-authenticates. If you
  // save it you can initialise PayPalHttpClient with the existing token
  payPalHttpClient.accessTokenUpdatedStream.stream.listen((accessToken) {
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
    var product = await productsApi.createProduct(
      name: 'Product name',
      type: Product.typeDigital,
      category: 'ONLINE_GAMING',
      description: 'Product description',
    );

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
