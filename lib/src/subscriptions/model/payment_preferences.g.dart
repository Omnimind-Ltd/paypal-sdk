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
      setupFeeFailureAction: json['setup_fee_failure_action'] as String?,
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
  writeNotNull('setup_fee_failure_action', instance.setupFeeFailureAction);
  writeNotNull('payment_failure_threshold', instance.paymentFailureThreshold);
  return val;
}
