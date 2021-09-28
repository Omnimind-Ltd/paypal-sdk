// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Plan _$PlanFromJson(Map<String, dynamic> json) => Plan(
      json['id'] as String,
      json['product_id'] as String?,
      _$enumDecode(_$PlanStatusEnumMap, json['status']),
      json['name'] as String,
      json['description'] as String?,
      (json['billing_cycles'] as List<dynamic>?)
          ?.map((e) => BillingCycle.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['payment_preferences'] == null
          ? null
          : PaymentPreferences.fromJson(
              json['payment_preferences'] as Map<String, dynamic>),
      json['taxes'] == null
          ? null
          : Taxes.fromJson(json['taxes'] as Map<String, dynamic>),
      json['quantity_supported'] as bool?,
      json['create_time'] as String?,
      json['update_time'] as String?,
      (json['links'] as List<dynamic>?)
          ?.map((e) => LinkDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlanToJson(Plan instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('product_id', instance.productId);
  val['status'] = _$PlanStatusEnumMap[instance.status];
  val['name'] = instance.name;
  writeNotNull('description', instance.description);
  writeNotNull('billing_cycles', instance.billingCycles);
  writeNotNull('payment_preferences', instance.paymentPreferences);
  writeNotNull('taxes', instance.taxes);
  writeNotNull('quantity_supported', instance.quantitySupported);
  writeNotNull('create_time', instance.createTime);
  writeNotNull('update_time', instance.updateTime);
  writeNotNull('links', instance.links);
  return val;
}

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$PlanStatusEnumMap = {
  PlanStatus.created: 'CREATED',
  PlanStatus.active: 'ACTIVE',
  PlanStatus.inactive: 'INACTIVE',
};

PlanRequest _$PlanRequestFromJson(Map<String, dynamic> json) => PlanRequest(
      productId: json['product_id'] as String,
      name: json['name'] as String,
      status: _$enumDecodeNullable(_$PlanStatusEnumMap, json['status']),
      description: json['description'] as String?,
      billingCycles: (json['billing_cycles'] as List<dynamic>)
          .map((e) => BillingCycle.fromJson(e as Map<String, dynamic>))
          .toList(),
      paymentPreferences: PaymentPreferences.fromJson(
          json['payment_preferences'] as Map<String, dynamic>),
      taxes: json['taxes'] == null
          ? null
          : Taxes.fromJson(json['taxes'] as Map<String, dynamic>),
      quantitySupported: json['quantity_supported'] as bool?,
    );

Map<String, dynamic> _$PlanRequestToJson(PlanRequest instance) {
  final val = <String, dynamic>{
    'product_id': instance.productId,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', _$PlanStatusEnumMap[instance.status]);
  writeNotNull('description', instance.description);
  val['billing_cycles'] = instance.billingCycles;
  val['payment_preferences'] = instance.paymentPreferences;
  writeNotNull('taxes', instance.taxes);
  writeNotNull('quantity_supported', instance.quantitySupported);
  return val;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

PlanCollection _$PlanCollectionFromJson(Map<String, dynamic> json) =>
    PlanCollection(
      plans: (json['plans'] as List<dynamic>)
          .map((e) => Plan.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalItems: json['total_items'] as int?,
      totalPages: json['total_pages'] as int?,
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => LinkDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlanCollectionToJson(PlanCollection instance) {
  final val = <String, dynamic>{
    'plans': instance.plans,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('total_items', instance.totalItems);
  writeNotNull('total_pages', instance.totalPages);
  writeNotNull('links', instance.links);
  return val;
}
