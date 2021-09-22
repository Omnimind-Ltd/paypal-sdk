import 'package:json_annotation/json_annotation.dart';
import 'package:paypal_sdk/src/subscriptions/model/pricing_scheme.dart';

part 'pricing_schemes_update_request.g.dart';

@JsonSerializable()
class PricingSchemesUpdateRequest {
  @JsonKey(name: 'pricing_schemes')
  List<PricingSchemeUpdateRequest> pricingSchemes;

  PricingSchemesUpdateRequest(this.pricingSchemes);

  Map<String, dynamic> toJson() => _$PricingSchemesUpdateRequestToJson(this);

  factory PricingSchemesUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$PricingSchemesUpdateRequestFromJson(json);

  @override
  String toString() {
    return 'PricingSchemes{pricingSchemes: $pricingSchemes}';
  }
}

@JsonSerializable()
class PricingSchemeUpdateRequest {
  @JsonKey(name: 'billing_cycle_sequence')
  int billingCycleSequence;

  @JsonKey(name: 'pricing_scheme')
  PricingScheme pricingScheme;

  PricingSchemeUpdateRequest(
      {required this.billingCycleSequence, required this.pricingScheme});

  Map<String, dynamic> toJson() => _$PricingSchemeUpdateRequestToJson(this);

  factory PricingSchemeUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$PricingSchemeUpdateRequestFromJson(json);

  @override
  String toString() {
    return 'PricingSchemeUpdateRequest{billingCycleSequence: '
        '$billingCycleSequence, pricingScheme: $pricingScheme}';
  }
}
