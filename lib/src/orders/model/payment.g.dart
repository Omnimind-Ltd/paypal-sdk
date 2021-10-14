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

PaymentSourceToken _$PaymentSourceTokenFromJson(Map<String, dynamic> json) =>
    PaymentSourceToken(
      Token.fromJson(json['token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentSourceTokenToJson(PaymentSourceToken instance) =>
    <String, dynamic>{
      'token': instance.token,
    };

Token _$TokenFromJson(Map<String, dynamic> json) => Token(
      json['id'] as String,
      json['type'] as String,
    );

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
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

PaymentCollection _$PaymentCollectionFromJson(Map<String, dynamic> json) =>
    PaymentCollection(
      authorizations: (json['authorizations'] as List<dynamic>?)
          ?.map((e) => AuthorizationWithAdditionalData.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      captures: (json['captures'] as List<dynamic>?)
          ?.map((e) => Capture.fromJson(e as Map<String, dynamic>))
          .toList(),
      refunds: (json['refunds'] as List<dynamic>?)
          ?.map((e) => Refund.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaymentCollectionToJson(PaymentCollection instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('authorizations', instance.authorizations);
  writeNotNull('captures', instance.captures);
  writeNotNull('refunds', instance.refunds);
  return val;
}

AuthorizationWithAdditionalData _$AuthorizationWithAdditionalDataFromJson(
        Map<String, dynamic> json) =>
    AuthorizationWithAdditionalData(
      ProcessorResponse.fromJson(
          json['processor_response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthorizationWithAdditionalDataToJson(
        AuthorizationWithAdditionalData instance) =>
    <String, dynamic>{
      'processor_response': instance.processorResponse,
    };

Capture _$CaptureFromJson(Map<String, dynamic> json) => Capture(
      status: json['status'] as String?,
      statusDetails: _$enumDecodeNullable(
          _$CaptureStatusDetailsEnumMap, json['status_details']),
      id: json['id'] as String?,
      amount: json['amount'] == null
          ? null
          : Money.fromJson(json['amount'] as Map<String, dynamic>),
      invoiceId: json['invoice_id'] as String?,
      customId: json['custom_id'] as String?,
      sellerProtection: json['seller_protection'] == null
          ? null
          : SellerProtection.fromJson(
              json['seller_protection'] as Map<String, dynamic>),
      finalCapture: json['final_capture'] as bool?,
      sellerReceivableBreakdown: json['seller_receivable_breakdown'] == null
          ? null
          : SellerReceivableBreakdown.fromJson(
              json['seller_receivable_breakdown'] as Map<String, dynamic>),
      disbursementMode: json['disbursement_mode'] as String?,
      processorResponse: json['processor_response'] == null
          ? null
          : ProcessorResponse.fromJson(
              json['processor_response'] as Map<String, dynamic>),
      createTime: json['create_time'] as String?,
      updateTime: json['update_time'] as String?,
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => LinkDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CaptureToJson(Capture instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', instance.status);
  writeNotNull(
      'status_details', _$CaptureStatusDetailsEnumMap[instance.statusDetails]);
  writeNotNull('id', instance.id);
  writeNotNull('amount', instance.amount);
  writeNotNull('invoice_id', instance.invoiceId);
  writeNotNull('custom_id', instance.customId);
  writeNotNull('seller_protection', instance.sellerProtection);
  writeNotNull('final_capture', instance.finalCapture);
  writeNotNull(
      'seller_receivable_breakdown', instance.sellerReceivableBreakdown);
  writeNotNull('disbursement_mode', instance.disbursementMode);
  writeNotNull('processor_response', instance.processorResponse);
  writeNotNull('create_time', instance.createTime);
  writeNotNull('update_time', instance.updateTime);
  writeNotNull('links', instance.links);
  return val;
}

const _$CaptureStatusDetailsEnumMap = {
  CaptureStatusDetails.buyerComplaint: 'BUYER_COMPLAINT',
  CaptureStatusDetails.chargeback: 'CHARGEBACK',
  CaptureStatusDetails.echeck: 'ECHECK',
  CaptureStatusDetails.internationalWithdrawal: 'INTERNATIONAL_WITHDRAWAL',
  CaptureStatusDetails.other: 'OTHER',
  CaptureStatusDetails.pendingReview: 'PENDING_REVIEW',
  CaptureStatusDetails.receivingPreferenceMandatesManualAction:
      'RECEIVING_PREFERENCE_MANDATES_MANUAL_ACTION',
  CaptureStatusDetails.refunded: 'REFUNDED',
  CaptureStatusDetails.transactionApprovedAwaitingFunding:
      'TRANSACTION_APPROVED_AWAITING_FUNDING',
  CaptureStatusDetails.unilateral: 'UNILATERAL',
  CaptureStatusDetails.verificationRequired: 'VERIFICATION_REQUIRED',
};

Refund _$RefundFromJson(Map<String, dynamic> json) => Refund(
      status: json['status'] as String?,
      statusDetails: json['status_details'] == null
          ? null
          : RefundStatus.fromJson(
              json['status_details'] as Map<String, dynamic>),
      id: json['id'] as String?,
      amount: json['amount'] == null
          ? null
          : Money.fromJson(json['amount'] as Map<String, dynamic>),
      invoiceId: json['invoice_id'] as String?,
      noteToPayer: json['note_to_payer'] as String?,
      sellerPayableBreakdown: json['seller_payable_breakdown'] as String?,
      createTime: json['create_time'] as String?,
      updateTime: json['update_time'] as String?,
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => LinkDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RefundToJson(Refund instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', instance.status);
  writeNotNull('status_details', instance.statusDetails);
  writeNotNull('id', instance.id);
  writeNotNull('amount', instance.amount);
  writeNotNull('invoice_id', instance.invoiceId);
  writeNotNull('note_to_payer', instance.noteToPayer);
  writeNotNull('seller_payable_breakdown', instance.sellerPayableBreakdown);
  writeNotNull('create_time', instance.createTime);
  writeNotNull('update_time', instance.updateTime);
  writeNotNull('links', instance.links);
  return val;
}

RefundStatus _$RefundStatusFromJson(Map<String, dynamic> json) => RefundStatus(
      status: _$enumDecodeNullable(_$RefundStatusValueEnumMap, json['status']),
      statusDetails: json['status_details'] == null
          ? null
          : RefundStatusDetails.fromJson(
              json['status_details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RefundStatusToJson(RefundStatus instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', _$RefundStatusValueEnumMap[instance.status]);
  writeNotNull('status_details', instance.statusDetails);
  return val;
}

const _$RefundStatusValueEnumMap = {
  RefundStatusValue.cancelled: 'CANCELLED',
  RefundStatusValue.pending: 'PENDING',
  RefundStatusValue.completed: 'COMPLETED',
};

RefundStatusDetails _$RefundStatusDetailsFromJson(Map<String, dynamic> json) =>
    RefundStatusDetails(
      _$enumDecode(_$RefundStatusReasonEnumMap, json['reason']),
    );

Map<String, dynamic> _$RefundStatusDetailsToJson(
        RefundStatusDetails instance) =>
    <String, dynamic>{
      'reason': _$RefundStatusReasonEnumMap[instance.reason],
    };

const _$RefundStatusReasonEnumMap = {
  RefundStatusReason.echeck: 'ECHECK',
};

SellerProtection _$SellerProtectionFromJson(Map<String, dynamic> json) =>
    SellerProtection(
      status:
          _$enumDecodeNullable(_$SellerProtectionStatusEnumMap, json['status']),
      disputeCategories: (json['dispute_categories'] as List<dynamic>?)
          ?.map((e) => DisputeCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SellerProtectionToJson(SellerProtection instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', _$SellerProtectionStatusEnumMap[instance.status]);
  writeNotNull('dispute_categories', instance.disputeCategories);
  return val;
}

const _$SellerProtectionStatusEnumMap = {
  SellerProtectionStatus.eligible: 'ELIGIBLE',
  SellerProtectionStatus.partiallyEligible: 'PARTIALLY_ELIGIBLE',
  SellerProtectionStatus.notEligible: 'NOT_ELIGIBLE',
};

DisputeCategory _$DisputeCategoryFromJson(Map<String, dynamic> json) =>
    DisputeCategory(
      _$enumDecode(_$DisputeCategoryValueEnumMap, json['dispute_category']),
    );

Map<String, dynamic> _$DisputeCategoryToJson(DisputeCategory instance) =>
    <String, dynamic>{
      'dispute_category':
          _$DisputeCategoryValueEnumMap[instance.disputeCategory],
    };

const _$DisputeCategoryValueEnumMap = {
  DisputeCategoryValue.itemNotReceived: 'ITEM_NOT_RECEIVED',
  DisputeCategoryValue.unauthorizedTransaction: 'UNAUTHORIZED_TRANSACTION',
};

SellerReceivableBreakdown _$SellerReceivableBreakdownFromJson(
        Map<String, dynamic> json) =>
    SellerReceivableBreakdown(
      grossAmount: Money.fromJson(json['gross_amount'] as Map<String, dynamic>),
      paypalFee: json['paypal_fee'] == null
          ? null
          : Money.fromJson(json['paypal_fee'] as Map<String, dynamic>),
      paypalFeeInReceivableCurrency:
          json['paypal_fee_in_receivable_currency'] == null
              ? null
              : Money.fromJson(json['paypal_fee_in_receivable_currency']
                  as Map<String, dynamic>),
      netAmount: json['net_amount'] == null
          ? null
          : Money.fromJson(json['net_amount'] as Map<String, dynamic>),
      receivableAmount: json['receivable_amount'] == null
          ? null
          : Money.fromJson(json['receivable_amount'] as Map<String, dynamic>),
      exchangeRate: json['exchange_rate'] == null
          ? null
          : ExchangeRate.fromJson(
              json['exchange_rate'] as Map<String, dynamic>),
      platformFees: (json['platform_fees'] as List<dynamic>?)
          ?.map((e) => PlatformFee.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SellerReceivableBreakdownToJson(
    SellerReceivableBreakdown instance) {
  final val = <String, dynamic>{
    'gross_amount': instance.grossAmount,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('paypal_fee', instance.paypalFee);
  writeNotNull('paypal_fee_in_receivable_currency',
      instance.paypalFeeInReceivableCurrency);
  writeNotNull('net_amount', instance.netAmount);
  writeNotNull('receivable_amount', instance.receivableAmount);
  writeNotNull('exchange_rate', instance.exchangeRate);
  writeNotNull('platform_fees', instance.platformFees);
  return val;
}

ProcessorResponse _$ProcessorResponseFromJson(Map<String, dynamic> json) =>
    ProcessorResponse(
      avsCode: json['avs_code'] as String?,
      cvvCode: json['cvv_code'] as String?,
      responseCode: json['response_code'] as String?,
      paymentAdviceCode: json['payment_advice_code'] as String?,
    );

Map<String, dynamic> _$ProcessorResponseToJson(ProcessorResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('avs_code', instance.avsCode);
  writeNotNull('cvv_code', instance.cvvCode);
  writeNotNull('response_code', instance.responseCode);
  writeNotNull('payment_advice_code', instance.paymentAdviceCode);
  return val;
}
