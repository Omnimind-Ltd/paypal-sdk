import 'package:json_annotation/json_annotation.dart';

part 'api_error_details.g.dart';

/// Error details.
@JsonSerializable()
class ApiErrorDetails {
  /// The field that caused the error. If this field is in the body, set this
  /// value to the field's JSON pointer value. Required for client-side errors.
  String? field;

  /// The value of the field that caused the error.
  String? value;

  /// The location of the field that caused the error. Value is body, path, or query.
  String? location;

  /// The unique, fine-grained application-level error code.
  String issue;

  /// The human-readable description for an issue. The description can change
  /// over the lifetime of an API, so clients must not depend on this value.
  String? description;

  ApiErrorDetails({
    this.field,
    this.value,
    this.location,
    required this.issue,
    this.description,
  });

  Map<String, dynamic> toJson() => _$ApiErrorDetailsToJson(this);

  factory ApiErrorDetails.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorDetailsFromJson(json);

  @override
  String toString() {
    return 'ApiErrorDetails{field: $field, value: $value, location: $location, '
        'issue: $issue, description: $description}';
  }
}
