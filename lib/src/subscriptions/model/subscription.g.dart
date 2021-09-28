// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subscription _$SubscriptionFromJson(Map<String, dynamic> json) => Subscription(
      json['id'] as String,
      json['plan_id'] as String,
      json['status'] as String?,
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
    'plan_id': instance.planId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', instance.status);
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
