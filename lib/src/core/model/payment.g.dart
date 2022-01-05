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
