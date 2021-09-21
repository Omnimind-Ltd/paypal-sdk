import 'package:paypal_sdk/catalog_products.dart';
import 'package:paypal_sdk/core.dart';
import 'package:test/test.dart';

import 'test_environment.dart';

void main() {
  late final PayPalHttpClient _payPalHttpClient;

  setUp(() {
    _payPalHttpClient = PayPalHttpClient(
      PayPalEnvironment.sandbox(
        clientId: clientId,
        clientSecret: clientSecret,
      ),
      loggingEnabled: true,
    );
  });

  test('Test list products', () async {
    var productsApi = CatalogProductsApi(_payPalHttpClient);
    var productsCollection = await productsApi.listProducts();
    expect(productsCollection is ProductCollection, true);
  });

  test('Test create product', () async {
    var productsApi = CatalogProductsApi(_payPalHttpClient);
    var product = await productsApi.createProduct(
        name: 'test_product',
        type: Product.typeDigital,
        description: 'test_description');

    expect(product is Product, true);
    expect(product.name, 'test_product');
    expect(product.description, 'test_description');
  });

  test('Test update product', () async {
    var productsApi = CatalogProductsApi(_payPalHttpClient);
    await productsApi.updateProduct('PROD-41223692GT225981R', [
      Patch(
          op: Patch.operationReplace,
          path: '/description',
          value: 'test_description_updated')
    ]);

    var product =
        await productsApi.showProductDetails('PROD-41223692GT225981R');
    expect(product.description, 'test_description_updated');

    await productsApi.updateProduct('PROD-41223692GT225981R', [
      Patch(
          op: Patch.operationReplace,
          path: '/description',
          value: 'test_description')
    ]);

    product = await productsApi.showProductDetails('PROD-41223692GT225981R');
    expect(product.description, 'test_description');
  });

  test('Test get product', () async {
    var productsApi = CatalogProductsApi(_payPalHttpClient);
    var product =
        await productsApi.showProductDetails('PROD-41223692GT225981R');
    expect(product.name, 'test_product');
    expect(product.description, 'test_description');
  });
}
