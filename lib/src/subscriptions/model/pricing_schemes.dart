import 'package:json_annotation/json_annotation.dart';
import 'package:paypal_sdk/src/subscriptions/model/pricing_scheme.dart';

part 'pricing_schemes.g.dart';

@JsonSerializable()
class PricingSchemes {
  @JsonKey(name: 'pricing_schemes')
  List<PricingScheme> pricingSchemes;

  PricingSchemes(this.pricingSchemes);

  Map<String, dynamic> toJson() => _$PricingSchemesToJson(this);

  factory PricingSchemes.fromJson(Map<String, dynamic> json) =>
      _$PricingSchemesFromJson(json);

  @override
  String toString() {
    return 'PricingSchemes{pricingSchemes: $pricingSchemes}';
  }
}
