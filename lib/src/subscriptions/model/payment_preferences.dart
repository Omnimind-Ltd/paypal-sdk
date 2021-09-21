import 'package:json_annotation/json_annotation.dart';
import 'package:paypal_sdk/core.dart';

part 'payment_preferences.g.dart';

/// Payment preferences.
@JsonSerializable()
class PaymentPreferences {
  static const String setupFeeFailureActionContinue = 'CONTINUE';
  static const String setupFeeFailureActionCancel = 'CANCEL';

  /// Indicates whether to automatically bill the outstanding amount in the next
  /// billing cycle.
  @JsonKey(name: 'auto_bill_outstanding')
  bool? autoBillOutstanding;

  /// The initial set-up fee for the service.
  @JsonKey(name: 'setup_fee')
  Money? setupFee;

  /// The action to take on the subscription if the initial payment for the
  /// setup fails.
  ///
  /// The possible values are:
  /// <ul>
  /// <li>
  /// CONTINUE. Continues the subscription if the initial payment for the setup
  /// fails.
  /// </li>
  /// <li>
  /// CANCEL. Cancels the subscription if the initial payment for the setup
  /// fails.
  /// </li>
  /// </ul>
  @JsonKey(name: 'setup_fee_failure_action')
  String? setupFeeFailureAction;

  /// The maximum number of payment failures before a subscription is suspended.
  /// For example, if payment_failure_threshold is 2, the subscription
  /// automatically updates to the SUSPEND state if two consecutive payments
  /// fail.
  @JsonKey(name: 'payment_failure_threshold')
  int? paymentFailureThreshold;

  PaymentPreferences(
      {this.autoBillOutstanding,
      this.setupFee,
      this.setupFeeFailureAction,
      this.paymentFailureThreshold});

  Map<String, dynamic> toJson() => _$PaymentPreferencesToJson(this);

  factory PaymentPreferences.fromJson(Map<String, dynamic> json) =>
      _$PaymentPreferencesFromJson(json);

  @override
  String toString() {
    return 'PaymentPreferences{autoBillOutstanding: $autoBillOutstanding, '
        'setupFee: $setupFee, setupFeeFailureAction: $setupFeeFailureAction, '
        'paymentFailureThreshold: $paymentFailureThreshold}';
  }
}
