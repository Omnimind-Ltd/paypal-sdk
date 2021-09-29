import 'package:json_annotation/json_annotation.dart';

import 'api_error_details.dart';
import 'link_description.dart';

part 'api_error.g.dart';

/// Api error.
@JsonSerializable(fieldRename: FieldRename.snake)
class ApiError {
  /// The human-readable, unique name of the error.
  final String? name;

  /// The message that describes the error.
  final String? message;

  /// The PayPal internal ID. Used for correlation purposes.
  final String? debugId;

  /// The information link, or URI, that shows detailed information about this
  /// error for the developer.
  final String? informationLink;

  /// An array of additional details about the error.
  final List<ApiErrorDetails>? details;

  /// An array of request-related <a href="https://developer.paypal.com/docs/api/reference/api-responses/#hateoas-links">
  /// HATEOAS links</a>.
  List<LinkDescription>? links;

  ApiError(
      {this.name,
      this.message,
      this.debugId,
      this.informationLink,
      this.details,
      this.links});

  Map<String, dynamic> toJson() => _$ApiErrorToJson(this);

  factory ApiError.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorFromJson(json);

  @override
  String toString() {
    return 'ApiError{name: $name, message: $message, debugId: $debugId, '
        'informationLink: $informationLink, details: $details, links: $links}';
  }
}
