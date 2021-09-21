import 'package:json_annotation/json_annotation.dart';

part 'taxes.g.dart';

/// Taxes.
@JsonSerializable()
class Taxes {
  /// The tax percentage on the billing amount.
  String? percentage;

  /// Indicates whether the tax was already included in the billing amount.
  bool? inclusive;

  Taxes({this.percentage, this.inclusive});

  Map<String, dynamic> toJson() => _$TaxesToJson(this);

  factory Taxes.fromJson(Map<String, dynamic> json) => _$TaxesFromJson(json);

  @override
  String toString() {
    return 'Taxes{percentage: $percentage, inclusive: $inclusive}';
  }
}
