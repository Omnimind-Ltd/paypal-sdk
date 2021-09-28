import 'package:json_annotation/json_annotation.dart';
import 'package:paypal_sdk/core.dart';

part 'subscriber.g.dart';

/// A subscriber.
@JsonSerializable(fieldRename: FieldRename.snake)
class Subscriber {
  /// The name of the payer. Supports only the given_name and surname properties.
  final Name? name;

  /// The email address of the payer.
  final String? emailAddress;

  /// The PayPal-assigned ID for the payer.
  final String payerId;

  /// The phone number of the customer. Available only when you enable the Contact
  /// Telephone Number option in the
  /// <a href="https://www.paypal.com/cgi-bin/customerprofileweb?cmd=_profile-website-payments&_ga=1.219663193.134270098.1627037710">
  /// Profile & Settings</a> for the merchant's PayPal account. The phone.phone_number
  /// supports only national_number.
  final Phone? phone;

  /// The shipping details.
  final ShippingDetail? shippingAddress;

  /// The payment source used to fund the payment.
  final PaymentSource? paymentSource;

  const Subscriber(
      {this.name,
      this.emailAddress,
      required this.payerId,
      this.phone,
      this.shippingAddress,
      this.paymentSource});

  Map<String, dynamic> toJson() => _$SubscriberToJson(this);

  factory Subscriber.fromJson(Map<String, dynamic> json) =>
      _$SubscriberFromJson(json);

  @override
  String toString() {
    return 'Subscriber{name: $name, emailAddress: $emailAddress, payerId: $payerId, '
        'phone: $phone, shippingAddress: $shippingAddress, paymentSource: $paymentSource}';
  }
}
