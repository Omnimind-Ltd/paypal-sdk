// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentPreferences _$PaymentPreferencesFromJson(Map<String, dynamic> json) =>
    PaymentPreferences(
      autoBillOutstanding: json['auto_bill_outstanding'] as bool?,
      setupFee: json['setup_fee'] == null
          ? null
          : Money.fromJson(json['setup_fee'] as Map<String, dynamic>),
      setupFeeFailureAction: _$enumDecodeNullable(
          _$SetupFeeFailureActionEnumMap, json['setup_fee_failure_action']),
      paymentFailureThreshold: json['payment_failure_threshold'] as int?,
    );

Map<String, dynamic> _$PaymentPreferencesToJson(PaymentPreferences instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('auto_bill_outstanding', instance.autoBillOutstanding);
  writeNotNull('setup_fee', instance.setupFee);
  writeNotNull('setup_fee_failure_action',
      _$SetupFeeFailureActionEnumMap[instance.setupFeeFailureAction]);
  writeNotNull('payment_failure_threshold', instance.paymentFailureThreshold);
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

const _$SetupFeeFailureActionEnumMap = {
  SetupFeeFailureAction.continue_: 'CONTINUE',
  SetupFeeFailureAction.cancel: 'CANCEL',
};
