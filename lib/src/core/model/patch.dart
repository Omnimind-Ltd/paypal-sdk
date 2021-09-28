import 'package:json_annotation/json_annotation.dart';

part 'patch.g.dart';

/// A patch operation
enum PatchOperation {
  /// Depending on the target location reference, completes one of these
  /// functions:
  /// <ul>
  /// <li>
  /// The target location is an array index. Inserts a new value into the array
  /// at the specified index.
  /// </li>
  /// <li>
  /// The target location is an object parameter that does not already exist.
  /// Adds a new parameter to the object.
  /// </li>
  /// <li>
  /// The target location is an object parameter that does exist Replaces that
  /// parameter's value.
  /// </li>
  /// </ul>
  /// The value parameter defines the value to add. For more information, see
  /// <a href="https://tools.ietf.org/html/rfc6902#section-4.1">4.1. add.</a>
  add,

  /// Removes the value at the target location. For the operation to
  /// succeed, the target location must exist. For more information, see
  /// <a href="https://tools.ietf.org/html/rfc6902#section-4.2">4.2. remove.</a>
  remove,

  /// Replaces the value at the target location with a new value. The
  /// operation object must contain a value parameter that defines the replacement
  /// value. For the operation to succeed, the target location must exist.
  /// For more information, see <a href="https://tools.ietf.org/html/rfc6902#section-4.3">
  /// 4.3. replace.</a>
  replace,

  /// Removes the value at a specified location and adds it to the target
  /// location. The operation object must contain a from parameter, which is a
  /// string that contains a JSON pointer value that references the location in
  /// the target document from which to move the value. For the operation to succeed,
  /// the from location must exist. For more information, see
  /// <a href="https://tools.ietf.org/html/rfc6902#section-4.4">4.4. move.</a>
  move,

  /// Copies the value at a specified location to the target location. The
  /// operation object must contain a from parameter, which is a string that
  /// contains a JSON pointer value that references the location in the target
  /// document from which to copy the value. For the operation to succeed, the
  /// from location must exist. For more information, see
  /// <a href="https://tools.ietf.org/html/rfc6902#section-4.5">4.5. copy.</a>
  copy,

  /// Tests that a value at the target location is equal to a specified value.
  /// The operation object must contain a value parameter that defines the value
  /// to compare to the target location's value. For the operation to succeed,
  /// the target location must be equal to the value value. For test, equal
  /// indicates that the value at the target location and the value that value
  /// defines are of the same JSON type. The data type of the value determines
  /// how equality is defined:
  /// <ul>
  /// <li>
  /// strings: Contain the same number of Unicode characters and their code
  /// points are byte-by-byte equal.
  /// </li>
  /// <li>
  /// numbers: Are numerically equal.
  /// </li>
  /// <li>
  /// arrays: Contain the same number of values, and each value is equal to the
  /// value at the corresponding position in the other array, by using these
  /// type-specific rules.
  /// </li>
  /// <li>
  /// objects: Contain the same number of parameters, and each parameter is
  /// equal to a parameter in the other object, by comparing their keys (as
  /// strings) and their values (by using these type-specific rules).
  /// </li>
  /// <li>
  /// literals (false, true, and null): Are the same. The comparison is a
  /// logical comparison. For example, whitespace between the parameter values
  /// of an array is not significant. Also, ordering of the serialization of
  /// object parameters is not significant.
  /// </li>
  /// </ul>
  /// </li>
  /// </ul>
  test,
}

/// Update resource request
@JsonSerializable()
class Patch {
  /// The operation.
  PatchOperation op;

  /// The <a href="https://datatracker.ietf.org/doc/html/rfc6901">JSON Pointer</a>
  /// to the target document location at which to complete the operation.
  String path;

  /// The value to apply. The remove operation does not require a value.
  dynamic value;

  /// The a href="https://datatracker.ietf.org/doc/html/rfc6901">JSON Pointer</a>
  /// to the target document location from which to move the value. Required for
  /// the move operation.
  String? from;

  Patch({required this.op, required this.path, this.value, this.from});

  Map<String, dynamic> toJson() => _$PatchToJson(this);

  factory Patch.fromJson(Map<String, dynamic> json) => _$PatchFromJson(json);

  @override
  String toString() {
    return 'Patch{op: $op, path: $path, value: $value, from: $from}';
  }
}
