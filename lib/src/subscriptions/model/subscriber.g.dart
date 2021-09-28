// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscriber.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subscriber _$SubscriberFromJson(Map<String, dynamic> json) => Subscriber(
      name: json['name'] == null
          ? null
          : Name.fromJson(json['name'] as Map<String, dynamic>),
      emailAddress: json['email_address'] as String?,
      payerId: json['payer_id'] as String,
      phone: json['phone'] == null
          ? null
          : Phone.fromJson(json['phone'] as Map<String, dynamic>),
      shippingAddress: json['shipping_address'] == null
          ? null
          : ShippingDetail.fromJson(
              json['shipping_address'] as Map<String, dynamic>),
      paymentSource: json['payment_source'] == null
          ? null
          : PaymentSource.fromJson(
              json['payment_source'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubscriberToJson(Subscriber instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('email_address', instance.emailAddress);
  val['payer_id'] = instance.payerId;
  writeNotNull('phone', instance.phone);
  writeNotNull('shipping_address', instance.shippingAddress);
  writeNotNull('payment_source', instance.paymentSource);
  return val;
}
