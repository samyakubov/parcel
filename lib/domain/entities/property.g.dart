// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Property _$PropertyFromJson(Map<String, dynamic> json) => _Property(
  lastSold: json['last_sold'] == null
      ? null
      : LastSold.fromJson(json['last_sold'] as Map<String, dynamic>),
  mortgage: json['mortgage'] == null
      ? null
      : Mortgage.fromJson(json['mortgage'] as Map<String, dynamic>),
  owners: json['owners'] == null
      ? null
      : Owners.fromJson(json['owners'] as Map<String, dynamic>),
  records:
      (json['records'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList() ??
      const [],
  jobFilings:
      (json['job_filings'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList() ??
      const [],
  violations:
      (json['violations'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList() ??
      const [],
  complaints:
      (json['complaints'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList() ??
      const [],
  zoning: json['zoning'] == null
      ? null
      : Zoning.fromJson(json['zoning'] as Map<String, dynamic>),
  coordinates: json['coordinates'] == null
      ? null
      : Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PropertyToJson(_Property instance) => <String, dynamic>{
  'last_sold': instance.lastSold?.toJson(),
  'mortgage': instance.mortgage?.toJson(),
  'owners': instance.owners?.toJson(),
  'records': instance.records,
  'job_filings': instance.jobFilings,
  'violations': instance.violations,
  'complaints': instance.complaints,
  'zoning': instance.zoning?.toJson(),
  'coordinates': instance.coordinates?.toJson(),
};

_LastSold _$LastSoldFromJson(Map<String, dynamic> json) => _LastSold(
  lastSoldPrice: (json['last_sold_price'] as num?)?.toDouble(),
  lastSoldDate: json['last_sold_date'] as String?,
  yearBuilt: (json['year_built'] as num?)?.toInt(),
  landSqft: (json['land_sqft'] as num?)?.toDouble(),
  grossSqft: (json['gross_sqft'] as num?)?.toDouble(),
);

Map<String, dynamic> _$LastSoldToJson(_LastSold instance) => <String, dynamic>{
  'last_sold_price': instance.lastSoldPrice,
  'last_sold_date': instance.lastSoldDate,
  'year_built': instance.yearBuilt,
  'land_sqft': instance.landSqft,
  'gross_sqft': instance.grossSqft,
};

_Mortgage _$MortgageFromJson(Map<String, dynamic> json) => _Mortgage(
  lender: json['lender'] as String?,
  borrower: json['borrower'] as String?,
  amount: (json['amount'] as num?)?.toDouble(),
);

Map<String, dynamic> _$MortgageToJson(_Mortgage instance) => <String, dynamic>{
  'lender': instance.lender,
  'borrower': instance.borrower,
  'amount': instance.amount,
};

_Owners _$OwnersFromJson(Map<String, dynamic> json) => _Owners(
  currentOwners:
      (json['current_owners'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  previousOwners:
      (json['previous_owners'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$OwnersToJson(_Owners instance) => <String, dynamic>{
  'current_owners': instance.currentOwners,
  'previous_owners': instance.previousOwners,
};

_Zoning _$ZoningFromJson(Map<String, dynamic> json) => _Zoning(
  zoningDistricts:
      (json['zoning_districts'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  commercialOverlays:
      (json['commercial_overlays'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  specialDistricts:
      (json['special_districts'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  limitedHeightDistrict: json['limited_height_district'] as String?,
  lastUpdated: json['last_updated'] as String?,
);

Map<String, dynamic> _$ZoningToJson(_Zoning instance) => <String, dynamic>{
  'zoning_districts': instance.zoningDistricts,
  'commercial_overlays': instance.commercialOverlays,
  'special_districts': instance.specialDistricts,
  'limited_height_district': instance.limitedHeightDistrict,
  'last_updated': instance.lastUpdated,
};

_Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) => _Coordinates(
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
);

Map<String, dynamic> _$CoordinatesToJson(_Coordinates instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
