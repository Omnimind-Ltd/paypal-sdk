/// The PayPal REST APIs use <a href="https://developer.paypal.com/docs/api-basics/notifications/webhooks/">
/// webhooks</a> for event notification. Webhooks are HTTP callbacks that receive
/// notification messages for events. After you configure a webhook listener for
/// your app, you can <a href="https://developer.paypal.com/docs/api/webhooks/v1/#webhooks_post">
/// create a webhook</a>, which subscribes the webhook listener for your app to
/// events. The notifications namespace contains resource collections for webhooks.
///
/// <a href="https://developer.paypal.com/docs/api/webhooks/v1/">https://developer.paypal.com/docs/api/webhooks/v1/</a>
library paypal_sdk_webhooks;

export 'src/webhooks/model/event.dart';
