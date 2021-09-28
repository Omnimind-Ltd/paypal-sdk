// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationContext _$ApplicationContextFromJson(Map<String, dynamic> json) =>
    ApplicationContext(
      brandName: json['brand_name'] as String?,
      locale: json['locale'] as String?,
      shippingPreference: _$enumDecodeNullable(
          _$ShippingPreferenceEnumMap, json['shipping_preference']),
      userAction:
          _$enumDecodeNullable(_$UserActionEnumMap, json['user_action']),
      paymentMethod: json['payment_method'] == null
          ? null
          : PaymentMethod.fromJson(
              json['payment_method'] as Map<String, dynamic>),
      returnUrl: json['return_url'] as String,
      cancelUrl: json['cancel_url'] as String,
    );

Map<String, dynamic> _$ApplicationContextToJson(ApplicationContext instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('brand_name', instance.brandName);
  writeNotNull('locale', instance.locale);
  writeNotNull('shipping_preference',
      _$ShippingPreferenceEnumMap[instance.shippingPreference]);
  writeNotNull('user_action', _$UserActionEnumMap[instance.userAction]);
  writeNotNull('payment_method', instance.paymentMethod);
  val['return_url'] = instance.returnUrl;
  val['cancel_url'] = instance.cancelUrl;
  return val;
}

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$ShippingPreferenceEnumMap = {
  ShippingPreference.getFromFile: 'GET_FROM_FILE',
  ShippingPreference.noShipping: 'NO_SHIPPING',
  ShippingPreference.setProvidedAddress: 'SET_PROVIDED_ADDRESS',
};

const _$UserActionEnumMap = {
  UserAction.continue_: 'CONTINUE',
  UserAction.subscribedNow: 'SUBSCRIBE_NOW',
};
