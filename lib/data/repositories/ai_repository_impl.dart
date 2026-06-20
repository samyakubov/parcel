import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/ai_response.dart';
import '../../domain/entities/property.dart';
import '../../domain/repositories/ai_repository.dart';
import '../datasources/ai_api.dart';

final aiRepositoryProvider = Provider<AiRepository>(
  (ref) => AiRepositoryImpl(ref.watch(aiApiProvider)),
);

class AiRepositoryImpl implements AiRepository {
  final AiApi _api;
  AiRepositoryImpl(this._api);

  @override
  Future<AiResponse> ask(String question) async {
    final data = await _api.ask(question);
    final rawProperty = data['property_data'];
    Property? property;
    if (rawProperty is Map<String, dynamic>) {
      try {
        property = Property.fromJson(rawProperty);
      } catch (_) {
        property = null;
      }
    }
    return AiResponse(
      response: data['response'] as String,
      propertyData: property,
    );
  }
}
