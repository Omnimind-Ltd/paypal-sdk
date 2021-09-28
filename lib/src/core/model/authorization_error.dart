import 'package:json_annotation/json_annotation.dart';

part 'authorization_error.g.dart';

/// Authorization error.
@JsonSerializable(fieldRename: FieldRename.snake)
class AuthorizationError {
  /// The human-readable, unique name of the error.
  final String error;

  /// A description of the error.
  final String errorDescription;

  const AuthorizationError(this.error, this.errorDescription);

  Map<String, dynamic> toJson() => _$AuthorizationErrorToJson(this);

  factory AuthorizationError.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationErrorFromJson(json);

  @override
  String toString() {
    return 'Authorization{error: $error, errorDescription: $errorDescription}';
  }
}
