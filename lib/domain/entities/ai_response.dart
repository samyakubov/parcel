import 'property.dart';

class AiResponse {
  final String response;
  final Property? propertyData;
  final List<Map<String, dynamic>> updatedHistory;

  const AiResponse({
    required this.response,
    this.propertyData,
    this.updatedHistory = const [],
  });
}
