Unofficial Paypal SDK <a href="https://developer.paypal.com/docs/api/overview/">https://developer.paypal.com/docs/api/overview/</a>

## Features

APIs implemented:
- Catalog Products
  
In progress:
- Subscriptions

TODO:
- Add Tracking
- Billing Agreements
- Billing Plans
- Disputes
- Identity
- Invoicing
- Orders
- Partner Referrals
- Payment Experience
- Payments
- Payouts
- Referenced Payouts
- Transaction Search
- Webhooks 

## Getting started

Follow the instructions <a href="https://developer.paypal.com/docs/api/overview/#create-sandbox-accounts">here</a> to get Sandbox account credentials

## Usage

Products API
```dart
var paypalEnvironment = PayPalEnvironment.sandbox(
    clientId: YOUR_CLIENT_ID, clientSecret: YOUR_CLIENT_SECRET);
var payPalHttpClient = PayPalHttpClient(paypalEnvironment);
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
```

## Additional information

I will implement further APIs as time permits. Pull requests always welcome :)
