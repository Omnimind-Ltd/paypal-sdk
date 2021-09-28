import 'package:json_annotation/json_annotation.dart';

part 'name.g.dart';

/// A name.
@JsonSerializable(fieldRename: FieldRename.snake)
class Name {
  /// The prefix, or title, to the party's name.
  final String? prefix;

  /// When the party is a person, the party's given, or first, name.
  final String? givenName;

  /// When the party is a person, the party's surname or family name. Also known
  /// as the last name. Required when the party is a person. Use also to store
  /// multiple surnames including the matronymic, or mother's, surname.
  final String? surname;

  /// When the party is a person, the party's middle name. Use also to store
  /// multiple middle names including the patronymic, or father's, middle name.
  final String? middleName;

  /// The suffix for the party's name.
  final String? suffix;

  /// When the party is a person, the party's full name.
  final String? fullName;

  const Name(
      {this.prefix,
      this.givenName,
      this.surname,
      this.middleName,
      this.suffix,
      this.fullName});

  Map<String, dynamic> toJson() => _$NameToJson(this);

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);

  @override
  String toString() {
    return 'Name{prefix: $prefix, givenName: $givenName, surname: $surname, '
        'middleName: $middleName, suffix: $suffix, fullName: $fullName}';
  }
}
