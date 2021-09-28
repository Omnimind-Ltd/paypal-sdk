import 'package:json_annotation/json_annotation.dart';
import 'package:paypal_sdk/core.dart';

part 'payment_preferences.g.dart';

/// The action to take on the subscription if the initial payment for the
/// setup fails.
enum SetupFeeFailureAction {
  /// Continues the subscription if the initial payment for the setup
  @JsonValue('CONTINUE')
  continue_,

  /// Cancels the subscription if the initial payment for the setup
  @JsonValue('CANCEL')
  cancel,
}

/// Payment preferences.
@JsonSerializable(fieldRename: FieldRename.snake)
class PaymentPreferences {
  /// Indicates whether to automatically bill the outstanding amount in the next
  /// billing cycle.
  bool? autoBillOutstanding;

  /// The initial set-up fee for the service.
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
  SetupFeeFailureAction? setupFeeFailureAction;

  /// The maximum number of payment failures before a subscription is suspended.
  /// For example, if payment_failure_threshold is 2, the subscription
  /// automatically updates to the SUSPEND state if two consecutive payments
  /// fail.
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
