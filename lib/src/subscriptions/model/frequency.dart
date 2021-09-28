import 'package:json_annotation/json_annotation.dart';

part 'frequency.g.dart';

/// The interval at which the subscription is charged or billed.
enum IntervalUnit {
  /// A daily billing cycle.
  @JsonValue('DAY')
  day,

  /// A weekly billing cycle.
  @JsonValue('WEEK')
  week,

  /// A monthly billing cycle.
  @JsonValue('MONTH')
  month,

  /// A yearly billing cycle.
  @JsonValue('YEAR')
  year,
}

/// Frequency.
@JsonSerializable(fieldRename: FieldRename.snake)
class Frequency {
  /// The interval at which the subscription is charged or billed.
  ///
  /// The possible values are:
  /// <ul>
  /// <li>
  /// DAY. A daily billing cycle.
  /// </li>
  /// <li>
  /// WEEK. A weekly billing cycle.
  /// </li>
  /// <li>
  /// MONTH. A monthly billing cycle.
  /// </li>
  /// <li>
  /// YEAR. A yearly billing cycle.
  /// </li>
  /// </ul>
  IntervalUnit intervalUnit;

  /// The number of intervals after which a subscriber is billed. For example,
  /// if the interval_unit is DAY with an interval_count of 2, the subscription
  /// is billed once every two days. The following table lists the maximum
  /// allowed values for the interval_count for each interval_unit:
  /// <ul>
  /// <li>
  /// DAY. Maximum: 365
  /// </li>
  /// <li>
  /// WEEK. Maximum: 52
  /// </li>
  /// <li>
  /// MONTH. Maximum: 12
  /// </li>
  /// <li>
  /// YEAR. Maximum: 1
  /// </li>
  /// </ul>
  int intervalCount;

  Frequency({required this.intervalUnit, required this.intervalCount});

  Map<String, dynamic> toJson() => _$FrequencyToJson(this);

  factory Frequency.fromJson(Map<String, dynamic> json) =>
      _$FrequencyFromJson(json);

  @override
  String toString() {
    return 'Frequency{intervalUnit: $intervalUnit, intervalCount: $intervalCount}';
  }
}
