import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/api_client.dart';

final propertyApiProvider = Provider<PropertyApi>((ref) {
  return PropertyApi(ref.watch(dioProvider));
});

class PropertyApi {
  final Dio _dio;
  PropertyApi(this._dio);

  Future<Map<String, dynamic>> searchByAddress(String address) async {
    final encoded = Uri.encodeComponent(address);
    final response = await _dio.get('/property/search_by_property_address/address=$encoded');
    return response.data;
  }

  Future<Map<String, dynamic>> searchByBbl(String bbl) async {
    final encoded = Uri.encodeComponent(bbl);
    final response = await _dio.get('/property/search_by_property_bbl/bbl=$encoded');
    return response.data;
  }

  Future<Map<String, dynamic>> searchByFuzzyCoords(double lat, double lng) async {
    final response = await _dio.get('/property/search_by_fuzzy_coords/lat=$lat/long=$lng');
    return response.data as Map<String, dynamic>;
  }
}
