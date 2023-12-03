import 'package:flutter_paypal_sdk/core.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pricing.g.dart';

/// The pricing model.
enum PricingModel {
  /// A volume pricing model.
  @JsonValue('VOLUME')
  volume,

  /// A tiered pricing model.
  @JsonValue('TIERED')
  tiered,
}

/// Pricing scheme.
@JsonSerializable(fieldRename: FieldRename.snake)
class PricingScheme {
  /// The version of the pricing scheme.
  /// Maximum value: 999.
  int? version;

  /// The fixed amount to charge for the subscription. The changes to fixed
  /// amount are applicable to both existing and future subscriptions. For
  /// existing subscriptions, payments within 10 days of price change are not
  /// affected.
  Money? fixedPrice;

  /// The pricing model for tiered plan. The 'tiers' parameter is required.
  /// The possible values are:
  /// <ul>
  /// <li>
  /// VOLUME. A volume pricing model.
  /// </li>
  /// <li>
  /// TIERED. A tiered pricing model.
  /// </li>
  /// </ul>
  PricingModel? pricingModel;

  /// An array of pricing tiers which are used for billing volume/tiered plans.
  /// pricing_model field has to be specified.
  List<PricingTier>? tiers;

  /// The date and time when the plan was created, in
  /// <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  String? createTime;

  /// The date and time when the plan was last updated, in
  /// <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  String? updateTime;

  PricingScheme(
      {this.version,
      this.fixedPrice,
      this.pricingModel,
      this.tiers,
      this.createTime,
      this.updateTime});

  Map<String, dynamic> toJson() => _$PricingSchemeToJson(this);

  factory PricingScheme.fromJson(Map<String, dynamic> json) => _$PricingSchemeFromJson(json);

  @override
  String toString() {
    return 'PricingScheme{version: $version, fixedPrice: $fixedPrice, '
        'pricingModel: $pricingModel, tiers: $tiers, createTime: $createTime, '
        'updateTime: $updateTime}';
  }
}

/// Updates pricing for a plan.
@JsonSerializable(fieldRename: FieldRename.snake)
class PricingSchemesUpdateRequest {
  /// An array of pricing schemes.
  final List<PricingSchemeUpdateRequest> pricingSchemes;

  const PricingSchemesUpdateRequest(this.pricingSchemes);

  Map<String, dynamic> toJson() => _$PricingSchemesUpdateRequestToJson(this);

  factory PricingSchemesUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$PricingSchemesUpdateRequestFromJson(json);

  @override
  String toString() {
    return 'PricingSchemes{pricingSchemes: $pricingSchemes}';
  }
}

/// A pricing scheme update request.
@JsonSerializable(fieldRename: FieldRename.snake)
class PricingSchemeUpdateRequest {
  /// The billing cycle sequence.
  final int billingCycleSequence;

  /// The pricing scheme details.
  final PricingScheme pricingScheme;

  const PricingSchemeUpdateRequest(
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

/// Pricing tier
@JsonSerializable(fieldRename: FieldRename.snake)
class PricingTier {
  /// The starting quantity for the tier.
  /// Minimum length: 1.
  /// Maximum length: 32.
  String? startingQuantity;

  /// The ending quantity for the tier. Optional for the last tier.
  /// Minimum length: 1.
  /// Maximum length: 32.
  String? endingQuantity;

  /// The pricing amount for the tier.
  Money? amount;

  PricingTier({this.startingQuantity, this.endingQuantity, this.amount});

  Map<String, dynamic> toJson() => _$PricingTierToJson(this);

  factory PricingTier.fromJson(Map<String, dynamic> json) => _$PricingTierFromJson(json);

  @override
  String toString() {
    return 'PricingTier{startingQuantity: $startingQuantity, '
        'endingQuantity: $endingQuantity, amount: $amount}';
  }
}
