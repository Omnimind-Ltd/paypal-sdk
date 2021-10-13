import 'package:json_annotation/json_annotation.dart';

part 'payer.g.dart';

/// The payer of an order.
@JsonSerializable(fieldRename: FieldRename.snake)
class Payer {
  /// The email address of the payer.
  final String? emailAddress;

  /// The PayPal-assigned ID for the payer.
  final String? payerId;

  const Payer({this.emailAddress, this.payerId});

  Map<String, dynamic> toJson() => _$PayerToJson(this);

  factory Payer.fromJson(Map<String, dynamic> json) => _$PayerFromJson(json);

  @override
  String toString() {
    return 'Payer{emailAddress: $emailAddress, payerId: $payerId}';
  }
}
