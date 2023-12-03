import 'package:flutter_paypal_sdk/core.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

/// A webhook event.
@JsonSerializable(fieldRename: FieldRename.snake)
class Event {
  /// The ID of the webhook event notification.
  final String id;

  /// The date and time when the webhook event notification was created, in
  /// <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  final String createTime;

  /// The name of the resource related to the webhook notification event.
  final String resourceType;

  /// The event version in the webhook notification.
  final String eventVersion;

  /// The event that triggered the webhook event notification.
  final String eventType;

  /// A summary description for the event notification.
  final String summary;

  /// The resource version in the webhook notification.
  final String? resourceVersion;

  /// The resource that triggered the webhook event notification.
  dynamic resource;

  /// An array of request-related HATEOAS links.
  final List<LinkDescription> links;

  Event(this.id, this.createTime, this.resourceType, this.eventVersion, this.eventType,
      this.summary, this.resourceVersion, this.resource, this.links);

  Map<String, dynamic> toJson() => _$EventToJson(this);

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  @override
  String toString() {
    return 'Event{id: $id, createTime: $createTime, resourceType: $resourceType, '
        'eventVersion: $eventVersion, eventType: $eventType, summary: $summary, '
        'resourceVersion: $resourceVersion, resource: $resource, links: $links}';
  }
}

/// List event notifications response.
@JsonSerializable(fieldRename: FieldRename.snake)
class EventList {
  /// An array of webhooks events.
  final List<Event> events;

  /// The number of items in each range of results. Note that the response might
  /// have fewer items than the requested page_size value.
  final int? count;

  /// An array of request-related HATEOAS links.
  final List<LinkDescription> links;

  EventList(this.events, this.count, this.links);

  Map<String, dynamic> toJson() => _$EventListToJson(this);

  factory EventList.fromJson(Map<String, dynamic> json) => _$EventListFromJson(json);

  @override
  String toString() {
    return 'EventList{events: $events, count: $count, links: $links}';
  }
}

/// Resource version.
@JsonSerializable(fieldRename: FieldRename.snake)
class ResourceVersion {
  /// The ID for an event type. For example, 1.0 or 2.0.
  final String resourceVersion;

  const ResourceVersion(this.resourceVersion);

  Map<String, dynamic> toJson() => _$ResourceVersionToJson(this);

  factory ResourceVersion.fromJson(Map<String, dynamic> json) => _$ResourceVersionFromJson(json);

  @override
  String toString() {
    return 'ResourceVersion{resourceVersion: $resourceVersion}';
  }
}

/// Event type.
@JsonSerializable(fieldRename: FieldRename.snake)
class EventType {
  /// The unique event name.
  final String name;

  /// A human-readable description of the event.
  final String? description;

  /// The status of a webhook event.
  final String? status;

  /// Identifier for the event type example: 1.0/2.0 etc.
  final List<ResourceVersion>? resourceVersions;

  const EventType({required this.name, this.description, this.status, this.resourceVersions});

  Map<String, dynamic> toJson() => _$EventTypeToJson(this);

  factory EventType.fromJson(Map<String, dynamic> json) => _$EventTypeFromJson(json);

  @override
  String toString() {
    return 'EventType{name: $name, description: $description, '
        'status: $status, resourceVersions: $resourceVersions}';
  }
}

/// Event types list.
@JsonSerializable(fieldRename: FieldRename.snake)
class EventTypeList {
  /// The array of webhook events.
  final List<EventType> eventTypes;

  const EventTypeList(this.eventTypes);

  Map<String, dynamic> toJson() => _$EventTypeListToJson(this);

  factory EventTypeList.fromJson(Map<String, dynamic> json) => _$EventTypeListFromJson(json);

  @override
  String toString() {
    return 'EventTypeList{eventTypes: $eventTypes}';
  }
}

/// Simulate event request.
@JsonSerializable(fieldRename: FieldRename.snake)
class SimulateEvent {
  /// The ID of the webhook. If omitted, the URL is required.
  final String? webhookId;

  /// The URL for the webhook endpoint. If omitted, the webhook ID is required.
  final String? url;

  /// The event name. Specify one of the subscribed events. For each request, provide only one event.
  final String eventType;

  /// The identifier for event type ex: 1.0/2.0 etc.
  final String? resourceVersion;

  const SimulateEvent({this.webhookId, this.url, required this.eventType, this.resourceVersion});

  Map<String, dynamic> toJson() => _$SimulateEventToJson(this);

  factory SimulateEvent.fromJson(Map<String, dynamic> json) => _$SimulateEventFromJson(json);

  @override
  String toString() {
    return 'SimulateEvent{webhookId: $webhookId, url: $url, eventType: $eventType, '
        'resourceVersion: $resourceVersion}';
  }
}
