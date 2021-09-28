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

/// Address portable.
@JsonSerializable()
class AddressPortable {
  /// The first line of the address. For example, number or street. For example,
  /// 173 Drury Lane. Required for data entry and compliance and risk checks.
  /// Must contain the full address.
  @JsonKey(name: 'address_line_1')
  final String? addressLine1;

  /// The second line of the address. For example, suite or apartment number.
  @JsonKey(name: 'address_line_2')
  final String? addressLine2;

  /// The third line of the address, if needed. For example, a street complement
  /// for Brazil, direction text, such as next to Walmart, or a landmark in an
  /// Indian address.
  @JsonKey(name: 'address_line_3')
  final String? addressLine3;

  /// The neighborhood, ward, or district. Smaller than admin_area_level_3 or
  /// sub_locality. Value is:
  /// <ul>
  /// <li>
  /// The postal sorting code for Guernsey and many French territories, such as
  /// French Guiana.
  /// </li>
  /// <li>
  /// The fine-grained administrative levels in China.
  /// </li>
  /// </ul>
  @JsonKey(name: 'admin_area_4')
  final String? adminArea4;

  /// A sub-locality, suburb, neighborhood, or district.
  /// Smaller than admin_area_level_2. Value is:
  /// <ul>
  /// <li>
  /// Brazil. Suburb, bairro, or neighborhood.
  /// </li>
  /// <li>
  /// India. Sub-locality or district. Street name information is not always
  /// available but a sub-locality or district can be a very small area.
  /// </li>
  /// </ul>
  @JsonKey(name: 'admin_area_3')
  final String? adminArea3;

  /// A city, town, or village. Smaller than admin_area_level_1.
  @JsonKey(name: 'admin_area_2')
  final String? adminArea2;

  /// The highest level sub-division in a country, which is usually a province,
  /// state, or ISO-3166-2 subdivision. Format for postal delivery.
  /// For example, CA and not California. Value, by country, is:
  /// <ul>
  /// <li>
  /// UK. A county.
  /// </li>
  /// <li>
  /// US. A state.
  /// </li>
  /// <li>
  /// Canada. A province.
  /// </li>
  /// <li>
  /// Japan. A prefecture.
  /// </li>
  /// <li>
  /// Switzerland. A kanton.
  /// </li>
  /// </ul>
  @JsonKey(name: 'admin_area_1')
  final String? adminArea1;

  /// The postal code, which is the zip code or equivalent. Typically required
  /// for countries with a postal code or an equivalent.
  /// See <a href="https://en.wikipedia.org/wiki/Postal_code">postal code.</a>
  @JsonKey(name: 'postal_code')
  final String? postalCode;

  /// The <a href="https://developer.paypal.com/docs/integration/direct/rest/country-codes/">
  /// two-character ISO 3166-1 code</a> that identifies the country or region.
  @JsonKey(name: 'countryCode')
  final String? countryCode;

  /// The non-portable additional address details that are sometimes needed for
  /// compliance, risk, or other scenarios where fine-grain address information
  /// might be needed. Not portable with common third party and open source.
  /// Redundant with core fields. For example, address_portable.address_line_1
  /// is usually a combination of address_details.street_number, street_name,
  /// and street_type.
  @JsonKey(name: 'address_details')
  final AddressDetails? addressDetails;

  const AddressPortable(
      this.addressLine1,
      this.addressLine2,
      this.addressLine3,
      this.adminArea4,
      this.adminArea3,
      this.adminArea2,
      this.adminArea1,
      this.postalCode,
      this.countryCode,
      this.addressDetails);

  Map<String, dynamic> toJson() => _$AddressPortableToJson(this);

  factory AddressPortable.fromJson(Map<String, dynamic> json) =>
      _$AddressPortableFromJson(json);

  @override
  String toString() {
    return 'AddressPortable{addressLine1: $addressLine1, '
        'addressLine2: $addressLine2, addressLine3: $addressLine3, '
        'adminArea4: $adminArea4, adminArea3: $adminArea3, '
        'adminArea2: $adminArea2, adminArea1: $adminArea1, '
        'postalCode: $postalCode, countryCode: $countryCode, '
        'addressDetails: $addressDetails}';
  }
}
