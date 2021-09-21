import 'package:json_annotation/json_annotation.dart';
import 'package:paypal_sdk/src/subscriptions/model/frequency.dart';
import 'package:paypal_sdk/src/subscriptions/model/pricing_scheme.dart';

part 'billing_cycle.g.dart';

/// Billing cycle.
@JsonSerializable()
class BillingCycle {
  static const String tenureTypeRegular = 'REGULAR';
  static const String tenureTypeTrial = 'TRIAL';

  /// The active pricing scheme for this billing cycle. A free trial billing
  /// cycle does not require a pricing scheme.
  @JsonKey(name: 'pricing_scheme')
  PricingScheme? pricingScheme;

  /// The frequency details for this billing cycle.
  Frequency frequency;

  /// The tenure type of the billing cycle. In case of a plan having trial cycle
  /// , only 2 trial cycles are allowed per plan.
  /// The possible values are:
  /// <ul>
  /// <li>
  /// REGULAR. A regular billing cycle.
  /// </li>
  /// <li>
  /// TRIAL. A trial billing cycle.
  /// </li>
  /// </ul>
  @JsonKey(name: 'tenure_type')
  String tenureType;

  /// The order in which this cycle is to run among other billing cycles. For
  /// example, a trial billing cycle has a sequence of 1 while a regular billing
  /// cycle has a sequence of 2, so that trial cycle runs before the regular
  /// cycle.
  int? sequence;

  /// The number of times this billing cycle gets executed. Trial billing cycles
  /// can only be executed a finite number of times (value between 1 and 999 for
  /// total_cycles). Regular billing cycles can be executed infinite times
  /// (value of 0 for total_cycles) or a finite number of times (value between 1
  /// and 999 for total_cycles).
  @JsonKey(name: 'total_cycles')
  int? totalCycles;

  BillingCycle(
      {this.pricingScheme,
      required this.frequency,
      required this.tenureType,
      this.sequence,
      this.totalCycles});

  Map<String, dynamic> toJson() => _$BillingCycleToJson(this);

  factory BillingCycle.fromJson(Map<String, dynamic> json) =>
      _$BillingCycleFromJson(json);

  @override
  String toString() {
    return 'BillingCycle{pricingScheme: $pricingScheme, frequency: $frequency, '
        'tenureType: $tenureType, sequence: $sequence, '
        'totalCycles: $totalCycles}';
  }
}
