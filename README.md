<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

Unofficial Paypal SDK for interacting with <a href="https://developer.paypal.com/docs/api/overview/">REST API</a>

## Features

APIs implemented:
- Catalog Products
- Subscriptions

## Getting started

Follow the instructions <a href="https://developer.paypal.com/docs/api/overview/#create-sandbox-accounts">here</a> to get Sandbox account credentials

## Usage

Products API
```dart
var paypalEnvironment = PayPalEnvironment.sandbox(
    clientId: YOUR_CLIENT_ID, clientSecret: YOUR_CLIENT_SECRET);
var paypalHttpClient = PayPalHttpClient(paypalEnvironment);
var productsApi = CatalogProductsApi(payPalHttpClient);

// Get product
try {
  var product = await productsApi.showProductDetails('product_id');
} catch(e) {
  print(e);
}

// List products
try {
  var productsCollection = await productsApi.listProducts();
} catch(e) {
  print(e);
}

// Create product
try {
  var product = await productsApi.createProduct(name: 'product_name', type: Product.typeDigital,);
} catch(e) {
  print(e);
}

// Update product
try {
  await productsApi.updateProduct('product_id', [Patch(op: Patch.operationReplace, path: '/description', value: 'Updated description')
  ]);
} catch(e) {
  print(e);
}
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
