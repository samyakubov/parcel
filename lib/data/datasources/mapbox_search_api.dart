import 'package:dio/dio.dart';
import '../../core/constants.dart';
import '../../domain/entities/address_suggestion.dart';

// Exception types

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

// Datasource

/// Uses the Mapbox Geocoding v5 API:
/// GET https://api.mapbox.com/geocoding/v5/mapbox.places/{query}.json
///
/// Coordinates are included in the suggest response via `center`, so no
/// separate retrieve call is needed — [retrieve] returns the suggestion as-is.
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

  /// Fetches address suggestions for [query].
  /// Returns at most [AppConstants.autocompleteMaxResults] results.
  /// [sessionToken] is accepted for API compatibility but not forwarded
  /// (Geocoding v5 does not use session tokens).
  Future<List<AddressSuggestion>> suggest(
    String query,
    String sessionToken,
  ) async {
    try {
      // Strip to street address only (e.g. "79-33 213th Street, City, State" → "79-33 213th Street")
      final streetOnly = query.contains(',') ? query.split(',')[0].trim() : query;
      // Encode the query for use in the path segment.
      final encoded = Uri.encodeQueryComponent(streetOnly);
      final url = 'https://api.mapbox.com/geocoding/v5/mapbox.places/$encoded.json';
      final response = await _dio.get<Map<String, dynamic>>(
        url,
        queryParameters: {
          'autocomplete': true,
          'limit': AppConstants.autocompleteMaxResults,
        },
      );

      final features = (response.data?['features'] as List<dynamic>?) ?? [];
      final suggestions = features
          .take(AppConstants.autocompleteMaxResults)
          .map((f) => _featureToSuggestion(f as Map<String, dynamic>))
          .toList();

      return suggestions;
    } on DioException catch (e) {
      throw _mapDioException(e);
    }
  }

  /// Returns the suggestion as-is — coordinates are already present from
  /// the [suggest] call (Geocoding v5 includes `center` in every feature).
  Future<AddressSuggestion> retrieve(
    String mapboxId,
    String sessionToken,
  ) async {
    // The Geocoding v5 API returns coordinates in the suggest response via
    // `center`, so no additional network call is required.
    throw UnimplementedError(
      'retrieve() should not be called directly; '
      'coordinates are already present on AddressSuggestion from suggest().',
    );
  }

  // --- helpers ---

  AddressSuggestion _featureToSuggestion(Map<String, dynamic> feature) {
    // id: "place.123456" — use as mapboxId
    final mapboxId = (feature['id'] as String?) ?? '';

    // place_name: full display string e.g. "Brooklyn, New York, United States"
    final fullName = (feature['place_name'] as String?) ?? '';

    // context: array of parent features [{id, text}, ...]
    // Use the first context item's text as the secondary line.
    final contextList = feature['context'] as List<dynamic>?;
    String? context;
    if (contextList != null && contextList.isNotEmpty) {
      context = (contextList.first as Map<String, dynamic>?)?['text'] as String?;
    }

    // center: [longitude, latitude]
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
