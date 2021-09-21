import 'package:json_annotation/json_annotation.dart';

part 'link_description.g.dart';

/// <a href="https://developer.paypal.com/docs/api/reference/api-responses/#hateoas-links">
/// HATEOAS Link</a>.
@JsonSerializable()
class LinkDescription {
  /// The complete target URL. To make the related call, combine the method with
  /// this <a href="https://datatracker.ietf.org/doc/html/rfc6570">
  /// URI Template-formatted</a> link. For pre-processing, include the $, (, and
  /// ) characters. The href is the key HATEOAS component that links a completed
  /// call with a subsequent call.
  final String href;

  /// The <a href="https://datatracker.ietf.org/doc/html/rfc5988#section-4">link
  /// relation type</a>, which serves as an ID for a link that unambiguously
  /// describes the semantics of the link. See
  /// <a href="https://www.iana.org/assignments/link-relations/link-relations.xhtml">
  /// Link Relations.</a>
  final String rel;

  /// The HTTP method required to make the related call.
  /// Possible values: GET, POST, PUT, DELETE, HEAD, CONNECT, OPTIONS, PATCH
  final String method;

  final String? encType;

  const LinkDescription({
    required this.href,
    required this.rel,
    required this.method,
    this.encType,
  });

  Map<String, dynamic> toJson() => _$LinkDescriptionToJson(this);

  factory LinkDescription.fromJson(Map<String, dynamic> json) =>
      _$LinkDescriptionFromJson(json);

  @override
  String toString() {
    return 'LinkDescription{href: $href, rel: $rel, method: $method, encType: '
        '$encType}';
  }
}
