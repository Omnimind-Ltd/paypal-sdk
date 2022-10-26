// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subscription _$SubscriptionFromJson(Map<String, dynamic> json) => Subscription(
      json['id'] as String,
      json['plan_id'] as String?,
      $enumDecodeNullable(_$SubscriptionStatusEnumMap, json['status']),
      json['status_change_note'] as String?,
      json['status_update_time'] as String?,
      json['start_time'] as String?,
      json['quantity'] as String?,
      json['shipping_amount'] == null
          ? null
          : Money.fromJson(json['shipping_amount'] as Map<String, dynamic>),
      json['subscriber'] == null
          ? null
          : Subscriber.fromJson(json['subscriber'] as Map<String, dynamic>),
      json['billing_info'] == null
          ? null
          : SubscriptionBillingInfo.fromJson(
              json['billing_info'] as Map<String, dynamic>),
      json['create_time'] as String?,
      json['update_time'] as String?,
      json['custom_id'] as String?,
      json['plan_overridden'] as bool?,
      json['plan'] == null
          ? null
          : Plan.fromJson(json['plan'] as Map<String, dynamic>),
      (json['links'] as List<dynamic>?)
          ?.map((e) => LinkDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubscriptionToJson(Subscription instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('plan_id', instance.planId);
  writeNotNull('status', _$SubscriptionStatusEnumMap[instance.status]);
  writeNotNull('status_change_note', instance.statusChangeNote);
  writeNotNull('status_update_time', instance.statusUpdateTime);
  writeNotNull('start_time', instance.startTime);
  writeNotNull('quantity', instance.quantity);
  writeNotNull('shipping_amount', instance.shippingAmount);
  writeNotNull('subscriber', instance.subscriber);
  writeNotNull('billing_info', instance.billingInfo);
  writeNotNull('create_time', instance.createTime);
  writeNotNull('update_time', instance.updateTime);
  writeNotNull('custom_id', instance.customId);
  writeNotNull('plan_overridden', instance.planOverridden);
  writeNotNull('plan', instance.plan);
  writeNotNull('links', instance.links);
  return val;
}

const _$SubscriptionStatusEnumMap = {
  SubscriptionStatus.approvalPending: 'APPROVAL_PENDING',
  SubscriptionStatus.approved: 'APPROVED',
  SubscriptionStatus.active: 'ACTIVE',
  SubscriptionStatus.suspended: 'SUSPENDED',
  SubscriptionStatus.cancelled: 'CANCELLED',
  SubscriptionStatus.expired: 'EXPIRED',
};

SubscriptionBillingInfo _$SubscriptionBillingInfoFromJson(
        Map<String, dynamic> json) =>
    SubscriptionBillingInfo(
      outstandingBalance:
          Money.fromJson(json['outstanding_balance'] as Map<String, dynamic>),
      cycleExecutions: (json['cycle_executions'] as List<dynamic>?)
          ?.map((e) => CycleExecution.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastPayment: json['last_payment'] == null
          ? null
          : LastPaymentDetails.fromJson(
              json['last_payment'] as Map<String, dynamic>),
      nextBillingTime: json['next_billing_time'] as String?,
      finalPaymentTime: json['final_payment_time'] as String?,
      failedPaymentsCount: json['failed_payments_count'] as int,
      lastFailedPayment: json['last_failed_payment'] == null
          ? null
          : FailedPaymentDetails.fromJson(
              json['last_failed_payment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubscriptionBillingInfoToJson(
    SubscriptionBillingInfo instance) {
  final val = <String, dynamic>{
    'outstanding_balance': instance.outstandingBalance,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cycle_executions', instance.cycleExecutions);
  writeNotNull('last_payment', instance.lastPayment);
  writeNotNull('next_billing_time', instance.nextBillingTime);
  writeNotNull('final_payment_time', instance.finalPaymentTime);
  val['failed_payments_count'] = instance.failedPaymentsCount;
  writeNotNull('last_failed_payment', instance.lastFailedPayment);
  return val;
}

SubscriptionRequest _$SubscriptionRequestFromJson(Map<String, dynamic> json) =>
    SubscriptionRequest(
      planId: json['plan_id'] as String,
      quantity: json['quantity'] as String?,
      shippingAmount: json['shipping_amount'] == null
          ? null
          : Money.fromJson(json['shipping_amount'] as Map<String, dynamic>),
      subscriber: json['subscriber'] == null
          ? null
          : Subscriber.fromJson(json['subscriber'] as Map<String, dynamic>),
      billingInfo: json['billing_info'] == null
          ? null
          : SubscriptionBillingInfo.fromJson(
              json['billing_info'] as Map<String, dynamic>),
      applicationContext: json['application_context'] == null
          ? null
          : ApplicationContext.fromJson(
              json['application_context'] as Map<String, dynamic>),
      customId: json['custom_id'] as String?,
      plan: json['plan'] == null
          ? null
          : Plan.fromJson(json['plan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubscriptionRequestToJson(SubscriptionRequest instance) {
  final val = <String, dynamic>{
    'plan_id': instance.planId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('quantity', instance.quantity);
  writeNotNull('shipping_amount', instance.shippingAmount);
  writeNotNull('subscriber', instance.subscriber);
  writeNotNull('billing_info', instance.billingInfo);
  writeNotNull('application_context', instance.applicationContext);
  writeNotNull('custom_id', instance.customId);
  writeNotNull('plan', instance.plan);
  return val;
}

SubscriptionCaptureRequest _$SubscriptionCaptureRequestFromJson(
        Map<String, dynamic> json) =>
    SubscriptionCaptureRequest(
      note: json['note'] as String,
      amount: Money.fromJson(json['amount'] as Map<String, dynamic>),
      captureType:
          $enumDecodeNullable(_$CaptureTypeEnumMap, json['capture_type']) ??
              CaptureType.outstandingBalance,
    );

Map<String, dynamic> _$SubscriptionCaptureRequestToJson(
        SubscriptionCaptureRequest instance) =>
    <String, dynamic>{
      'note': instance.note,
      'capture_type': _$CaptureTypeEnumMap[instance.captureType]!,
      'amount': instance.amount,
    };

const _$CaptureTypeEnumMap = {
  CaptureType.outstandingBalance: 'OUTSTANDING_BALANCE',
};

SubscriptionReviseRequest _$SubscriptionReviseRequestFromJson(
        Map<String, dynamic> json) =>
    SubscriptionReviseRequest(
      planId: json['plan_id'] as String,
      quantity: json['quantity'] as String?,
      effectiveTime: json['effective_time'] as String?,
      shippingAmount: json['shipping_amount'] == null
          ? null
          : Money.fromJson(json['shipping_amount'] as Map<String, dynamic>),
      shippingAddress: json['shipping_address'] == null
          ? null
          : AddressPortable.fromJson(
              json['shipping_address'] as Map<String, dynamic>),
      applicationContext: json['application_context'] == null
          ? null
          : ApplicationContext.fromJson(
              json['application_context'] as Map<String, dynamic>),
      plan: json['plan'] == null
          ? null
          : Plan.fromJson(json['plan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubscriptionReviseRequestToJson(
    SubscriptionReviseRequest instance) {
  final val = <String, dynamic>{
    'plan_id': instance.planId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('quantity', instance.quantity);
  writeNotNull('effective_time', instance.effectiveTime);
  writeNotNull('shipping_amount', instance.shippingAmount);
  writeNotNull('shipping_address', instance.shippingAddress);
  writeNotNull('application_context', instance.applicationContext);
  writeNotNull('plan', instance.plan);
  return val;
}

SubscriptionReviseResponse _$SubscriptionReviseResponseFromJson(
        Map<String, dynamic> json) =>
    SubscriptionReviseResponse(
      json['plan_id'] as String?,
      json['quantity'] as String?,
      json['effective_time'] as String?,
      json['shipping_amount'] == null
          ? null
          : Money.fromJson(json['shipping_amount'] as Map<String, dynamic>),
      json['subscriber'] == null
          ? null
          : Subscriber.fromJson(json['subscriber'] as Map<String, dynamic>),
      json['shipping_address'] == null
          ? null
          : AddressPortable.fromJson(
              json['shipping_address'] as Map<String, dynamic>),
      json['plan_overridden'] as bool?,
      json['plan'] == null
          ? null
          : Plan.fromJson(json['plan'] as Map<String, dynamic>),
      (json['links'] as List<dynamic>?)
          ?.map((e) => LinkDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubscriptionReviseResponseToJson(
    SubscriptionReviseResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('plan_id', instance.planId);
  writeNotNull('quantity', instance.quantity);
  writeNotNull('effective_time', instance.effectiveTime);
  writeNotNull('shipping_amount', instance.shippingAmount);
  writeNotNull('subscriber', instance.subscriber);
  writeNotNull('shipping_address', instance.shippingAddress);
  writeNotNull('plan_overridden', instance.planOverridden);
  writeNotNull('plan', instance.plan);
  writeNotNull('links', instance.links);
  return val;
}

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

ApplicationContext _$ApplicationContextFromJson(Map<String, dynamic> json) =>
    ApplicationContext(
      brandName: json['brand_name'] as String?,
      locale: json['locale'] as String?,
      shippingPreference: $enumDecodeNullable(
          _$ShippingPreferenceEnumMap, json['shipping_preference']),
      userAction: $enumDecodeNullable(_$UserActionEnumMap, json['user_action']),
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

const _$ShippingPreferenceEnumMap = {
  ShippingPreference.getFromFile: 'GET_FROM_FILE',
  ShippingPreference.noShipping: 'NO_SHIPPING',
  ShippingPreference.setProvidedAddress: 'SET_PROVIDED_ADDRESS',
};

const _$UserActionEnumMap = {
  UserAction.continue_: 'CONTINUE',
  UserAction.subscribedNow: 'SUBSCRIBE_NOW',
};
