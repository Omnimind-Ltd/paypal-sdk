// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'capture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CaptureRequest _$CaptureRequestFromJson(Map<String, dynamic> json) =>
    CaptureRequest(
      invoiceId: json['invoice_id'] as String?,
      noteToPayer: json['note_to_payer'] as String?,
      amount: json['amount'] == null
          ? null
          : Money.fromJson(json['amount'] as Map<String, dynamic>),
      finalCapture: json['final_capture'] as bool?,
      paymentInstruction: json['payment_instruction'] == null
          ? null
          : PaymentInstruction.fromJson(
              json['payment_instruction'] as Map<String, dynamic>),
      softDescriptor: json['soft_descriptor'] as String?,
    );

Map<String, dynamic> _$CaptureRequestToJson(CaptureRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('invoice_id', instance.invoiceId);
  writeNotNull('note_to_payer', instance.noteToPayer);
  writeNotNull('amount', instance.amount);
  writeNotNull('final_capture', instance.finalCapture);
  writeNotNull('payment_instruction', instance.paymentInstruction);
  writeNotNull('soft_descriptor', instance.softDescriptor);
  return val;
}

Capture _$CaptureFromJson(Map<String, dynamic> json) => Capture(
      $enumDecodeNullable(_$CaptureStatusEnumMap, json['status']),
      json['status_details'] == null
          ? null
          : CaptureStatusDetails.fromJson(
              json['status_details'] as Map<String, dynamic>),
      json['id'] as String?,
      json['amount'] == null
          ? null
          : Money.fromJson(json['amount'] as Map<String, dynamic>),
      json['invoice_id'] as String?,
      json['custom_id'] as String?,
      json['seller_protection'] == null
          ? null
          : SellerProtection.fromJson(
              json['seller_protection'] as Map<String, dynamic>),
      json['final_capture'] as bool?,
      json['seller_receivable_breakdown'] == null
          ? null
          : SellerReceivableBreakdown.fromJson(
              json['seller_receivable_breakdown'] as Map<String, dynamic>),
      $enumDecodeNullable(_$DisbursementModeEnumMap, json['disbursement_mode']),
      (json['links'] as List<dynamic>?)
          ?.map((e) => LinkDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['create_time'] as String?,
      json['update_time'] as String?,
    );

Map<String, dynamic> _$CaptureToJson(Capture instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', _$CaptureStatusEnumMap[instance.status]);
  writeNotNull('status_details', instance.statusDetails);
  writeNotNull('id', instance.id);
  writeNotNull('amount', instance.amount);
  writeNotNull('invoice_id', instance.invoiceId);
  writeNotNull('custom_id', instance.customId);
  writeNotNull('seller_protection', instance.sellerProtection);
  writeNotNull('final_capture', instance.finalCapture);
  writeNotNull(
      'seller_receivable_breakdown', instance.sellerReceivableBreakdown);
  writeNotNull('disbursement_mode',
      _$DisbursementModeEnumMap[instance.disbursementMode]);
  writeNotNull('links', instance.links);
  writeNotNull('create_time', instance.createTime);
  writeNotNull('update_time', instance.updateTime);
  return val;
}

const _$CaptureStatusEnumMap = {
  CaptureStatus.completed: 'COMPLETED',
  CaptureStatus.declined: 'DECLINED',
  CaptureStatus.partiallyRefunded: 'PARTIALLY_REFUNDED',
  CaptureStatus.pending: 'PENDING',
  CaptureStatus.refunded: 'REFUNDED',
  CaptureStatus.failed: 'FAILED',
};

const _$DisbursementModeEnumMap = {
  DisbursementMode.instant: 'INSTANCE',
  DisbursementMode.delayed: 'DELAYED',
};

CaptureStatusDetails _$CaptureStatusDetailsFromJson(
        Map<String, dynamic> json) =>
    CaptureStatusDetails(
      $enumDecode(_$CaptureStatusReasonEnumMap, json['reason']),
    );

Map<String, dynamic> _$CaptureStatusDetailsToJson(
        CaptureStatusDetails instance) =>
    <String, dynamic>{
      'reason': _$CaptureStatusReasonEnumMap[instance.reason],
    };

const _$CaptureStatusReasonEnumMap = {
  CaptureStatusReason.buyerComplaint: 'BUYER_COMPLAINT',
  CaptureStatusReason.chargeback: 'CHARGEBACK',
  CaptureStatusReason.echeck: 'ECHECK',
  CaptureStatusReason.internationalWithdrawal: 'INTERNATIONAL_WITHDRAWAL',
  CaptureStatusReason.other: 'OTHER',
  CaptureStatusReason.pendingReview: 'PENDING_REVIEW',
  CaptureStatusReason.receivingPreferenceMandatesManualAction:
      'RECEIVING_PREFERENCE_MANDATES_MANUAL_ACTION',
  CaptureStatusReason.refunded: 'REFUNDED',
  CaptureStatusReason.transactionApprovedAwaitingFunding:
      'TRANSACTION_APPROVED_AWAITING_FUNDING',
  CaptureStatusReason.unilateral: 'UNILATERAL',
  CaptureStatusReason.verificationRequired: 'VERIFICATION_REQUIRED',
};
