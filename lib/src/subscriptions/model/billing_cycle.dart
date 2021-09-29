import 'package:json_annotation/json_annotation.dart';

import 'frequency.dart';
import 'pricing_scheme.dart';

part 'billing_cycle.g.dart';

/// The tenure type of the billing cycle
enum TenureType {
  /// A regular billing cycle.
  @JsonValue('REGULAR')
  regular,

  /// A trial billing cycle.
  @JsonValue('TRIAL')
  trial,
}

/// Billing cycle.
@JsonSerializable(fieldRename: FieldRename.snake)
class BillingCycle {
  /// The active pricing scheme for this billing cycle. A free trial billing
  /// cycle does not require a pricing scheme.
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
  TenureType tenureType;

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

/// Trial and regular billing executions.
@JsonSerializable(fieldRename: FieldRename.snake)
class CycleExecution {
  /// The type of the billing cycle.
  final TenureType tenureType;

  /// The order in which to run this cycle among other billing cycles.
  final int sequence;

  /// The number of billing cycles that have completed.
  final int cyclesCompleted;

  /// For a finite billing cycle, cycles_remaining is the number of remaining
  /// cycles. For an infinite billing cycle, cycles_remaining is set as 0.
  final int? cyclesRemaining;

  const CycleExecution(
      {required this.tenureType,
      required this.sequence,
      required this.cyclesCompleted,
      this.cyclesRemaining});

  Map<String, dynamic> toJson() => _$CycleExecutionToJson(this);

  factory CycleExecution.fromJson(Map<String, dynamic> json) =>
      _$CycleExecutionFromJson(json);

  @override
  String toString() {
    return 'CycleExecution{tenureType: $tenureType, sequence: $sequence, '
        'cyclesCompleted: $cyclesCompleted, cyclesRemaining: $cyclesRemaining}';
  }
}
