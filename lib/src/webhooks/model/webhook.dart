import 'package:flutter_paypal_sdk/core.dart';
import 'package:json_annotation/json_annotation.dart';

import 'event.dart';

part 'webhook.g.dart';

/// Filters for webhooks
enum AnchorType {
  /// Application filter.
  @JsonValue('APPLICATION')
  application,

  /// Account filter.
  @JsonValue('ACCOUNT')
  account,
}

const anchorTypeEnumMap = {
  AnchorType.application: 'APPLICATION',
  AnchorType.account: 'ACCOUNT',
};

/// A webhook.
@JsonSerializable(fieldRename: FieldRename.snake)
class Webhook {
  /// The ID of the webhook.
  final String? id;

  /// The Internet accessible URL configured to listen for incoming POST
  /// notification messages containing event information.
  final String url;

  /// An array of events to which to subscribe your webhook. To subscribe to all
  /// events, including events as they are added, specify the asterisk wild card.
  /// To replace the event_types array, specify the asterisk wild card. To list
  /// all supported events, list available events.
  final List<EventType> eventTypes;

  /// An array of request-related HATEOAS links.
  final List<LinkDescription>? links;

  const Webhook({
    this.id,
    required this.url,
    required this.eventTypes,
    this.links,
  });

  Map<String, dynamic> toJson() => _$WebhookToJson(this);

  factory Webhook.fromJson(Map<String, dynamic> json) => _$WebhookFromJson(json);

  @override
  String toString() {
    return 'Webhook{id: $id, url: $url, eventTypes: $eventTypes, links: $links}';
  }
}

/// List webhooks response.
@JsonSerializable(fieldRename: FieldRename.snake)
class WebhooksList {
  /// An array of webhooks.
  final List<Webhook> webhooks;

  const WebhooksList(this.webhooks);

  Map<String, dynamic> toJson() => _$WebhooksListToJson(this);

  factory WebhooksList.fromJson(Map<String, dynamic> json) => _$WebhooksListFromJson(json);

  @override
  String toString() {
    return 'WebhooksList{webhooks: $webhooks}';
  }
}

/// A list of webhook IDs.
@JsonSerializable(fieldRename: FieldRename.snake)
class WebhookIds {
  /// Webhook IDs.
  final List<String> webhookIds;

  const WebhookIds(this.webhookIds);

  Map<String, dynamic> toJson() => _$WebhookIdsToJson(this);

  factory WebhookIds.fromJson(Map<String, dynamic> json) => _$WebhookIdsFromJson(json);

  @override
  String toString() {
    return 'WebhookIds{webhookIds: $webhookIds}';
  }
}
