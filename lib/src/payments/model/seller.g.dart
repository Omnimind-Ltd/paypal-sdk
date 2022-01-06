// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellerProtection _$SellerProtectionFromJson(Map<String, dynamic> json) =>
    SellerProtection(
      $enumDecodeNullable(_$SellerProtectionStatusEnumMap, json['status']),
      (json['dispute_categories'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$DisputeCategoryEnumMap, e))
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
  writeNotNull(
      'dispute_categories',
      instance.disputeCategories
          ?.map((e) => _$DisputeCategoryEnumMap[e])
          .toList());
  return val;
}

const _$SellerProtectionStatusEnumMap = {
  SellerProtectionStatus.eligible: 'ELIGIBLE',
  SellerProtectionStatus.partiallyEligible: 'PARTIALLY_ELIGIBLE',
  SellerProtectionStatus.notEligible: 'NOT_ELIGIBLE',
};

const _$DisputeCategoryEnumMap = {
  DisputeCategory.itemNotReceived: 'ITEM_NOT_RECEIVED',
  DisputeCategory.unauthorizedTransaction: 'UNAUTHORIZED_TRANSACTION',
};

SellerReceivableBreakdown _$SellerReceivableBreakdownFromJson(
        Map<String, dynamic> json) =>
    SellerReceivableBreakdown(
      json['gross_amount'] == null
          ? null
          : Money.fromJson(json['gross_amount'] as Map<String, dynamic>),
      json['paypal_fee'] == null
          ? null
          : Money.fromJson(json['paypal_fee'] as Map<String, dynamic>),
      json['paypal_fee_in_receivable_currency'] == null
          ? null
          : Money.fromJson(json['paypal_fee_in_receivable_currency']
              as Map<String, dynamic>),
      json['net_amount'] == null
          ? null
          : Money.fromJson(json['net_amount'] as Map<String, dynamic>),
      json['receivable_amount'] == null
          ? null
          : Money.fromJson(json['receivable_amount'] as Map<String, dynamic>),
      json['exchange_rate'] == null
          ? null
          : ExchangeRate.fromJson(
              json['exchange_rate'] as Map<String, dynamic>),
      (json['platform_fees'] as List<dynamic>?)
          ?.map((e) => PlatformFee.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SellerReceivableBreakdownToJson(
    SellerReceivableBreakdown instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('gross_amount', instance.grossAmount);
  writeNotNull('paypal_fee', instance.paypalFee);
  writeNotNull('paypal_fee_in_receivable_currency',
      instance.paypalFeeInReceivableCurrency);
  writeNotNull('net_amount', instance.netAmount);
  writeNotNull('receivable_amount', instance.receivableAmount);
  writeNotNull('exchange_rate', instance.exchangeRate);
  writeNotNull('platform_fees', instance.platformFees);
  return val;
}
