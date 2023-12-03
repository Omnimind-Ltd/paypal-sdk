import 'dart:convert';

import 'package:flutter_paypal_sdk/core.dart';

import 'model/event.dart';
import 'model/verify_webhook_signature.dart';
import 'model/webhook.dart';

/// Webhooks API interface
class WebhooksApi {
  final PayPalHttpClient _payPalHttpClient;

  WebhooksApi(PayPalHttpClient payPalHttpClient) : _payPalHttpClient = payPalHttpClient;

  /// Lists webhooks for an app.
  Future<WebhooksList> listWebhooks({AnchorType? anchorType}) async {
    var queryParameters = anchorType != null ? {'anchor_id': anchorTypeEnumMap[anchorType]} : null;

    var url =
        _payPalHttpClient.getUrl('/v1/notifications/webhooks', queryParameters: queryParameters);

    var response = await _payPalHttpClient.get(url);
    return WebhooksList.fromJson(jsonDecode(response.body));
  }

  /// Subscribes your webhook listener to events.
  ///
  /// Parameter webhook: The webhook you wish to create
  Future<Webhook> createWebhook(Webhook webhook) async {
    var url = _payPalHttpClient.getUrl('/v1/notifications/webhooks');

    var body = jsonEncode(webhook.toJson());

    var response = await _payPalHttpClient.post(url, body: body);
    return Webhook.fromJson(jsonDecode(response.body));
  }

  /// Deletes a webhook, by ID.
  ///
  /// Parameter webhookId: The webhook you wish to delete
  Future<void> deleteWebhook(String webhookId) async {
    var url = _payPalHttpClient.getUrl('/v1/notifications/webhooks/$webhookId');

    await _payPalHttpClient.delete(url);
  }

  /// Updates a webhook to replace webhook fields with new values. Supports only
  /// the replace operation. Pass a json_patch object with replace operation and
  /// path, which is /url for a URL or /event_types for events. The value is either
  /// the URL or a list of events.
  ///
  /// Parameter webhookId: The webhook you wish to delete
  ///
  /// Parameter patchRequests: The list of updates.
  Future<Webhook> updateWebhook(String webhookId, List<Patch> patchRequests) async {
    var url = _payPalHttpClient.getUrl('/v1/notifications/webhooks/$webhookId');

    var patchRequest =
        List.generate(patchRequests.length, (index) => patchRequests[index].toJson());

    var body = jsonEncode(patchRequest);

    var response = await _payPalHttpClient.patch(url, body: body);

    return Webhook.fromJson(jsonDecode(response.body));
  }

  /// Show details for a webhook, by ID.
  ///
  /// Parameter webhookId: The ID of the webhook for which to show details.
  Future<Webhook> showWebhookDetails(String webhookId) async {
    var url = _payPalHttpClient.getUrl('/v1/notifications/webhooks/$webhookId');

    var response = await _payPalHttpClient.get(url);

    return Webhook.fromJson(jsonDecode(response.body));
  }

  /// Lists event subscriptions for a webhook, by ID.
  ///
  /// Parameter webhookId: The ID of the webhook for which to list subscriptions.
  Future<EventTypeList> listEventSubscriptionsForWebhook(String webhookId) async {
    var url = _payPalHttpClient.getUrl('/v1/notifications/webhooks/$webhookId/event-types');

    var response = await _payPalHttpClient.get(url);

    return EventTypeList.fromJson(jsonDecode(response.body));
  }

  /// Verifies a webhook signature.
  ///
  /// Parameter request: the verify webhook signature request
  Future<VerifyWebhookSignatureResponse> verifyWebhookSignature(
      VerifyWebhookSignatureRequest request) async {
    var url = _payPalHttpClient.getUrl('/v1/notifications/verify-webhook-signature');

    var body = jsonEncode(request.toJson());

    var response = await _payPalHttpClient.post(url, body: body);
    return VerifyWebhookSignatureResponse.fromJson(jsonDecode(response.body));
  }

