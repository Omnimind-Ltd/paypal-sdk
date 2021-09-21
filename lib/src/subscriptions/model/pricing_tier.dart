import 'package:json_annotation/json_annotation.dart';
import 'package:paypal_sdk/core.dart';

part 'pricing_tier.g.dart';

/// Pricing tier
@JsonSerializable()
class PricingTier {
  /// The starting quantity for the tier.
  /// Minimum length: 1.
  /// Maximum length: 32.
  @JsonKey(name: 'starting_quantity')
  String? startingQuantity;

  /// The ending quantity for the tier. Optional for the last tier.
  /// Minimum length: 1.
  /// Maximum length: 32.
  @JsonKey(name: 'ending_quantity')
  String? endingQuantity;

  /// The pricing amount for the tier.
  Money? amount;

  PricingTier({this.startingQuantity, this.endingQuantity, this.amount});

  Map<String, dynamic> toJson() => _$PricingTierToJson(this);

  factory PricingTier.fromJson(Map<String, dynamic> json) =>
      _$PricingTierFromJson(json);
}
