// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      status: _$enumDecodeNullable(_$CaptureStatusEnumMap, json['status']),
      id: json['id'] as String?,
      amountWithBreakdown: json['amount_with_breakdown'] == null
          ? null
          : AmountWithBreakdown.fromJson(
              json['amount_with_breakdown'] as Map<String, dynamic>),
      payerName: json['payer_name'] == null
          ? null
          : Name.fromJson(json['payer_name'] as Map<String, dynamic>),
      payerEmail: json['payer_email'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', _$CaptureStatusEnumMap[instance.status]);
  writeNotNull('id', instance.id);
  writeNotNull('amount_with_breakdown', instance.amountWithBreakdown);
  writeNotNull('payer_name', instance.payerName);
  writeNotNull('payer_email', instance.payerEmail);
  writeNotNull('time', instance.time);
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

const _$CaptureStatusEnumMap = {
  CaptureStatus.completed: 'COMPLETED',
  CaptureStatus.declined: 'DECLINED',
  CaptureStatus.partiallyRefunded: 'PARTIALLY_REFUNDED',
  CaptureStatus.pending: 'PENDING',
  CaptureStatus.refunded: 'REFUNDED',
};

TransactionsList _$TransactionsListFromJson(Map<String, dynamic> json) =>
    TransactionsList(
      (json['transactions'] as List<dynamic>)
          .map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total_items'] as int?,
      json['total_pages'] as int?,
      (json['links'] as List<dynamic>?)
          ?.map((e) => LinkDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TransactionsListToJson(TransactionsList instance) {
  final val = <String, dynamic>{
    'transactions': instance.transactions,
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