  /// Lists available events to which any webhook can subscribe. For a list of
  /// supported events, see <a href="https://developer.paypal.com/docs/api-basics/notifications/webhooks/event-names/">Webhook event names.</a>
  Future<EventTypeList> listAvailableEvents() async {
    var url = _payPalHttpClient.getUrl('/v1/notifications/webhooks-event-types');

    var response = await _payPalHttpClient.get(url);
    return EventTypeList.fromJson(jsonDecode(response.body));
  }

  /// Lists webhooks event notifications. Use query parameters to filter the response.
  ///
  /// Parameter pageSize: The number of webhook event notifications to return in the response.
  ///
  /// Parameter startTime: Filters the webhook event notifications in the response
  /// to those created on or after this date and time and on or before the end_time
  /// value. Both values are in <a href="https://tools.ietf.org/html/rfc3339#section-5.6">
  /// Internet date and time format</a> format. Example: start_time=2013-03-06T11:00:00Z.
  ///
  /// Parameter endTime: Filters the webhook event notifications in the response
  /// to those created on or after the start_time and on or before this date and
  /// time. Both values are in  <a href="https://tools.ietf.org/html/rfc3339#section-5.6">
  /// Internet date and time format</a> format. Example: start_time=2013-03-06T11:00:00Z.
  ///
  /// Parameter transactionId: Filters the response to a single transaction, by ID.
  ///
  /// Parameter eventType: Filters the response to a single event.
  Future<EventList> listEventNotifications(
      {int? pageSize,
      String? startTime,
      String? endTime,
      String? transactionId,
      String? eventType}) async {
    var queryParameters = <String, dynamic>{};

    if (pageSize != null) {
      queryParameters['page_size'] = pageSize;
    }

    if (pageSize != null) {
      queryParameters['startTime'] = startTime;
    }

    if (pageSize != null) {
      queryParameters['endTime'] = endTime;
    }

    if (pageSize != null) {
      queryParameters['transactionId'] = transactionId;
    }

    if (pageSize != null) {
      queryParameters['eventType'] = eventType;
    }

    var url = _payPalHttpClient.getUrl('/v1/notifications/webhooks-events',
        queryParameters: queryParameters);

    var response = await _payPalHttpClient.get(url);
    return EventList.fromJson(jsonDecode(response.body));
  }

  /// Shows details for a webhooks event notification, by ID.
  ///
  /// Parameter eventId: The ID of the webhook event notification for which
  /// to show details.
  Future<Event> showEventNotificationDetails(String eventId) async {
    var url = _payPalHttpClient.getUrl('/v1/notifications/webhooks-events/$eventId');

    var response = await _payPalHttpClient.get(url);

    return Event.fromJson(jsonDecode(response.body));
  }

  /// Resends a webhook event notification, by ID. Any pending notifications
  /// are not resent.
  ///
  /// Parameter eventId: The ID of the webhook event notification to resend.
  ///
  /// Parameter webhookIds: An array of webhook account IDs.
  Future<Event> resendEventNotification(String eventId, List<String> webhookIds) async {
    var url = _payPalHttpClient.getUrl('/v1/notifications/webhooks-events/$eventId/resend');

    var body = jsonEncode(WebhookIds(webhookIds).toJson());

    var response = await _payPalHttpClient.post(url, body: body);

    return Event.fromJson(jsonDecode(response.body));
  }

  /// Simulates a webhook event. In the request, specify a sample payload.
  ///
  /// Parameter event: The event to simulate
  Future<Event> simulateWebhookEvent(SimulateEvent event) async {
    var url = _payPalHttpClient.getUrl('/v1/notifications/simulate-event');

    var body = jsonEncode(event.toJson());

    var response = await _payPalHttpClient.post(url, body: body);

    return Event.fromJson(jsonDecode(response.body));
  }
}
