import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants.dart';
import '../../domain/entities/address_suggestion.dart';

final mapboxSearchApiProvider = Provider<MapboxSearchApi>((ref) {
  return MapboxSearchApi();
});

class AutocompleteAuthException implements Exception {
  const AutocompleteAuthException();
  @override
  String toString() => 'AutocompleteAuthException: authentication failed (401/403)';
}

class AutocompleteNetworkException implements Exception {
  final String message;
  const AutocompleteNetworkException([this.message = 'Network error']);
  @override
  String toString() => 'AutocompleteNetworkException: $message';
}

class MapboxSearchApi {
  late final Dio _dio;

  MapboxSearchApi() {
    _dio = Dio(
      BaseOptions(
        queryParameters: {
          'access_token': AppConstants.mapboxApiKey,
        },
      ),
    );
  }

  Future<List<AddressSuggestion>> suggest(String query) async {
    try {
      final encoded = Uri.encodeQueryComponent(query);
      final url = 'https://api.mapbox.com/geocoding/v5/mapbox.places/$encoded.json';
      final response = await _dio.get<Map<String, dynamic>>(
        url,
        queryParameters: {
          'autocomplete': true,
          'limit': AppConstants.autocompleteMaxResults,
          'bbox': '-74.2591,40.4774,-73.7004,40.9176',
          'proximity': '-74.0060,40.7128',
        },
      );
      final features = (response.data?['features'] as List<dynamic>?) ?? [];
      final suggestions = features
          .take(AppConstants.autocompleteMaxResults)
          .whereType<Map<String, dynamic>>()
          .map(_featureToSuggestion)
          .toList();

      return suggestions;
    } on DioException catch (e) {
      throw _mapDioException(e);
    }
  }

  AddressSuggestion _featureToSuggestion(Map<String, dynamic> feature) {
    final mapboxId = (feature['id'] as String?) ?? '';

    final fullName = (feature['place_name'] as String?) ?? '';

    final contextList = feature['context'] as List<dynamic>?;
    String? context;
    if (contextList != null && contextList.isNotEmpty) {
      context = (contextList.first as Map<String, dynamic>?)?['text'] as String?;
    }

    final center = feature['center'] as List<dynamic>?;
    final longitude = center != null && center.isNotEmpty
        ? (center[0] as num).toDouble()
        : null;
    final latitude = center != null && center.length > 1
        ? (center[1] as num).toDouble()
        : null;

    return AddressSuggestion(
      mapboxId: mapboxId,
      fullName: fullName,
      context: context,
      latitude: latitude,
      longitude: longitude,
    );
  }

  Exception _mapDioException(DioException e) {
    final statusCode = e.response?.statusCode;
    if (statusCode == 401 || statusCode == 403) {
      return const AutocompleteAuthException();
    }
    final msg = e.response?.data?.toString() ?? e.message ?? 'Unknown network error';
    return AutocompleteNetworkException(msg);
  }
}
