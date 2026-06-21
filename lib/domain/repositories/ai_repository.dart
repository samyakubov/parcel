import '../entities/ai_response.dart';

abstract class AiRepository {
  Future<AiResponse> ask(String question, List<Map<String, dynamic>> conversationHistory);
}
