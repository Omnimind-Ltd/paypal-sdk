import 'package:json_annotation/json_annotation.dart';
import 'package:paypal_sdk/src/core/model/card.dart';

part 'payment.g.dart';

/// A payment source
@JsonSerializable()
class PaymentSource {
  /// The payment card used to fund the payment. Card can be a credit or debit card.
  final Card card;

  const PaymentSource(this.card);

  Map<String, dynamic> toJson() => _$PaymentSourceToJson(this);

  factory PaymentSource.fromJson(Map<String, dynamic> json) =>
      _$PaymentSourceFromJson(json);

  @override
  String toString() {
    return 'PaymentSource{card: $card}';
  }
}
