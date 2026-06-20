import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/api_client.dart';

final aiApiProvider = Provider<AiApi>((ref) => AiApi(ref.watch(dioProvider)));

class AiApi {
  final Dio _dio;
  AiApi(this._dio);

  Future<Map<String, dynamic>> ask(String question) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/ai/ask',
      data: {'question': question},
    );
    return response.data!;
  }
}
