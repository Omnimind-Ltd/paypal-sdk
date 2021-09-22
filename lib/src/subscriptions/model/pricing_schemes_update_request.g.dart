// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricing_schemes_update_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PricingSchemesUpdateRequest _$PricingSchemesUpdateRequestFromJson(
        Map<String, dynamic> json) =>
    PricingSchemesUpdateRequest(
      (json['pricing_schemes'] as List<dynamic>)
          .map((e) =>
              PricingSchemeUpdateRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PricingSchemesUpdateRequestToJson(
        PricingSchemesUpdateRequest instance) =>
    <String, dynamic>{
      'pricing_schemes': instance.pricingSchemes,
    };

PricingSchemeUpdateRequest _$PricingSchemeUpdateRequestFromJson(
        Map<String, dynamic> json) =>
    PricingSchemeUpdateRequest(
      billingCycleSequence: json['billing_cycle_sequence'] as int,
      pricingScheme: PricingScheme.fromJson(
          json['pricing_scheme'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PricingSchemeUpdateRequestToJson(
        PricingSchemeUpdateRequest instance) =>
    <String, dynamic>{
      'billing_cycle_sequence': instance.billingCycleSequence,
      'pricing_scheme': instance.pricingScheme,
    };
