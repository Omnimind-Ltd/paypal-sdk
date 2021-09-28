// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LastPaymentDetails _$LastPaymentDetailsFromJson(Map<String, dynamic> json) =>
    LastPaymentDetails(
      status: json['status'] as String?,
      amount: json['amount'] == null
          ? null
          : Money.fromJson(json['amount'] as Map<String, dynamic>),
      time: json['time'] as String?,
    );

Map<String, dynamic> _$LastPaymentDetailsToJson(LastPaymentDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', instance.status);
  writeNotNull('amount', instance.amount);
  writeNotNull('time', instance.time);
  return val;
}

FailedPaymentDetails _$FailedPaymentDetailsFromJson(
        Map<String, dynamic> json) =>
    FailedPaymentDetails(
      amount: Money.fromJson(json['amount'] as Map<String, dynamic>),
      time: json['time'] as String,
      reasonCode: _$enumDecodeNullable(
          _$FailedPaymentReasonEnumMap, json['reason_code']),
      nextPaymentRetryTime: json['next_payment_retry_time'] as String?,
    );

Map<String, dynamic> _$FailedPaymentDetailsToJson(
    FailedPaymentDetails instance) {
  final val = <String, dynamic>{
    'amount': instance.amount,
    'time': instance.time,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'reason_code', _$FailedPaymentReasonEnumMap[instance.reasonCode]);
  writeNotNull('next_payment_retry_time', instance.nextPaymentRetryTime);
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

const _$FailedPaymentReasonEnumMap = {
  FailedPaymentReason.paymentDenied: 'paymentDenied',
  FailedPaymentReason.internalServerError: 'internalServerError',
  FailedPaymentReason.payeeAccountRestricted: 'payeeAccountRestricted',
  FailedPaymentReason.payerAccountRestricted: 'payerAccountRestricted',
  FailedPaymentReason.payerCannotPay: 'payerCannotPay',
  FailedPaymentReason.sendingLimitExceeded: 'sendingLimitExceeded',
  FailedPaymentReason.transactionReceivingLimitExceeded:
      'transactionReceivingLimitExceeded',
  FailedPaymentReason.currencyMismatch: 'currencyMismatch',
};
