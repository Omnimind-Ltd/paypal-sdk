import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_paypal_sdk/core.dart';

part 'platform_fee.g.dart';

/// The platform fee.
@JsonSerializable(fieldRename: FieldRename.snake)
class PlatformFee {
  /// The fee for this transaction.
  final Money amount;

  /// The recipient of the fee for this transaction. If you omit this value, the
  /// default is the API caller.
  final Payee? payee;

  const PlatformFee({required this.amount, this.payee});

  Map<String, dynamic> toJson() => _$PlatformFeeToJson(this);

  factory PlatformFee.fromJson(Map<String, dynamic> json) => _$PlatformFeeFromJson(json);

  @override
  String toString() {
    return 'PlatformFee{amount: $amount, payee: $payee}';
  }
}
