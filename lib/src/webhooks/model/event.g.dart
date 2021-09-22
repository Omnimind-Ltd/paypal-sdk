// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      id: json['id'] as String,
      createTime: json['create_time'] as String?,
      resourceType: json['resource_type'] as String,
      eventVersion: json['event_version'] as String?,
      eventType: json['event_type'] as String?,
      summary: json['summary'] as String?,
      resourceVersion: json['resource_version'] as String?,
      resource: json['resource'],
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => LinkDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EventToJson(Event instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create_time', instance.createTime);
  val['resource_type'] = instance.resourceType;
  writeNotNull('event_version', instance.eventVersion);
  writeNotNull('event_type', instance.eventType);
  writeNotNull('summary', instance.summary);
  writeNotNull('resource_version', instance.resourceVersion);
  writeNotNull('resource', instance.resource);
  writeNotNull('links', instance.links);
  return val;
}
