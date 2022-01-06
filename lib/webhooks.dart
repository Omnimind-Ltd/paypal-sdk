/// The PayPal REST APIs use <a href="https://developer.paypal.com/docs/integration/direct/webhooks/">
/// webhooks</a> for event notification. Webhooks are HTTP callbacks that receive
/// notification messages for events. After you configure a webhook listener for
/// your app, you can <a href="https://developer.paypal.com/api/webhooks/v1/#webhooks_post">
/// create a webhook</a>, which subscribes the webhook listener for your app to
/// events. The notifications namespace contains resource collections for webhooks.
///
/// <a href="https://developer.paypal.com/api/webhooks/v1/">https://developer.paypal.com/api/webhooks/v1/</a>
library webhooks;

export 'src/webhooks/model/event.dart';
export 'src/webhooks/model/verify_webhook_signature.dart';
export 'src/webhooks/model/webhook.dart';
