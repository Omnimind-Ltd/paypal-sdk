import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:flutter_paypal_sdk/catalog_products.dart';
import 'package:flutter_paypal_sdk/core.dart';
import 'package:test/test.dart';

import 'helper/mock_http_client.dart';
import 'helper/util.dart';

void main() {
  late CatalogProductsApi catalogProductsApi;

  String productDescription = 'test_description';

  setUp(() {
    var mockHttpClient = MockHttpClient(MockHttpClientHandler());
    mockHttpClient.addHandler('/v1/catalogs/products', 'GET', (request) async {
      var json = await getJson('catalog_products/list_products.json');
      return Response(json, HttpStatus.ok);
    });

    mockHttpClient.addHandler('/v1/catalogs/products', 'POST', (request) async {
      var json = await getJson('catalog_products/create_product.json');
      return Response(json, HttpStatus.created);
    });

    mockHttpClient.addHandler('/v1/catalogs/products/PROD-3XF87627UU805523Y', 'GET',
        (request) async {
      var json = await getJson('catalog_products/create_product.json');
      var product = Product.fromJson(jsonDecode(json));
      return Response(
          jsonEncode(Product(
                  description: productDescription,
                  id: 'PROD-3XF87627UU805523Y',
                  name: product.name,
                  createTime: product.createTime)
              .toJson()),
          HttpStatus.ok);
    });

    mockHttpClient.addHandler('/v1/catalogs/products/PROD-3XF87627UU805523Y', 'PATCH',
        (request) async {
      var patches = jsonDecode(request.body);
      var patch = Patch.fromJson(patches.first);
      productDescription = patch.value;
      return Response('', HttpStatus.noContent);
    });

    var paypalEnvironment =
        PayPalEnvironment.sandbox(clientId: 'clientId', clientSecret: 'clientSecret');
    catalogProductsApi =
        CatalogProductsApi(PayPalHttpClient(paypalEnvironment, client: mockHttpClient));
  });

  test('Test list products', () async {
    dynamic productsCollection = await catalogProductsApi.listProducts();
    expect(productsCollection is ProductCollection, true);
  });

  test('Test create product', () async {
    var createProductRequest = ProductRequest(
        name: 'test_product', type: ProductType.digital, description: 'test_description');

    dynamic product = await catalogProductsApi.createProduct(createProductRequest);

    expect(product is Product, true);
    expect(product.name, 'test_product');
    expect(product.description, 'test_description');
  });

  test('Test update product', () async {
    await catalogProductsApi.updateProduct('PROD-3XF87627UU805523Y', [
      Patch(op: PatchOperation.replace, path: '/description', value: 'test_description_updated')
    ]);

    var product = await catalogProductsApi.showProductDetails('PROD-3XF87627UU805523Y');
    expect(product.description, 'test_description_updated');

    await catalogProductsApi.updateProduct('PROD-3XF87627UU805523Y',
        [Patch(op: PatchOperation.replace, path: '/description', value: 'test_description')]);

    product = await catalogProductsApi.showProductDetails('PROD-3XF87627UU805523Y');
    expect(product.description, 'test_description');
  });

  test('Test get product', () async {
    var product = await catalogProductsApi.showProductDetails('PROD-3XF87627UU805523Y');
    expect(product.name, 'test_product');
    expect(product.description, 'test_description');
  });
}
