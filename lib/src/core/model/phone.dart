import 'package:json_annotation/json_annotation.dart';

part 'phone.g.dart';

/// The phone type.
enum PhoneType {
  /// A fax machine.
  @JsonValue('FAX')
  fax,

  ///  A home phone.
  @JsonValue('HOME')
  home,

  /// A mobile phone.
  @JsonValue('MOBILE')
  mobile,

  /// A mobile phone.
  @JsonValue('OTHER')
  other,

  /// A mobile phone.
  @JsonValue('PAGER')
  pager,

  /// A mobile phone.
  @JsonValue('WORK')
  work,
}

/// A phone number.
@JsonSerializable(fieldRename: FieldRename.snake)
class Phone {
  /// The country calling code (CC), in its canonical international
  /// <a href="https://www.itu.int/rec/T-REC-E.164/en">E.164 numbering plan format</a>.
  /// The combined length of the CC and the national number must not be greater
  /// than 15 digits. The national number consists of a national destination code
  /// (NDC) and subscriber number (SN).
  final String countryCode;

  /// The national number, in its canonical international
  /// <a href="https://www.itu.int/rec/T-REC-E.164/en">E.164 numbering plan format</a>.
  /// The combined length of the country calling code (CC) and the national number
  /// must not be greater than 15 digits. The national number consists of a national
  /// destination code (NDC) and subscriber number (SN).
  final String nationalNumber;

  /// The extension number.
  final String? extensionNumber;

  const Phone(
      {required this.countryCode,
      required this.nationalNumber,
      this.extensionNumber});

  Map<String, dynamic> toJson() => _$PhoneToJson(this);

  factory Phone.fromJson(Map<String, dynamic> json) => _$PhoneFromJson(json);

  @override
  String toString() {
    return 'Phone{countryCode: $countryCode, nationalNumber: $nationalNumber, '
        'extensionNumber: $extensionNumber}';
  }
}

/// A phone number with type information
@JsonSerializable(fieldRename: FieldRename.snake)
class PhoneWithType {
  /// The phone type.
  final PhoneType phoneType;

  /// The phone number, in its canonical international
  /// <a href="https://www.itu.int/rec/T-REC-E.164/en">E.164 numbering plan format</a>
  final Phone phoneNumber;

  const PhoneWithType(this.phoneType, this.phoneNumber);

  Map<String, dynamic> toJson() => _$PhoneWithTypeToJson(this);

  factory PhoneWithType.fromJson(Map<String, dynamic> json) =>
      _$PhoneWithTypeFromJson(json);

  @override
  String toString() {
    return 'PhoneWithType{phoneType: $phoneType, phoneNumber: $phoneNumber}';
  }
}
