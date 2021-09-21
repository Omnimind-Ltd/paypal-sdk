// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billing_cycle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillingCycle _$BillingCycleFromJson(Map<String, dynamic> json) => BillingCycle(
      pricingScheme: json['pricing_scheme'] == null
          ? null
          : PricingScheme.fromJson(
              json['pricing_scheme'] as Map<String, dynamic>),
      frequency: Frequency.fromJson(json['frequency'] as Map<String, dynamic>),
      tenureType: json['tenure_type'] as String,
      sequence: json['sequence'] as int?,
      totalCycles: json['total_cycles'] as int?,
    );

Map<String, dynamic> _$BillingCycleToJson(BillingCycle instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('pricing_scheme', instance.pricingScheme);
  val['frequency'] = instance.frequency;
  val['tenure_type'] = instance.tenureType;
  writeNotNull('sequence', instance.sequence);
  writeNotNull('total_cycles', instance.totalCycles);
  return val;
}
