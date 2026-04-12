import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/property.dart';
import '../../domain/repositories/property_repository.dart';
import '../datasources/property_api.dart';

final propertyRepositoryProvider = Provider<PropertyRepository>((ref) {
  return PropertyRepositoryImpl(ref.watch(propertyApiProvider));
});

class PropertyRepositoryImpl implements PropertyRepository {
  final PropertyApi _api;
  PropertyRepositoryImpl(this._api);

  @override
  Future<Property> searchByAddress(String address) async {
    final data = await _api.searchByAddress(address);
    return Property.fromJson(data);
  }

  @override
  Future<Property> searchByBbl(String bbl) async {
    final data = await _api.searchByBbl(bbl);
    return Property.fromJson(data);
  }

  @override
  Future<Property> searchByFuzzyCoords(double lat, double lng) async {
    final data = await _api.searchByFuzzyCoords(lat, lng);
    return Property.fromJson(data);
  }
}
