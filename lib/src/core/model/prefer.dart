/// The preferred server response upon successful completion of the request
enum Prefer {
  /// The server returns a minimal response to optimize communication between
  /// the API caller and the server.
  minimal,

  /// The server returns a complete resource representation, including the
  /// current state of the resource.
  representation,
}

const preferTypeEnumMap = {
  Prefer.minimal: 'minimal',
  Prefer.representation: 'representation',
};
