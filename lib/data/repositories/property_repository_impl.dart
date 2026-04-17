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
    if (property.records.isEmpty) return property;
    final r = property.records.first;
    final info = PropertyInfo(
      propertyType: r['prop_type'] as String?,
      bbl: r['bbl'] as String?,
      floors: (r['num_floors'] as num?)?.toDouble(),
      resUnits: r['units_res'] as int?,
      totalUnits: r['units_total'] as int?,
      lotFront: (r['lot_front'] as num?)?.toDouble(),
      lotDepth: (r['lot_depth'] as num?)?.toDouble(),
      bldgFront: (r['bldg_front'] as num?)?.toDouble(),
      bldgDepth: (r['bldg_depth'] as num?)?.toDouble(),
    );
    return property.copyWith(propertyInfo: info);
  }
}
