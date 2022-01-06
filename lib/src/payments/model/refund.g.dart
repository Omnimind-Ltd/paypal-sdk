// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refund.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefundRequest _$RefundRequestFromJson(Map<String, dynamic> json) =>
    RefundRequest(
      amount: json['amount'] == null
          ? null
          : Money.fromJson(json['amount'] as Map<String, dynamic>),
      invoiceId: json['invoice_id'] as String?,
      noteToPayer: json['note_to_payer'] as String?,
    );

Map<String, dynamic> _$RefundRequestToJson(RefundRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('amount', instance.amount);
  writeNotNull('invoice_id', instance.invoiceId);
  writeNotNull('note_to_payer', instance.noteToPayer);
  return val;
}

Refund _$RefundFromJson(Map<String, dynamic> json) => Refund(
      $enumDecodeNullable(_$RefundStatusEnumMap, json['status']),
      json['status_details'] == null
          ? null
          : RefundStatusDetails.fromJson(
              json['status_details'] as Map<String, dynamic>),
      json['id'] as String?,
      json['amount'] == null
          ? null
          : Money.fromJson(json['amount'] as Map<String, dynamic>),
      json['invoice_id'] as String?,
      json['note_to_payer'] as String?,
      json['seller_payable_breakdown'] == null
          ? null
          : SellerPayableBreakdown.fromJson(
              json['seller_payable_breakdown'] as Map<String, dynamic>),
      (json['links'] as List<dynamic>?)
          ?.map((e) => LinkDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['create_time'] as String?,
      json['update_time'] as String?,
    );

Map<String, dynamic> _$RefundToJson(Refund instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', _$RefundStatusEnumMap[instance.status]);
  writeNotNull('status_details', instance.statusDetails);
  writeNotNull('id', instance.id);
  writeNotNull('amount', instance.amount);
  writeNotNull('invoice_id', instance.invoiceId);
  writeNotNull('note_to_payer', instance.noteToPayer);
  writeNotNull('seller_payable_breakdown', instance.sellerPayableBreakdown);
  writeNotNull('links', instance.links);
  writeNotNull('create_time', instance.createTime);
  writeNotNull('update_time', instance.updateTime);
  return val;
}

const _$RefundStatusEnumMap = {
  RefundStatus.cancelled: 'CANCELLED',
  RefundStatus.pending: 'PENDING',
  RefundStatus.completed: 'COMPLETED',
};

SellerPayableBreakdown _$SellerPayableBreakdownFromJson(
        Map<String, dynamic> json) =>
    SellerPayableBreakdown(
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
      json['net_amount_in_receivable_currency'] == null
          ? null
          : Money.fromJson(json['net_amount_in_receivable_currency']
              as Map<String, dynamic>),
      (json['platform_fees'] as List<dynamic>?)
          ?.map((e) => PlatformFee.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['net_amount_breakdown'] == null
          ? null
          : Money.fromJson(
              json['net_amount_breakdown'] as Map<String, dynamic>),
      json['total_refunded_amount'] == null
          ? null
          : Money.fromJson(
              json['total_refunded_amount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SellerPayableBreakdownToJson(
    SellerPayableBreakdown instance) {
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
  writeNotNull('net_amount_in_receivable_currency',
      instance.netAmountInReceivableCurrency);
  writeNotNull('platform_fees', instance.platformFees);
  writeNotNull('net_amount_breakdown', instance.netAmountBreakdown);
  writeNotNull('total_refunded_amount', instance.totalRefundedAmount);
  return val;
}
