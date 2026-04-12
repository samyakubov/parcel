import 'package:freezed_annotation/freezed_annotation.dart';

part 'census_data.freezed.dart';
part 'census_data.g.dart';

@freezed
abstract class CensusData with _$CensusData {
  const factory CensusData({
    required Map<String, dynamic> data, // Fallback schema since fields aren't specified
  }) = _CensusData;

  factory CensusData.fromJson(Map<String, Object?> json) => _$CensusDataFromJson(json);
}
