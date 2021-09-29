import '../model/api_error.dart';

class ApiException implements Exception {
  final int statusCode;

  final String? error;

  final String? errorDescription;

  final ApiError? apiError;

  ApiException(this.statusCode,
      {this.error, this.errorDescription, this.apiError});

  ApiException.fromApiError(this.statusCode, this.apiError)
      : error = apiError!.name,
        errorDescription = apiError.message;

  @override
  String toString() {
    return 'ApiException{statusCode: $statusCode, error: $error, '
        'errorDescription: $errorDescription, apiError: $apiError}';
  }
}
