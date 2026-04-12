import '../entities/census_data.dart';

abstract class CensusRepository {
  Future<CensusData> getCensusDataByAddress(String address);
  Future<CensusData> getCensusDataByBbl(String bbl);
}
