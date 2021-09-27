import 'package:json_annotation/json_annotation.dart';

part 'address_details.g.dart';

/// Address details
@JsonSerializable()
class AddressDetails {
  /// The street number.
  @JsonKey(name: 'street_number')
  final String? streetNumber;

  /// The street name. Just Drury in Drury Lane.
  @JsonKey(name: 'street_name')
  final String? streetName;

  /// The street type. For example, avenue, boulevard, road, or expressway.
  @JsonKey(name: 'street_type')
  final String? streetType;

  /// The delivery service. Post office box, bag number, or post office name.
  @JsonKey(name: 'delivery_service')
  final String? deliveryService;

  /// A named locations that represents the premise. Usually a building name or
  /// number or collection of buildings with a common name or number.
  /// For example, Craven House.
  @JsonKey(name: 'building_name')
  final String? buildingName;

  /// The first-order entity below a named building or location that represents
  /// the sub-premise. Usually a single building within a collection of buildings
  /// with a common name. Can be a flat, story, floor, room, or apartment.
  @JsonKey(name: 'sub_building')
  final String? subBuilding;

  const AddressDetails(this.streetNumber, this.streetName, this.streetType,
      this.deliveryService, this.buildingName, this.subBuilding);

  Map<String, dynamic> toJson() => _$AddressDetailsToJson(this);

  factory AddressDetails.fromJson(Map<String, dynamic> json) =>
      _$AddressDetailsFromJson(json);

  @override
  String toString() {
    return 'AddressDetails{streetNumber: $streetNumber, streetName: $streetName, '
        'streetType: $streetType, deliveryService: $deliveryService, '
        'buildingName: $buildingName, subBuilding: $subBuilding}';
  }
}
