import 'package:json_annotation/json_annotation.dart';

part 'access_token.g.dart';

/// Access token.
@JsonSerializable(fieldRename: FieldRename.snake)
class AccessToken {
  final String scope;

  final String accessToken;

  final String tokenType;

  final String appId;

  final int expiresIn;

  final String nonce;

  DateTime? expiryDateTime;

  bool get hasExpired =>
      expiryDateTime == null ? false : DateTime.now().isAfter(expiryDateTime!);

  AccessToken({
    required this.scope,
    required this.accessToken,
    required this.tokenType,
    required this.appId,
    required this.expiresIn,
    required this.nonce,
  });

  Map<String, dynamic> toJson() => _$AccessTokenToJson(this);

  factory AccessToken.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenFromJson(json);

  String authorizationString() {
    return '$tokenType $accessToken';
  }

  @override
  String toString() {
    return 'AccessToken{scope: $scope, accessToken: $accessToken, tokenType: '
        '$tokenType, appId: $appId, expiresIn: $expiresIn, nonce: $nonce, '
        'expiryDateTime: $expiryDateTime}';
  }
}
