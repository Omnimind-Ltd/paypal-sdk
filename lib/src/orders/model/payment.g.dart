// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentInstruction _$PaymentInstructionFromJson(Map<String, dynamic> json) =>
    PaymentInstruction(
      disbursementMode: _$enumDecodeNullable(
          _$DisbursementModeEnumMap, json['disbursement_mode']),
      payeePricingTierId: json['payee_pricing_tier_id'] as String?,
      platformFee: (json['platform_fee'] as List<dynamic>?)
          ?.map((e) => PlatformFee.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaymentInstructionToJson(PaymentInstruction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('disbursement_mode',
      _$DisbursementModeEnumMap[instance.disbursementMode]);
  writeNotNull('payee_pricing_tier_id', instance.payeePricingTierId);
  writeNotNull('platform_fee', instance.platformFee);
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

const _$DisbursementModeEnumMap = {
  DisbursementMode.instant: 'INSTANCE',
  DisbursementMode.delayed: 'DELAYED',
};

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) =>
    PaymentMethod(
      payerSelected: json['payer_selected'] as String?,
      payeePreferred: _$enumDecodeNullable(
          _$PayeePreferredEnumMap, json['payee_preferred']),
      standardEntryClassCode: _$enumDecodeNullable(
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
  PayeePreferred.unrestricted: 'unrestricted',
  PayeePreferred.immediatePaymentRequired: 'immediatePaymentRequired',
};

const _$StandardEntryClassCodeEnumMap = {
  StandardEntryClassCode.tel: 'TEL',
  StandardEntryClassCode.web: 'WEB',
  StandardEntryClassCode.ccd: 'CCD',
  StandardEntryClassCode.ppd: 'PPD',
};

StoredPaymentSource _$StoredPaymentSourceFromJson(Map<String, dynamic> json) =>
    StoredPaymentSource(
      paymentInitiator:
          _$enumDecode(_$PaymentInitiatorEnumMap, json['payment_initiator']),
      paymentType: _$enumDecode(_$PaymentTypeEnumMap, json['payment_type']),
      usage: _$enumDecodeNullable(_$UsageEnumMap, json['usage']),
      networkTransactionReference: json['network_transaction_reference'] == null
          ? null
          : NetworkTransactionReference.fromJson(
              json['network_transaction_reference'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StoredPaymentSourceToJson(StoredPaymentSource instance) {
  final val = <String, dynamic>{
    'payment_initiator': _$PaymentInitiatorEnumMap[instance.paymentInitiator],
    'payment_type': _$PaymentTypeEnumMap[instance.paymentType],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('usage', _$UsageEnumMap[instance.usage]);
  writeNotNull(
      'network_transaction_reference', instance.networkTransactionReference);
  return val;
}

const _$PaymentInitiatorEnumMap = {
  PaymentInitiator.customer: 'CUSTOMER',
  PaymentInitiator.merchant: 'MERCHANT',
};

const _$PaymentTypeEnumMap = {
  PaymentType.oneTime: 'ONE_TIME',
  PaymentType.recurring: 'RECURRING',
  PaymentType.unscheduled: 'UNSCHEDULED',
};

const _$UsageEnumMap = {
  Usage.first: 'FIRST',
  Usage.subsequent: 'SUBSEQUENT',
  Usage.derived: 'DERIVED',
};

NetworkTransactionReference _$NetworkTransactionReferenceFromJson(
        Map<String, dynamic> json) =>
    NetworkTransactionReference(
      id: json['id'] as String,
      date: json['date'] as String?,
      network: _$enumDecode(_$NetworkEnumMap, json['network']),
    );

Map<String, dynamic> _$NetworkTransactionReferenceToJson(
    NetworkTransactionReference instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('date', instance.date);
  val['network'] = _$NetworkEnumMap[instance.network];
  return val;
}

const _$NetworkEnumMap = {
  Network.visa: 'VISA',
  Network.mastercard: 'MASTERCARD',
  Network.discover: 'DISCOVER',
  Network.amex: 'AMEX',
  Network.solo: 'SOLO',
  Network.jcb: 'JCB',
  Network.star: 'STAR',
  Network.delta: 'DELTA',
  Network.switch_: 'SWITCH',
  Network.maestro: 'MAESTRO',
  Network.cbNationale: 'CB_NATIONALE',
  Network.configoga: 'CONFIGOGA',
  Network.confidis: 'CONFIDIS',
  Network.electron: 'ELECTRON',
  Network.cetelem: 'CETELEM',
  Network.chinaUnionPay: 'CHINA_UNION_PAY',
};

PaymentSource _$PaymentSourceFromJson(Map<String, dynamic> json) =>
    PaymentSource(
      Card.fromJson(json['card'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentSourceToJson(PaymentSource instance) =>
    <String, dynamic>{
      'card': instance.card,
    };

Card _$CardFromJson(Map<String, dynamic> json) => Card(
      name: json['name'] as String?,
      billingAddress: json['billing_address'] == null
          ? null
          : AddressPortable.fromJson(
              json['billing_address'] as Map<String, dynamic>),
      lastDigits: json['last_digits'] as String?,
      brand: _$enumDecodeNullable(_$NetworkEnumMap, json['brand']),
    );

Map<String, dynamic> _$CardToJson(Card instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('billing_address', instance.billingAddress);
  writeNotNull('last_digits', instance.lastDigits);
  writeNotNull('brand', _$NetworkEnumMap[instance.brand]);
  return val;
}
