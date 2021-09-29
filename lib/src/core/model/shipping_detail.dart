import 'package:json_annotation/json_annotation.dart';

import 'address.dart';
import 'name.dart';

part 'shipping_detail.g.dart';

enum ShippingType {
  /// The payer intends to receive the items at a specified address.
  @JsonValue('SHIPPING')
  shipping,

  /// The payer intends to pick up the items from the payee in person.
  @JsonValue('PICKUP_IN_PERSON')
  pickupInPerson,
}

@JsonSerializable()
class ShippingDetail {
  /// The name of the person to whom to ship the items.
  final Name? name;

  /// The method by which the payer wants to get their items from the payee
  /// e.g shipping, in-person pickup. Either type or options but not both may be present.
  final String? type;

  /// The address of the person to whom to ship the items
  final AddressPortable? address;

  ShippingDetail(this.name, this.type, this.address);

  Map<String, dynamic> toJson() => _$ShippingDetailToJson(this);

  factory ShippingDetail.fromJson(Map<String, dynamic> json) =>
      _$ShippingDetailFromJson(json);

  @override
  String toString() {
    return 'ShippingDetail{name: $name, type: $type, address: $address}';
  }
}
