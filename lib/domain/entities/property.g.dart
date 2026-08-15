// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Property _$PropertyFromJson(Map<String, dynamic> json) => _Property(
  propertyInfo: json['property_info'] == null
      ? null
      : PropertyInfo.fromJson(json['property_info'] as Map<String, dynamic>),
  lastSold: json['last_sold'] == null
      ? null
      : LastSold.fromJson(json['last_sold'] as Map<String, dynamic>),
  mortgage: json['mortgage'] == null
      ? null
      : Mortgage.fromJson(json['mortgage'] as Map<String, dynamic>),
  owners: json['owners'] == null
      ? null
      : Owners.fromJson(json['owners'] as Map<String, dynamic>),
  buildingCharacteristics: json['building_characteristics'] == null
      ? null
      : BuildingCharacteristics.fromJson(
          json['building_characteristics'] as Map<String, dynamic>,
        ),
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
  'property_info': instance.propertyInfo?.toJson(),
  'last_sold': instance.lastSold?.toJson(),
  'mortgage': instance.mortgage?.toJson(),
  'owners': instance.owners?.toJson(),
  'building_characteristics': instance.buildingCharacteristics?.toJson(),
  'records': instance.records,
  'job_filings': instance.jobFilings,
  'violations': instance.violations,
  'complaints': instance.complaints,
  'zoning': instance.zoning?.toJson(),
  'coordinates': instance.coordinates?.toJson(),
};

_PropertyInfo _$PropertyInfoFromJson(Map<String, dynamic> json) =>
    _PropertyInfo(
      propertyType: json['property_type'] as String?,
      bbl: json['bbl'] as String?,
      floors: (json['floors'] as num?)?.toDouble(),
      resUnits: (json['res_units'] as num?)?.toInt(),
      totalUnits: (json['total_units'] as num?)?.toInt(),
      lotFront: (json['lot_front'] as num?)?.toDouble(),
      lotDepth: (json['lot_depth'] as num?)?.toDouble(),
      bldgFront: (json['bldg_front'] as num?)?.toDouble(),
      bldgDepth: (json['bldg_depth'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PropertyInfoToJson(_PropertyInfo instance) =>
    <String, dynamic>{
      'property_type': instance.propertyType,
      'bbl': instance.bbl,
      'floors': instance.floors,
      'res_units': instance.resUnits,
      'total_units': instance.totalUnits,
      'lot_front': instance.lotFront,
      'lot_depth': instance.lotDepth,
      'bldg_front': instance.bldgFront,
      'bldg_depth': instance.bldgDepth,
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

_BuildingCharacteristics _$BuildingCharacteristicsFromJson(
  Map<String, dynamic> json,
) => _BuildingCharacteristics(
  propBlock: (json['prop_block'] as num?)?.toInt(),
  propLot: (json['prop_lot'] as num?)?.toInt(),
  address: json['address'] as String?,
  schoolDist: (json['school_dist'] as num?)?.toInt(),
  council: (json['council'] as num?)?.toInt(),
  zipcode: json['zipcode'] as String?,
  policePrct: json['police_prct'] as String?,
  landUse: (json['land_use'] as num?)?.toInt(),
  lotArea: (json['lot_area'] as num?)?.toDouble(),
  bldgArea: (json['bldg_area'] as num?)?.toDouble(),
  comArea: (json['com_area'] as num?)?.toDouble(),
  resArea: (json['res_area'] as num?)?.toDouble(),
  officeArea: (json['office_area'] as num?)?.toDouble(),
  retailArea: (json['retail_area'] as num?)?.toDouble(),
  garageArea: (json['garage_area'] as num?)?.toDouble(),
  strgeArea: (json['strge_area'] as num?)?.toDouble(),
  factryArea: (json['factry_area'] as num?)?.toDouble(),
  otherArea: (json['other_area'] as num?)?.toDouble(),
  areaSource: json['area_source'] as String?,
  numBldgs: (json['num_bldgs'] as num?)?.toInt(),
  numFloors: (json['num_floors'] as num?)?.toDouble(),
  unitsRes: (json['units_res'] as num?)?.toInt(),
  unitsTotal: (json['units_total'] as num?)?.toInt(),
  lotFront: (json['lot_front'] as num?)?.toDouble(),
  lotDepth: (json['lot_depth'] as num?)?.toDouble(),
  bldgFront: (json['bldg_front'] as num?)?.toDouble(),
  bldgDepth: (json['bldg_depth'] as num?)?.toDouble(),
  ext: json['ext'] as String?,
  proxCode: json['prox_code'] as String?,
  irrLotCode: json['irr_lot_code'] as String?,
  lotType: json['lot_type'] as String?,
  bsmtCode: json['bsmt_code'] as String?,
  assessLand: (json['assess_land'] as num?)?.toDouble(),
  assessTot: (json['assess_tot'] as num?)?.toDouble(),
  exemptTot: (json['exempt_tot'] as num?)?.toDouble(),
);

Map<String, dynamic> _$BuildingCharacteristicsToJson(
  _BuildingCharacteristics instance,
) => <String, dynamic>{
  'prop_block': instance.propBlock,
  'prop_lot': instance.propLot,
  'address': instance.address,
  'school_dist': instance.schoolDist,
  'council': instance.council,
  'zipcode': instance.zipcode,
  'police_prct': instance.policePrct,
  'land_use': instance.landUse,
  'lot_area': instance.lotArea,
  'bldg_area': instance.bldgArea,
  'com_area': instance.comArea,
  'res_area': instance.resArea,
  'office_area': instance.officeArea,
  'retail_area': instance.retailArea,
  'garage_area': instance.garageArea,
  'strge_area': instance.strgeArea,
  'factry_area': instance.factryArea,
  'other_area': instance.otherArea,
  'area_source': instance.areaSource,
  'num_bldgs': instance.numBldgs,
  'num_floors': instance.numFloors,
  'units_res': instance.unitsRes,
  'units_total': instance.unitsTotal,
  'lot_front': instance.lotFront,
  'lot_depth': instance.lotDepth,
  'bldg_front': instance.bldgFront,
  'bldg_depth': instance.bldgDepth,
  'ext': instance.ext,
  'prox_code': instance.proxCode,
  'irr_lot_code': instance.irrLotCode,
  'lot_type': instance.lotType,
  'bsmt_code': instance.bsmtCode,
  'assess_land': instance.assessLand,
  'assess_tot': instance.assessTot,
  'exempt_tot': instance.exemptTot,
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
