import 'package:json_annotation/json_annotation.dart';

part 'reason.g.dart';

/// A reason request body
@JsonSerializable()
class Reason {
  /// The reason for the cancellation of a subscription.
  final String reason;

  const Reason(this.reason);

  Map<String, dynamic> toJson() => _$ReasonToJson(this);

  factory Reason.fromJson(Map<String, dynamic> json) => _$ReasonFromJson(json);

  @override
  String toString() {
    return 'Reason{reason: $reason}';
  }
}
