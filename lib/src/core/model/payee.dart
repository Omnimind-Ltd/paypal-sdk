import 'package:json_annotation/json_annotation.dart';

part 'payee.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Payee {
  /// The email address of merchant.
  final String? emailAddress;

  /// The encrypted PayPal account ID of the merchant.
  final String? merchantId;

  const Payee({this.emailAddress, this.merchantId});

  Map<String, dynamic> toJson() => _$PayeeToJson(this);

  factory Payee.fromJson(Map<String, dynamic> json) => _$PayeeFromJson(json);

  @override
  String toString() {
    return 'Payee{emailAddress: $emailAddress, merchantId: $merchantId}';
  }
}
