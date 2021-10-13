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
