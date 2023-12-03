import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:flutter_paypal_sdk/core.dart';
import 'package:flutter_paypal_sdk/src/webhooks/model/event.dart';
import 'package:flutter_paypal_sdk/src/webhooks/model/webhook.dart';
import 'package:flutter_paypal_sdk/src/webhooks/webhooks_api.dart';
import 'package:test/test.dart';

import 'helper/mock_http_client.dart';
import 'helper/util.dart';

void main() {
  late WebhooksApi webhooksApi;

  String url = 'https://api.test.com/paypal_callback';

  setUp(() {
    var mockHttpClient = MockHttpClient(MockHttpClientHandler());

    mockHttpClient.addHandler('/v1/notifications/webhooks-event-types', 'GET', (request) async {
      var json = await getJson('webhooks/list_available_events.json');
      return Response(json, HttpStatus.ok);
    });

    mockHttpClient.addHandler('/v1/notifications/webhooks', 'POST', (request) async {
      var json = await getJson('webhooks/create_webhook.json');
      return Response(json, HttpStatus.ok);
    });

    mockHttpClient.addHandler('/v1/notifications/webhooks/1HG80537L4140544T', 'DELETE',
        (request) async => Response('', HttpStatus.noContent));

    mockHttpClient.addHandler('/v1/notifications/webhooks/5B760822JX046254S', 'PATCH',
        (request) async {
      var patches = jsonDecode(request.body);
      var patch = Patch.fromJson(patches.first);
      url = patch.value;

      var json = await getJson('webhooks/show_webhook_details.json');
      var webhook = Webhook.fromJson(jsonDecode(json));

      return Response(
          jsonEncode(
              Webhook(id: '5B760822JX046254S', url: url, eventTypes: webhook.eventTypes).toJson()),
          HttpStatus.ok);
    });

    mockHttpClient.addHandler('/v1/notifications/webhooks/7BS56736HU608525B', 'GET',
        (request) async {
      var json = await getJson('webhooks/show_webhook_details.json');
      return Response(json, HttpStatus.ok);
    });

    mockHttpClient.addHandler('/v1/notifications/webhooks/7BS56736HU608525B/event-types', 'GET',
        (request) async {
      var json = await getJson('webhooks/list_event_types_for_webhook.json');
      return Response(json, HttpStatus.ok);
    });

    mockHttpClient.addHandler('/v1/notifications/webhooks', 'GET', (request) async {
      var json = await getJson('webhooks/list_webhooks.json');
      return Response(json, HttpStatus.ok);
    });

    mockHttpClient.addHandler('/v1/notifications/webhooks/1HG80537L4140544T', 'GET',
        (request) async {
      var json = await getJson('webhooks/show_deleted_webhook_details.json');
      return Response(json, HttpStatus.notFound);
    });

    mockHttpClient.addHandler('/v1/notifications/webhooks-events', 'GET', (request) async {
      var json = await getJson('webhooks/list_event_notifications.json');
      return Response(json, HttpStatus.ok);
    });

    mockHttpClient.addHandler(
        '/v1/notifications/webhooks-events/WH-775565228C8562314-0UB98355RN659701W', 'GET',
        (request) async {
      var json = await getJson('webhooks/show_event_notification_details.json');
      return Response(json, HttpStatus.ok);
    });

    mockHttpClient.addHandler(
        '/v1/notifications/webhooks-events/WH-775565228C8562314-0UB98355RN659701W/resend', 'POST',
        (request) async {
      var json = await getJson('webhooks/resend_event_notification.json');
      return Response(json, HttpStatus.accepted);
    });

    mockHttpClient.addHandler('/v1/notifications/simulate-event', 'POST', (request) async {
      var json = await getJson('webhooks/simulate_event.json');
      return Response(json, HttpStatus.accepted);
    });

    var paypalEnvironment =
        PayPalEnvironment.sandbox(clientId: 'clientId', clientSecret: 'clientSecret');
    webhooksApi = WebhooksApi(PayPalHttpClient(paypalEnvironment, client: mockHttpClient));
  });

  test('Test list webhooks', () async {
    var webhooksList = await webhooksApi.listWebhooks();
    expect(webhooksList.webhooks.isNotEmpty, true);
  });

  test('Test create webhook', () async {
    var webhook = Webhook(url: 'https://api.test.com/paypal_callback', eventTypes: [
      EventType(name: 'BILLING.SUBSCRIPTION.CREATED'),
      EventType(name: 'BILLING.SUBSCRIPTION.CANCELLED'),
    ]);

    webhook = await webhooksApi.createWebhook(webhook);

    expect(webhook.eventTypes.length, 2);
  });

  test('Test delete webhook', () async {
    await webhooksApi.deleteWebhook('1HG80537L4140544T');

    try {
      await webhooksApi.showWebhookDetails('1HG80537L4140544T');
    } on ApiException catch (e) {
      expect(e.statusCode, HttpStatus.notFound);
    }
  });

  test('Test update webhook', () async {
    var webhook = await webhooksApi.updateWebhook('5B760822JX046254S', [
      Patch(
          op: PatchOperation.replace,
          path: '/url',
          value: 'https://api.test.com/paypal_callback_new'),
    ]);

    expect(webhook.url, 'https://api.test.com/paypal_callback_new');

    webhook = await webhooksApi.updateWebhook('5B760822JX046254S', [
      Patch(
          op: PatchOperation.replace, path: '/url', value: 'https://api.test.com/paypal_callback'),
    ]);

    expect(webhook.url, 'https://api.test.com/paypal_callback');
  });

  test('Test show webhook details', () async {
    var webhook = await webhooksApi.showWebhookDetails('7BS56736HU608525B');
    expect(webhook.id, '7BS56736HU608525B');
  });

  test('Test list event types for webhook', () async {
    var eventTypesList = await webhooksApi.listEventSubscriptionsForWebhook('7BS56736HU608525B');
    expect(eventTypesList.eventTypes.isNotEmpty, true);
  });

  test('Test list available events', () async {
    var eventTypesList = await webhooksApi.listAvailableEvents();
    expect(eventTypesList.eventTypes.isNotEmpty, true);
  });

  test('Test list event notifications', () async {
    var eventList = await webhooksApi.listEventNotifications();
    expect(eventList.events.isNotEmpty, true);
  });

  test('Test show event notification details', () async {
    var event =
        await webhooksApi.showEventNotificationDetails('WH-775565228C8562314-0UB98355RN659701W');
    expect(event.id, 'WH-775565228C8562314-0UB98355RN659701W');
  });

  test('Test resend event notification', () async {
    var event = await webhooksApi
        .resendEventNotification('WH-775565228C8562314-0UB98355RN659701W', ['7BS56736HU608525B']);
    expect(event.id, 'WH-775565228C8562314-0UB98355RN659701W');
  });

  test('Test simulate event', () async {
    var event = await webhooksApi.simulateWebhookEvent(
        SimulateEvent(webhookId: '7BS56736HU608525B', eventType: 'BILLING.SUBSCRIPTION.CREATED'));
    expect(event.eventType, 'BILLING.SUBSCRIPTION.CREATED');
  });
}
