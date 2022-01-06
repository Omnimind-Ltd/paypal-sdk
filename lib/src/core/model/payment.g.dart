// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentInstruction _$PaymentInstructionFromJson(Map<String, dynamic> json) =>
    PaymentInstruction(
      disbursementMode: $enumDecodeNullable(
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

const _$DisbursementModeEnumMap = {
  DisbursementMode.instant: 'INSTANCE',
  DisbursementMode.delayed: 'DELAYED',
};

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

RefundStatusDetails _$RefundStatusDetailsFromJson(Map<String, dynamic> json) =>
    RefundStatusDetails(
      $enumDecode(_$RefundStatusReasonEnumMap, json['reason']),
    );

Map<String, dynamic> _$RefundStatusDetailsToJson(
        RefundStatusDetails instance) =>
    <String, dynamic>{
      'reason': _$RefundStatusReasonEnumMap[instance.reason],
    };

const _$RefundStatusReasonEnumMap = {
  RefundStatusReason.echeck: 'ECHECK',
};
