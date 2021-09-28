import 'package:json_annotation/json_annotation.dart';

part 'refresh_token.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RefreshToken {
  final String refreshToken;

  const RefreshToken({required this.refreshToken});

  Map<String, dynamic> toJson() => _$RefreshTokenToJson(this);

  factory RefreshToken.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenFromJson(json);

  @override
  String toString() {
    return 'RefreshToken{refreshToken: $refreshToken}';
  }
}
