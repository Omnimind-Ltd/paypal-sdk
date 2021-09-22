import 'package:json_annotation/json_annotation.dart';
import 'package:paypal_sdk/core.dart';
import 'package:paypal_sdk/src/subscriptions/model/pricing_tier.dart';

part 'pricing_scheme.g.dart';

/// Pricing scheme.
@JsonSerializable()
class PricingScheme {
  static const String pricingModelVolume = 'VOLUME';
  static const String pricingModelTiered = 'TIERED';

  /// The version of the pricing scheme.
  /// Maximum value: 999.
  int? version;

  /// The fixed amount to charge for the subscription. The changes to fixed
  /// amount are applicable to both existing and future subscriptions. For
  /// existing subscriptions, payments within 10 days of price change are not
  /// affected.
  @JsonKey(name: 'fixed_price')
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
  @JsonKey(name: 'pricing_model')
  String? pricingModel;

  /// An array of pricing tiers which are used for billing volume/tiered plans.
  /// pricing_model field has to be specified.
  List<PricingTier>? tiers;

  /// The date and time when the plan was created, in
  /// <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  @JsonKey(name: 'create_time')
  String? createTime;

  /// The date and time when the plan was last updated, in
  /// <a href="https://datatracker.ietf.org/doc/html/rfc3339#section-5.6">
  /// Internet date and time format</a>
  @JsonKey(name: 'update_time')
  String? updateTime;

  PricingScheme(
      {this.version,
      this.fixedPrice,
      this.pricingModel,
      this.tiers,
      this.createTime,
      this.updateTime});

  Map<String, dynamic> toJson() => _$PricingSchemeToJson(this);

  factory PricingScheme.fromJson(Map<String, dynamic> json) =>
      _$PricingSchemeFromJson(json);

  @override
  String toString() {
    return 'PricingScheme{version: $version, fixedPrice: $fixedPrice, '
        'pricingModel: $pricingModel, tiers: $tiers, createTime: $createTime, '
        'updateTime: $updateTime}';
  }
}
