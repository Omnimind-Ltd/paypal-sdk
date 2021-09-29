import 'package:json_annotation/json_annotation.dart';

import 'address.dart';

part 'card.g.dart';

/// A payment card.
@JsonSerializable(fieldRename: FieldRename.snake)
class Card {
  /// The card holder's name as it appears on the card.
  final String? name;

  /// The primary account number (PAN) for the payment card.
  final String number;

  /// The card expiration year and month, in
  /// <a href="https://tools.ietf.org/html/rfc3339#section-5.6">Internet date format</a>.
  final String expiry;

  /// The three- or four-digit security code of the card. Also known as the CVV,
  /// CVC, CVN, CVE, or CID.
  final String? securityCode;

  /// The billing address for this card. Supports only the address_line_1,
  /// address_line_2, admin_area_1, admin_area_2, postal_code, and country_code
  /// properties.
  final AddressPortable? billingAddress;

  const Card(
      {required this.number,
      required this.expiry,
      this.name,
      this.securityCode,
      this.billingAddress});

  Map<String, dynamic> toJson() => _$CardToJson(this);

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);

  @override
  String toString() {
    return 'Card{name: $name, number: $number, expiry: $expiry, '
        'securityCode: $securityCode, billingAddress: $billingAddress}';
  }
}
