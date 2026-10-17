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
    return _build(await _api.searchByAddress(address));
  }

  @override
  Future<Property> searchByBbl(String bbl) async {
    return _build(await _api.searchByBbl(bbl));
  }

  @override
  Future<Property> searchByFuzzyCoords(double lat, double lng) async {
    return _build(await _api.searchByFuzzyCoords(lat, lng));
  }

  Property _build(Map<String, dynamic> data) {
    final property = Property.fromJson(data);
    final bc = property.buildingCharacteristics;
    if (bc == null && property.records.isEmpty) return property;

    final r = property.records.isNotEmpty ? property.records.first : null;
    final info = PropertyInfo(
      propertyType: r?['prop_type'] as String?,
      bbl: r?['bbl'] as String?,
      floors: bc?.numFloors,
      resUnits: bc?.unitsRes,
      totalUnits: bc?.unitsTotal,
      lotFront: bc?.lotFront,
      lotDepth: bc?.lotDepth,
      bldgFront: bc?.bldgFront,
      bldgDepth: bc?.bldgDepth,
    );
    return property.copyWith(propertyInfo: info);
  }
}
