import '../entities/property.dart';

abstract class PropertyRepository {
  Future<Property> searchByAddress(String address);
  Future<Property> searchByBbl(String bbl);
  Future<Property> searchByFuzzyCoords(double lat, double lng);
}
