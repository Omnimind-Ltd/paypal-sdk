// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Authorization _$AuthorizationFromJson(Map<String, dynamic> json) =>
    Authorization(
      $enumDecodeNullable(_$AuthorizationStatusEnumMap, json['status']),
      json['status_details'] == null
          ? null
          : AuthorizationStatusDetails.fromJson(
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
      json['expiration_time'] as String?,
      (json['links'] as List<dynamic>?)
          ?.map((e) => LinkDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['create_time'] as String?,
      json['update_time'] as String?,
    );

Map<String, dynamic> _$AuthorizationToJson(Authorization instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', _$AuthorizationStatusEnumMap[instance.status]);
  writeNotNull('status_details', instance.statusDetails);
  writeNotNull('id', instance.id);
  writeNotNull('amount', instance.amount);
  writeNotNull('invoice_id', instance.invoiceId);
  writeNotNull('custom_id', instance.customId);
  writeNotNull('seller_protection', instance.sellerProtection);
  writeNotNull('expiration_time', instance.expirationTime);
  writeNotNull('links', instance.links);
  writeNotNull('create_time', instance.createTime);
  writeNotNull('update_time', instance.updateTime);
  return val;
}

const _$AuthorizationStatusEnumMap = {
  AuthorizationStatus.created: 'CREATED',
  AuthorizationStatus.captured: 'CAPTURED',
  AuthorizationStatus.denied: 'DENIED',
  AuthorizationStatus.expired: 'EXPIRED',
  AuthorizationStatus.partiallyCaptured: 'PARTIALLY_CAPTURED',
  AuthorizationStatus.partiallyCreated: 'PARTIALLY_CREATED',
  AuthorizationStatus.voided: 'VOIDED',
  AuthorizationStatus.pending: 'PENDING',
};

AuthorizationStatusDetails _$AuthorizationStatusDetailsFromJson(
        Map<String, dynamic> json) =>
    AuthorizationStatusDetails(
      $enumDecode(_$AuthorizationStatusReasonEnumMap, json['reason']),
    );

Map<String, dynamic> _$AuthorizationStatusDetailsToJson(
        AuthorizationStatusDetails instance) =>
    <String, dynamic>{
      'reason': _$AuthorizationStatusReasonEnumMap[instance.reason],
    };

const _$AuthorizationStatusReasonEnumMap = {
  AuthorizationStatusReason.pendingReview: 'PENDING_REVIEW',
};
