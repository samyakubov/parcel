import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/api_client.dart';

final censusApiProvider = Provider<CensusApi>((ref) {
  return CensusApi(ref.watch(dioProvider));
});

class CensusApi {
  final Dio _dio;
  CensusApi(this._dio);

  Future<Map<String, dynamic>> getCensusDataByAddress(String address) async {
    final response = await _dio.get('/census/get_census_data/address=$address');
    return response.data;
  }

  Future<Map<String, dynamic>> getCensusDataByBbl(String bbl) async {
    final response = await _dio.get('/census/get_census_data/bbl=$bbl');
    return response.data;
  }
}
