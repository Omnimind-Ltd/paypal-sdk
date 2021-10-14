// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      id: json['id'] as String?,
      paymentSource: json['payment_source'] == null
          ? null
          : PaymentSource.fromJson(
              json['payment_source'] as Map<String, dynamic>),
      intent: json['intent'] as String?,
      payer: json['payer'] == null
          ? null
          : Payer.fromJson(json['payer'] as Map<String, dynamic>),
      purchaseUnits: (json['purchase_units'] as List<dynamic>?)
          ?.map((e) => PurchaseUnit.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      createTime: json['create_time'] as String?,
      updateTime: json['update_time'] as String?,
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => LinkDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderToJson(Order instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('payment_source', instance.paymentSource);
  writeNotNull('intent', instance.intent);
  writeNotNull('payer', instance.payer);
  writeNotNull('purchase_units', instance.purchaseUnits);
  writeNotNull('status', instance.status);
  writeNotNull('create_time', instance.createTime);
  writeNotNull('update_time', instance.updateTime);
  writeNotNull('links', instance.links);
  return val;
}

OrderRequest _$OrderRequestFromJson(Map<String, dynamic> json) => OrderRequest(
      intent: _$enumDecode(_$OrderRequestIntentEnumMap, json['intent']),
      payer: json['payer'] == null
          ? null
          : Payer.fromJson(json['payer'] as Map<String, dynamic>),
      purchaseUnits: (json['purchase_units'] as List<dynamic>)
          .map((e) => PurchaseUnitRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      applicationContext: json['application_context'] == null
          ? null
          : ApplicationContext.fromJson(
              json['application_context'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderRequestToJson(OrderRequest instance) {
  final val = <String, dynamic>{
    'intent': _$OrderRequestIntentEnumMap[instance.intent],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('payer', instance.payer);
  val['purchase_units'] = instance.purchaseUnits;
  writeNotNull('application_context', instance.applicationContext);
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

const _$OrderRequestIntentEnumMap = {
  OrderRequestIntent.capture: 'CAPTURE',
  OrderRequestIntent.authorize: 'AUTHORIZE',
};

ApplicationContext _$ApplicationContextFromJson(Map<String, dynamic> json) =>
    ApplicationContext(
      brandName: json['brand_name'] as String?,
      locale: json['locale'] as String?,
      landingPage:
          _$enumDecodeNullable(_$LandingPageEnumMap, json['landing_page']),
      shippingPreference: _$enumDecodeNullable(
          _$ShippingPreferenceEnumMap, json['shipping_preference']),
      userAction:
          _$enumDecodeNullable(_$UserActionEnumMap, json['user_action']),
      paymentMethod: json['payment_method'] == null
          ? null
          : PaymentMethod.fromJson(
              json['payment_method'] as Map<String, dynamic>),
      returnUrl: json['return_url'] as String?,
      cancelUrl: json['cancel_url'] as String?,
      storedPaymentSource: json['stored_payment_source'] == null
          ? null
          : StoredPaymentSource.fromJson(
              json['stored_payment_source'] as Map<String, dynamic>),
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
  writeNotNull('landing_page', _$LandingPageEnumMap[instance.landingPage]);
  writeNotNull('shipping_preference',
      _$ShippingPreferenceEnumMap[instance.shippingPreference]);
  writeNotNull('user_action', _$UserActionEnumMap[instance.userAction]);
  writeNotNull('payment_method', instance.paymentMethod);
  writeNotNull('return_url', instance.returnUrl);
  writeNotNull('cancel_url', instance.cancelUrl);
  writeNotNull('stored_payment_source', instance.storedPaymentSource);
  return val;
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

const _$LandingPageEnumMap = {
  LandingPage.login: 'LOGIN',
  LandingPage.billing: 'BILLING',
  LandingPage.noPreference: 'NO_PREFERENCE',
};

const _$ShippingPreferenceEnumMap = {
  ShippingPreference.getFromFile: 'GET_FROM_FILE',
  ShippingPreference.noShipping: 'NO_SHIPPING',
  ShippingPreference.setProvidedAddress: 'SET_PROVIDED_ADDRESS',
};

const _$UserActionEnumMap = {
  UserAction.continue_: 'CONTINUE',
  UserAction.payNow: 'PAY_NOW',
};
