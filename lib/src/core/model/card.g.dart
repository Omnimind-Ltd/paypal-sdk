// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Card _$CardFromJson(Map<String, dynamic> json) => Card(
      number: json['number'] as String,
      expiry: json['expiry'] as String,
      name: json['name'] as String?,
      securityCode: json['security_code'] as String?,
      billingAddress: json['billing_address'] == null
          ? null
          : AddressPortable.fromJson(
              json['billing_address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CardToJson(Card instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  val['number'] = instance.number;
  val['expiry'] = instance.expiry;
  writeNotNull('security_code', instance.securityCode);
  writeNotNull('billing_address', instance.billingAddress);
  return val;
}
