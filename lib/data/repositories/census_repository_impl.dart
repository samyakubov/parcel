import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/census_data.dart';
import '../../domain/repositories/census_repository.dart';
import '../datasources/census_api.dart';

final censusRepositoryProvider = Provider<CensusRepository>((ref) {
  return CensusRepositoryImpl(ref.watch(censusApiProvider));
});

class CensusRepositoryImpl implements CensusRepository {
  final CensusApi _api;
  CensusRepositoryImpl(this._api);

  @override
  Future<CensusData> getCensusDataByAddress(String address) async {
    final data = await _api.getCensusDataByAddress(address);
    return CensusData.fromJson(data);
  }

  @override
  Future<CensusData> getCensusDataByBbl(String bbl) async {
    final data = await _api.getCensusDataByBbl(bbl);
    return CensusData.fromJson(data);
  }
}
