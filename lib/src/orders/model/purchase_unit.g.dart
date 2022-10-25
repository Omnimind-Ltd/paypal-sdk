// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseUnitRequest _$PurchaseUnitRequestFromJson(Map<String, dynamic> json) =>
    PurchaseUnitRequest(
      referenceId: json['reference_id'] as String?,
      amount:
          AmountWithBreakdown.fromJson(json['amount'] as Map<String, dynamic>),
      payee: json['payee'] == null
          ? null
          : Payee.fromJson(json['payee'] as Map<String, dynamic>),
      paymentInstruction: json['payment_instruction'] == null
          ? null
          : PaymentInstruction.fromJson(
              json['payment_instruction'] as Map<String, dynamic>),
      description: json['description'] as String?,
      customId: json['custom_id'] as String?,
      invoiceId: json['invoice_id'] as String?,
      softDescriptor: json['soft_descriptor'] as String?,
    );

Map<String, dynamic> _$PurchaseUnitRequestToJson(PurchaseUnitRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('reference_id', instance.referenceId);
  val['amount'] = instance.amount;
  writeNotNull('payee', instance.payee);
  writeNotNull('payment_instruction', instance.paymentInstruction);
  writeNotNull('description', instance.description);
  writeNotNull('custom_id', instance.customId);
  writeNotNull('invoice_id', instance.invoiceId);
  writeNotNull('soft_descriptor', instance.softDescriptor);
  return val;
}

PurchaseUnit _$PurchaseUnitFromJson(Map<String, dynamic> json) => PurchaseUnit(
      referenceId: json['reference_id'] as String?,
      amount: json['amount'] == null
          ? null
          : AmountWithBreakdown.fromJson(
              json['amount'] as Map<String, dynamic>),
      payee: json['payee'] == null
          ? null
          : Payee.fromJson(json['payee'] as Map<String, dynamic>),
      paymentInstruction: json['payment_instruction'] == null
          ? null
          : PaymentInstruction.fromJson(
              json['payment_instruction'] as Map<String, dynamic>),
      description: json['description'] as String?,
      customId: json['custom_id'] as String?,
      invoiceId: json['invoice_id'] as String?,
      softDescriptor: json['soft_descriptor'] as String?,
      id: json['id'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      shipping: json['shipping'] == null
          ? null
          : ShippingDetail.fromJson(json['shipping'] as Map<String, dynamic>),
      payments: json['payments'] == null
          ? null
          : PaymentCollection.fromJson(
              json['payments'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PurchaseUnitToJson(PurchaseUnit instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('reference_id', instance.referenceId);
  val['amount'] = instance.amount;
  writeNotNull('payee', instance.payee);
  writeNotNull('payment_instruction', instance.paymentInstruction);
  writeNotNull('description', instance.description);
  writeNotNull('custom_id', instance.customId);
  writeNotNull('invoice_id', instance.invoiceId);
  writeNotNull('soft_descriptor', instance.softDescriptor);
  writeNotNull('id', instance.id);
  writeNotNull('items', instance.items);
  writeNotNull('shipping', instance.shipping);
  writeNotNull('payments', instance.payments);
  return val;
}
