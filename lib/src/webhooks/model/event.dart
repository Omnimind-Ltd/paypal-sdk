import 'package:json_annotation/json_annotation.dart';
import 'package:paypal_sdk/core.dart';

part 'event.g.dart';

/// A webhook event.
@JsonSerializable()
class Event {
  /// The ID of the webhook event notification.
  final String id;

  /// The date and time when the webhook event notification was created, in
  /// <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  @JsonKey(name: 'create_time')
  String? createTime;

  /// The name of the resource related to the webhook notification event.
  @JsonKey(name: 'resource_type')
  final String resourceType;

  /// The event version in the webhook notification.
  @JsonKey(name: 'event_version')
  String? eventVersion;

  /// The event that triggered the webhook event notification.
  @JsonKey(name: 'event_type')
  String? eventType;

  /// A summary description for the event notification.
  String? summary;

  /// The resource version in the webhook notification.
  @JsonKey(name: 'resource_version')
  String? resourceVersion;

  /// The resource that triggered the webhook event notification.
  dynamic resource;

  /// An array of request-related <a href="https://developer.paypal.com/docs/api/reference/api-responses/#hateoas-links">
  /// HATEOAS links</a>.
  List<LinkDescription>? links;

  Event(
      {required this.id,
      required this.createTime,
      required this.resourceType,
      this.eventVersion,
      this.eventType,
      this.summary,
      this.resourceVersion,
      this.resource,
      this.links});

  Map<String, dynamic> toJson() => _$EventToJson(this);

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  @override
  String toString() {
    return 'Event{id: $id, createTime: $createTime, resourceType: $resourceType, eventVersion: $eventVersion, '
        'eventType: $eventType, summary: $summary, resourceVersion: $resourceVersion, resource: $resource, '
        'links: $links}';
  }
}
