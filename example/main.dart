import 'package:paypal_sdk/catalog_products.dart';
import 'package:paypal_sdk/core.dart';
import 'package:paypal_sdk/subscriptions.dart';

const _clientId = 'clientId';
const _clientSecret = 'clientSecret';

void main() async {
  AccessToken? accessToken; // load existing token here if available

  var paypalEnvironment = PayPalEnvironment.sandbox(
      clientId: _clientId, clientSecret: _clientSecret);

  var payPalHttpClient =
      PayPalHttpClient(paypalEnvironment, accessToken: accessToken,
          accessTokenUpdatedCallback: (accessToken) async {
    // Persist token for re-use
  });

  await catalogProductsExamples(payPalHttpClient);
}

Future<void> catalogProductsExamples(PayPalHttpClient payPalHttpClient) async {
  var productsApi = CatalogProductsApi(payPalHttpClient);

  // Get product details
  try {
    var product = await productsApi.showProductDetails('product_id');
    print(product);
  } on ApiException catch (e) {
    print(e);
  }

  // List products
  try {
    var productsCollection = await productsApi.listProducts();

    for (var product in productsCollection.products) {
      print(product);
    }
  } on ApiException catch (e) {
    print(e);
  }

  // Create product
  try {
    var createProductRequest = ProductRequest(
        name: 'test_product',
        type: ProductType.digital,
        description: 'test_description');

    var product = await productsApi.createProduct(createProductRequest);

    print(product);
  } on ApiException catch (e) {
    print(e);
  }

  // Update product
  try {
    await productsApi.updateProduct('product_id', [
      Patch(
          op: PatchOperation.replace,
          path: '/description',
          value: 'Updated description')
    ]);
  } on ApiException catch (e) {
    print(e);
  }
}

Future<void> subscriptionExamples(PayPalHttpClient payPalHttpClient) async {
  var subscriptionsApi = SubscriptionsApi(payPalHttpClient);

  // List plans
  try {
    var planCollection = await subscriptionsApi.listPlans();
    print(planCollection);
  } on ApiException catch (e) {
    print(e);
  }

  // Create plan
  try {
    var planRequest = PlanRequest(
        productId: 'PROD-3XF87627UU805523Y',
        name: 'Test plan',
        billingCycles: [
          BillingCycle(
              pricingScheme: PricingScheme(
                fixedPrice: Money(currencyCode: 'GBP', value: '5'),
              ),
              frequency: Frequency(
                intervalUnit: IntervalUnit.month,
                intervalCount: 1,
              ),
              tenureType: TenureType.regular,
              sequence: 1)
        ],
        paymentPreferences: PaymentPreferences(
            autoBillOutstanding: true,
            setupFee: Money(currencyCode: 'GBP', value: '1.00'),
            setupFeeFailureAction: SetupFeeFailureAction.cancel,
            paymentFailureThreshold: 2));
    var billingPlan = await subscriptionsApi.createPlan(planRequest);
    print(billingPlan);
  } on ApiException catch (e) {
    print(e);
  }

  // Update plan
  try {
    await subscriptionsApi.updatePlan('P-6KG67732XY2608640MFGL3RY', [
      Patch(
          op: PatchOperation.replace,
          path: '/description',
          value: 'Test description')
    ]);
  } on ApiException catch (e) {
    print(e);
  }

  // Show plan details
  try {
    var billingPlan =
        await subscriptionsApi.showPlanDetails('P-6KG67732XY2608640MFGL3RY');
    print(billingPlan);
  } on ApiException catch (e) {
    print(e);
  }

  // Activate plan
  try {
    await subscriptionsApi.activatePlan('P-6KG67732XY2608640MFGL3RY');
  } on ApiException catch (e) {
    print(e);
  }

  // Deactivate plan
  try {
    await subscriptionsApi.deactivatePlan('P-6KG67732XY2608640MFGL3RY');
  } on ApiException catch (e) {
    print(e);
  }

  // Update plan pricing
  try {
    await subscriptionsApi.updatePlanPricing(
        'P-6KG67732XY2608640MFGL3RY',
        PricingSchemesUpdateRequest([
          PricingSchemeUpdateRequest(
              billingCycleSequence: 1,
              pricingScheme: PricingScheme(
                fixedPrice: Money(currencyCode: 'GBP', value: '5.0'),
              ))
        ]));
  } on ApiException catch (e) {
    print(e);
  }
}
