/// You can use billing plans and subscriptions to create subscriptions that
/// process recurring PayPal payments for physical or digital goods, or
/// services. A plan includes pricing and billing cycle information that defines
/// the amount and frequency of charge for a subscription. You can also define a
/// fixed plan, such as a $5 basic plan or a volume- or graduated-based plan
/// with pricing tiers based on the quantity purchased. For more information,
/// see <a href="https://developer.paypal.com/docs/limited-release/subscriptions/">
/// Subscriptions Overview.</a>
///
/// <a href="https://developer.paypal.com/docs/api/subscriptions/v1/">https://developer.paypal.com/docs/api/subscriptions/v1/</a>
library paypal_sdk_subscriptions;

export 'src/subscriptions/model/billing_cycle.dart';
export 'src/subscriptions/model/billing_plan.dart';
export 'src/subscriptions/model/frequency.dart';
export 'src/subscriptions/model/payment_preferences.dart';
export 'src/subscriptions/model/plan_collection.dart';
export 'src/subscriptions/model/pricing_scheme.dart';
export 'src/subscriptions/model/pricing_schemes_update_request.dart';
export 'src/subscriptions/model/pricing_tier.dart';
export 'src/subscriptions/model/taxes.dart';
export 'src/subscriptions/subscriptions_api.dart';
