// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'webhook.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Webhook _$WebhookFromJson(Map<String, dynamic> json) => Webhook(
      id: json['id'] as String?,
      url: json['url'] as String,
      eventTypes: (json['event_types'] as List<dynamic>)
          .map((e) => EventType.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => LinkDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WebhookToJson(Webhook instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['url'] = instance.url;
  val['event_types'] = instance.eventTypes;
  writeNotNull('links', instance.links);
  return val;
}

WebhooksList _$WebhooksListFromJson(Map<String, dynamic> json) => WebhooksList(
      (json['webhooks'] as List<dynamic>)
          .map((e) => Webhook.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WebhooksListToJson(WebhooksList instance) =>
    <String, dynamic>{
      'webhooks': instance.webhooks,
    };

WebhookIds _$WebhookIdsFromJson(Map<String, dynamic> json) => WebhookIds(
      (json['webhook_ids'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$WebhookIdsToJson(WebhookIds instance) =>
    <String, dynamic>{
      'webhook_ids': instance.webhookIds,
    };
