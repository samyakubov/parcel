import 'package:dio/dio.dart';

String formatNetworkError(Object? error) {
  if (error is DioException) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return 'Request timed out. Check your connection and try again.';
      case DioExceptionType.connectionError:
        return 'No connection. Check your internet and try again.';
      case DioExceptionType.badResponse:
        final code = error.response?.statusCode;
        if (code == 404) return 'Property not found.';
        if (code != null && code >= 500) return 'Server error. Try again later.';
        return 'Request failed. Try again.';
      case DioExceptionType.cancel:
        return 'Request cancelled.';
      default:
        return 'Something went wrong. Try again.';
    }
  }
  return 'Something went wrong. Try again.';
}
