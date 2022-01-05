// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      status: $enumDecodeNullable(_$CaptureStatusEnumMap, json['status']),
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

AmountWithBreakdown _$AmountWithBreakdownFromJson(Map<String, dynamic> json) =>
    AmountWithBreakdown(
      grossAmount: Money.fromJson(json['gross_amount'] as Map<String, dynamic>),
      totalItemAmount: json['total_item_amount'] == null
          ? null
          : Money.fromJson(json['total_item_amount'] as Map<String, dynamic>),
      feeAmount: json['fee_amount'] == null
          ? null
          : Money.fromJson(json['fee_amount'] as Map<String, dynamic>),
      shippingAmount: json['shipping_amount'] == null
          ? null
          : Money.fromJson(json['shipping_amount'] as Map<String, dynamic>),
      taxAmount: json['tax_amount'] == null
          ? null
          : Money.fromJson(json['tax_amount'] as Map<String, dynamic>),
      netAmount: json['net_amount'] == null
          ? null
          : Money.fromJson(json['net_amount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AmountWithBreakdownToJson(AmountWithBreakdown instance) {
  final val = <String, dynamic>{
    'gross_amount': instance.grossAmount,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('total_item_amount', instance.totalItemAmount);
  writeNotNull('fee_amount', instance.feeAmount);
  writeNotNull('shipping_amount', instance.shippingAmount);
  writeNotNull('tax_amount', instance.taxAmount);
  writeNotNull('net_amount', instance.netAmount);
  return val;
}
