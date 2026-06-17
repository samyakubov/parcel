import 'package:freezed_annotation/freezed_annotation.dart';

part 'property.freezed.dart';
part 'property.g.dart';

@freezed
abstract class Property with _$Property {
  const factory Property({
    PropertyInfo? propertyInfo,
    LastSold? lastSold,
    Mortgage? mortgage,
    Owners? owners,
    @Default([]) List<Map<String, dynamic>> records,
    @Default([]) List<Map<String, dynamic>> jobFilings,
    @Default([]) List<Map<String, dynamic>> violations,
    @Default([]) List<Map<String, dynamic>> complaints,
    Zoning? zoning,
    Coordinates? coordinates,
  }) = _Property;

  factory Property.fromJson(Map<String, Object?> json) => _$PropertyFromJson(json);
}

@freezed
abstract class PropertyInfo with _$PropertyInfo {
  const factory PropertyInfo({
    String? propertyType,
    String? bbl,
    double? floors,
    int? resUnits,
    int? totalUnits,
    double? lotFront,
    double? lotDepth,
    double? bldgFront,
    double? bldgDepth,
  }) = _PropertyInfo;

  factory PropertyInfo.fromJson(Map<String, Object?> json) => _$PropertyInfoFromJson(json);
}

@freezed
abstract class LastSold with _$LastSold {
  const factory LastSold({
    double? lastSoldPrice,
    String? lastSoldDate,
    int? yearBuilt,
    double? landSqft,
    double? grossSqft,
  }) = _LastSold;

  factory LastSold.fromJson(Map<String, Object?> json) => _$LastSoldFromJson(json);
}

@freezed
abstract class Mortgage with _$Mortgage {
  const factory Mortgage({
    String? lender,
    String? borrower,
    double? amount,
  }) = _Mortgage;

  factory Mortgage.fromJson(Map<String, Object?> json) => _$MortgageFromJson(json);
}

@freezed

abstract class Owners with _$Owners {
  const factory Owners({
    @Default([]) List<String> currentOwners,
    @Default([]) List<String> previousOwners,
  }) = _Owners;

  factory Owners.fromJson(Map<String, Object?> json) => _$OwnersFromJson(json);
}

@freezed
abstract class Zoning with _$Zoning {
  const factory Zoning({
    @Default([]) List<String> zoningDistricts,
    @Default([]) List<String> commercialOverlays,
    @Default([]) List<String> specialDistricts,
    String? limitedHeightDistrict,
    String? lastUpdated,
  }) = _Zoning;

  factory Zoning.fromJson(Map<String, Object?> json) => _$ZoningFromJson(json);
}

@freezed
abstract class Coordinates with _$Coordinates {
  const factory Coordinates({
    double? latitude,
    double? longitude,
  }) = _Coordinates;

  factory Coordinates.fromJson(Map<String, Object?> json) => _$CoordinatesFromJson(json);
}
