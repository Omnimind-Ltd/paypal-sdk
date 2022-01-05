// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentSource _$PaymentSourceFromJson(Map<String, dynamic> json) =>
    PaymentSource(
      Card.fromJson(json['card'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentSourceToJson(PaymentSource instance) =>
    <String, dynamic>{
      'card': instance.card,
    };

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
      reasonCode: $enumDecodeNullable(
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

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) =>
    PaymentMethod(
      payerSelected: json['payer_selected'] as String?,
      payeePreferred:
          $enumDecodeNullable(_$PayeePreferredEnumMap, json['payee_preferred']),
      standardEntryClassCode: $enumDecodeNullable(
          _$StandardEntryClassCodeEnumMap, json['standard_entry_class_code']),
    );

Map<String, dynamic> _$PaymentMethodToJson(PaymentMethod instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('payer_selected', instance.payerSelected);
  writeNotNull(
      'payee_preferred', _$PayeePreferredEnumMap[instance.payeePreferred]);
  writeNotNull('standard_entry_class_code',
      _$StandardEntryClassCodeEnumMap[instance.standardEntryClassCode]);
  return val;
}

const _$PayeePreferredEnumMap = {
  PayeePreferred.unrestricted: 'UNRESTRICTED',
  PayeePreferred.immediatePaymentRequired: 'IMMEDIATE_PAYMENT_REQUIRED',
};

const _$StandardEntryClassCodeEnumMap = {
  StandardEntryClassCode.tel: 'TEL',
  StandardEntryClassCode.web: 'WEB',
  StandardEntryClassCode.ccd: 'CCD',
  StandardEntryClassCode.ppd: 'PPD',
};

PaymentPreferences _$PaymentPreferencesFromJson(Map<String, dynamic> json) =>
    PaymentPreferences(
      autoBillOutstanding: json['auto_bill_outstanding'] as bool?,
      setupFee: json['setup_fee'] == null
          ? null
          : Money.fromJson(json['setup_fee'] as Map<String, dynamic>),
      setupFeeFailureAction: $enumDecodeNullable(
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

const _$SetupFeeFailureActionEnumMap = {
  SetupFeeFailureAction.continue_: 'CONTINUE',
  SetupFeeFailureAction.cancel: 'CANCEL',
};
