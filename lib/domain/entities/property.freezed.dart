// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'property.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Property {

 PropertyInfo? get propertyInfo; LastSold? get lastSold; Mortgage? get mortgage; Owners? get owners; BuildingCharacteristics? get buildingCharacteristics; List<Map<String, dynamic>> get records; List<Map<String, dynamic>> get jobFilings; List<Map<String, dynamic>> get violations; List<Map<String, dynamic>> get complaints; Zoning? get zoning; Coordinates? get coordinates;
/// Create a copy of Property
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PropertyCopyWith<Property> get copyWith => _$PropertyCopyWithImpl<Property>(this as Property, _$identity);

  /// Serializes this Property to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Property&&(identical(other.propertyInfo, propertyInfo) || other.propertyInfo == propertyInfo)&&(identical(other.lastSold, lastSold) || other.lastSold == lastSold)&&(identical(other.mortgage, mortgage) || other.mortgage == mortgage)&&(identical(other.owners, owners) || other.owners == owners)&&(identical(other.buildingCharacteristics, buildingCharacteristics) || other.buildingCharacteristics == buildingCharacteristics)&&const DeepCollectionEquality().equals(other.records, records)&&const DeepCollectionEquality().equals(other.jobFilings, jobFilings)&&const DeepCollectionEquality().equals(other.violations, violations)&&const DeepCollectionEquality().equals(other.complaints, complaints)&&(identical(other.zoning, zoning) || other.zoning == zoning)&&(identical(other.coordinates, coordinates) || other.coordinates == coordinates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,propertyInfo,lastSold,mortgage,owners,buildingCharacteristics,const DeepCollectionEquality().hash(records),const DeepCollectionEquality().hash(jobFilings),const DeepCollectionEquality().hash(violations),const DeepCollectionEquality().hash(complaints),zoning,coordinates);

@override
String toString() {
  return 'Property(propertyInfo: $propertyInfo, lastSold: $lastSold, mortgage: $mortgage, owners: $owners, buildingCharacteristics: $buildingCharacteristics, records: $records, jobFilings: $jobFilings, violations: $violations, complaints: $complaints, zoning: $zoning, coordinates: $coordinates)';
}


}

/// @nodoc
abstract mixin class $PropertyCopyWith<$Res>  {
  factory $PropertyCopyWith(Property value, $Res Function(Property) _then) = _$PropertyCopyWithImpl;
@useResult
$Res call({
 PropertyInfo? propertyInfo, LastSold? lastSold, Mortgage? mortgage, Owners? owners, BuildingCharacteristics? buildingCharacteristics, List<Map<String, dynamic>> records, List<Map<String, dynamic>> jobFilings, List<Map<String, dynamic>> violations, List<Map<String, dynamic>> complaints, Zoning? zoning, Coordinates? coordinates
});


$PropertyInfoCopyWith<$Res>? get propertyInfo;$LastSoldCopyWith<$Res>? get lastSold;$MortgageCopyWith<$Res>? get mortgage;$OwnersCopyWith<$Res>? get owners;$BuildingCharacteristicsCopyWith<$Res>? get buildingCharacteristics;$ZoningCopyWith<$Res>? get zoning;$CoordinatesCopyWith<$Res>? get coordinates;

}
/// @nodoc
class _$PropertyCopyWithImpl<$Res>
    implements $PropertyCopyWith<$Res> {
  _$PropertyCopyWithImpl(this._self, this._then);

  final Property _self;
  final $Res Function(Property) _then;

/// Create a copy of Property
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? propertyInfo = freezed,Object? lastSold = freezed,Object? mortgage = freezed,Object? owners = freezed,Object? buildingCharacteristics = freezed,Object? records = null,Object? jobFilings = null,Object? violations = null,Object? complaints = null,Object? zoning = freezed,Object? coordinates = freezed,}) {
  return _then(_self.copyWith(
propertyInfo: freezed == propertyInfo ? _self.propertyInfo : propertyInfo // ignore: cast_nullable_to_non_nullable
as PropertyInfo?,lastSold: freezed == lastSold ? _self.lastSold : lastSold // ignore: cast_nullable_to_non_nullable
as LastSold?,mortgage: freezed == mortgage ? _self.mortgage : mortgage // ignore: cast_nullable_to_non_nullable
as Mortgage?,owners: freezed == owners ? _self.owners : owners // ignore: cast_nullable_to_non_nullable
as Owners?,buildingCharacteristics: freezed == buildingCharacteristics ? _self.buildingCharacteristics : buildingCharacteristics // ignore: cast_nullable_to_non_nullable
as BuildingCharacteristics?,records: null == records ? _self.records : records // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,jobFilings: null == jobFilings ? _self.jobFilings : jobFilings // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,violations: null == violations ? _self.violations : violations // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,complaints: null == complaints ? _self.complaints : complaints // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,zoning: freezed == zoning ? _self.zoning : zoning // ignore: cast_nullable_to_non_nullable
as Zoning?,coordinates: freezed == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as Coordinates?,
  ));
}
/// Create a copy of Property
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PropertyInfoCopyWith<$Res>? get propertyInfo {
    if (_self.propertyInfo == null) {
    return null;
  }

  return $PropertyInfoCopyWith<$Res>(_self.propertyInfo!, (value) {
    return _then(_self.copyWith(propertyInfo: value));
  });
}/// Create a copy of Property
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LastSoldCopyWith<$Res>? get lastSold {
    if (_self.lastSold == null) {
    return null;
  }

  return $LastSoldCopyWith<$Res>(_self.lastSold!, (value) {
    return _then(_self.copyWith(lastSold: value));
  });
}/// Create a copy of Property
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MortgageCopyWith<$Res>? get mortgage {
    if (_self.mortgage == null) {
    return null;
  }

  return $MortgageCopyWith<$Res>(_self.mortgage!, (value) {
    return _then(_self.copyWith(mortgage: value));
  });
}/// Create a copy of Property
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OwnersCopyWith<$Res>? get owners {
    if (_self.owners == null) {
    return null;
  }

  return $OwnersCopyWith<$Res>(_self.owners!, (value) {
    return _then(_self.copyWith(owners: value));
  });
}/// Create a copy of Property
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuildingCharacteristicsCopyWith<$Res>? get buildingCharacteristics {
    if (_self.buildingCharacteristics == null) {
    return null;
  }

  return $BuildingCharacteristicsCopyWith<$Res>(_self.buildingCharacteristics!, (value) {
    return _then(_self.copyWith(buildingCharacteristics: value));
  });
}/// Create a copy of Property
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZoningCopyWith<$Res>? get zoning {
    if (_self.zoning == null) {
    return null;
  }

  return $ZoningCopyWith<$Res>(_self.zoning!, (value) {
    return _then(_self.copyWith(zoning: value));
  });
}/// Create a copy of Property
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoordinatesCopyWith<$Res>? get coordinates {
    if (_self.coordinates == null) {
    return null;
  }

  return $CoordinatesCopyWith<$Res>(_self.coordinates!, (value) {
    return _then(_self.copyWith(coordinates: value));
  });
}
}


/// Adds pattern-matching-related methods to [Property].
extension PropertyPatterns on Property {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Property value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Property() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Property value)  $default,){
final _that = this;
switch (_that) {
case _Property():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Property value)?  $default,){
final _that = this;
switch (_that) {
case _Property() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PropertyInfo? propertyInfo,  LastSold? lastSold,  Mortgage? mortgage,  Owners? owners,  BuildingCharacteristics? buildingCharacteristics,  List<Map<String, dynamic>> records,  List<Map<String, dynamic>> jobFilings,  List<Map<String, dynamic>> violations,  List<Map<String, dynamic>> complaints,  Zoning? zoning,  Coordinates? coordinates)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Property() when $default != null:
return $default(_that.propertyInfo,_that.lastSold,_that.mortgage,_that.owners,_that.buildingCharacteristics,_that.records,_that.jobFilings,_that.violations,_that.complaints,_that.zoning,_that.coordinates);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PropertyInfo? propertyInfo,  LastSold? lastSold,  Mortgage? mortgage,  Owners? owners,  BuildingCharacteristics? buildingCharacteristics,  List<Map<String, dynamic>> records,  List<Map<String, dynamic>> jobFilings,  List<Map<String, dynamic>> violations,  List<Map<String, dynamic>> complaints,  Zoning? zoning,  Coordinates? coordinates)  $default,) {final _that = this;
switch (_that) {
case _Property():
return $default(_that.propertyInfo,_that.lastSold,_that.mortgage,_that.owners,_that.buildingCharacteristics,_that.records,_that.jobFilings,_that.violations,_that.complaints,_that.zoning,_that.coordinates);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PropertyInfo? propertyInfo,  LastSold? lastSold,  Mortgage? mortgage,  Owners? owners,  BuildingCharacteristics? buildingCharacteristics,  List<Map<String, dynamic>> records,  List<Map<String, dynamic>> jobFilings,  List<Map<String, dynamic>> violations,  List<Map<String, dynamic>> complaints,  Zoning? zoning,  Coordinates? coordinates)?  $default,) {final _that = this;
switch (_that) {
case _Property() when $default != null:
return $default(_that.propertyInfo,_that.lastSold,_that.mortgage,_that.owners,_that.buildingCharacteristics,_that.records,_that.jobFilings,_that.violations,_that.complaints,_that.zoning,_that.coordinates);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Property implements Property {
  const _Property({this.propertyInfo, this.lastSold, this.mortgage, this.owners, this.buildingCharacteristics, final  List<Map<String, dynamic>> records = const [], final  List<Map<String, dynamic>> jobFilings = const [], final  List<Map<String, dynamic>> violations = const [], final  List<Map<String, dynamic>> complaints = const [], this.zoning, this.coordinates}): _records = records,_jobFilings = jobFilings,_violations = violations,_complaints = complaints;
  factory _Property.fromJson(Map<String, dynamic> json) => _$PropertyFromJson(json);

@override final  PropertyInfo? propertyInfo;
@override final  LastSold? lastSold;
@override final  Mortgage? mortgage;
@override final  Owners? owners;
@override final  BuildingCharacteristics? buildingCharacteristics;
 final  List<Map<String, dynamic>> _records;
@override@JsonKey() List<Map<String, dynamic>> get records {
  if (_records is EqualUnmodifiableListView) return _records;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_records);
}

 final  List<Map<String, dynamic>> _jobFilings;
@override@JsonKey() List<Map<String, dynamic>> get jobFilings {
  if (_jobFilings is EqualUnmodifiableListView) return _jobFilings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_jobFilings);
}

 final  List<Map<String, dynamic>> _violations;
@override@JsonKey() List<Map<String, dynamic>> get violations {
  if (_violations is EqualUnmodifiableListView) return _violations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_violations);
}

 final  List<Map<String, dynamic>> _complaints;
@override@JsonKey() List<Map<String, dynamic>> get complaints {
  if (_complaints is EqualUnmodifiableListView) return _complaints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_complaints);
}

@override final  Zoning? zoning;
@override final  Coordinates? coordinates;

/// Create a copy of Property
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PropertyCopyWith<_Property> get copyWith => __$PropertyCopyWithImpl<_Property>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PropertyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Property&&(identical(other.propertyInfo, propertyInfo) || other.propertyInfo == propertyInfo)&&(identical(other.lastSold, lastSold) || other.lastSold == lastSold)&&(identical(other.mortgage, mortgage) || other.mortgage == mortgage)&&(identical(other.owners, owners) || other.owners == owners)&&(identical(other.buildingCharacteristics, buildingCharacteristics) || other.buildingCharacteristics == buildingCharacteristics)&&const DeepCollectionEquality().equals(other._records, _records)&&const DeepCollectionEquality().equals(other._jobFilings, _jobFilings)&&const DeepCollectionEquality().equals(other._violations, _violations)&&const DeepCollectionEquality().equals(other._complaints, _complaints)&&(identical(other.zoning, zoning) || other.zoning == zoning)&&(identical(other.coordinates, coordinates) || other.coordinates == coordinates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,propertyInfo,lastSold,mortgage,owners,buildingCharacteristics,const DeepCollectionEquality().hash(_records),const DeepCollectionEquality().hash(_jobFilings),const DeepCollectionEquality().hash(_violations),const DeepCollectionEquality().hash(_complaints),zoning,coordinates);

@override
String toString() {
  return 'Property(propertyInfo: $propertyInfo, lastSold: $lastSold, mortgage: $mortgage, owners: $owners, buildingCharacteristics: $buildingCharacteristics, records: $records, jobFilings: $jobFilings, violations: $violations, complaints: $complaints, zoning: $zoning, coordinates: $coordinates)';
}


}

/// @nodoc
abstract mixin class _$PropertyCopyWith<$Res> implements $PropertyCopyWith<$Res> {
  factory _$PropertyCopyWith(_Property value, $Res Function(_Property) _then) = __$PropertyCopyWithImpl;
@override @useResult
$Res call({
 PropertyInfo? propertyInfo, LastSold? lastSold, Mortgage? mortgage, Owners? owners, BuildingCharacteristics? buildingCharacteristics, List<Map<String, dynamic>> records, List<Map<String, dynamic>> jobFilings, List<Map<String, dynamic>> violations, List<Map<String, dynamic>> complaints, Zoning? zoning, Coordinates? coordinates
});


@override $PropertyInfoCopyWith<$Res>? get propertyInfo;@override $LastSoldCopyWith<$Res>? get lastSold;@override $MortgageCopyWith<$Res>? get mortgage;@override $OwnersCopyWith<$Res>? get owners;@override $BuildingCharacteristicsCopyWith<$Res>? get buildingCharacteristics;@override $ZoningCopyWith<$Res>? get zoning;@override $CoordinatesCopyWith<$Res>? get coordinates;

}
/// @nodoc
class __$PropertyCopyWithImpl<$Res>
    implements _$PropertyCopyWith<$Res> {
  __$PropertyCopyWithImpl(this._self, this._then);

  final _Property _self;
  final $Res Function(_Property) _then;

/// Create a copy of Property
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? propertyInfo = freezed,Object? lastSold = freezed,Object? mortgage = freezed,Object? owners = freezed,Object? buildingCharacteristics = freezed,Object? records = null,Object? jobFilings = null,Object? violations = null,Object? complaints = null,Object? zoning = freezed,Object? coordinates = freezed,}) {
  return _then(_Property(
propertyInfo: freezed == propertyInfo ? _self.propertyInfo : propertyInfo // ignore: cast_nullable_to_non_nullable
as PropertyInfo?,lastSold: freezed == lastSold ? _self.lastSold : lastSold // ignore: cast_nullable_to_non_nullable
as LastSold?,mortgage: freezed == mortgage ? _self.mortgage : mortgage // ignore: cast_nullable_to_non_nullable
as Mortgage?,owners: freezed == owners ? _self.owners : owners // ignore: cast_nullable_to_non_nullable
as Owners?,buildingCharacteristics: freezed == buildingCharacteristics ? _self.buildingCharacteristics : buildingCharacteristics // ignore: cast_nullable_to_non_nullable
as BuildingCharacteristics?,records: null == records ? _self._records : records // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,jobFilings: null == jobFilings ? _self._jobFilings : jobFilings // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,violations: null == violations ? _self._violations : violations // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,complaints: null == complaints ? _self._complaints : complaints // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,zoning: freezed == zoning ? _self.zoning : zoning // ignore: cast_nullable_to_non_nullable
as Zoning?,coordinates: freezed == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as Coordinates?,
  ));
}

/// Create a copy of Property
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PropertyInfoCopyWith<$Res>? get propertyInfo {
    if (_self.propertyInfo == null) {
    return null;
  }

  return $PropertyInfoCopyWith<$Res>(_self.propertyInfo!, (value) {
    return _then(_self.copyWith(propertyInfo: value));
  });
}/// Create a copy of Property
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LastSoldCopyWith<$Res>? get lastSold {
    if (_self.lastSold == null) {
    return null;
  }

  return $LastSoldCopyWith<$Res>(_self.lastSold!, (value) {
    return _then(_self.copyWith(lastSold: value));
  });
}/// Create a copy of Property
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MortgageCopyWith<$Res>? get mortgage {
    if (_self.mortgage == null) {
    return null;
  }

  return $MortgageCopyWith<$Res>(_self.mortgage!, (value) {
    return _then(_self.copyWith(mortgage: value));
  });
}/// Create a copy of Property
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OwnersCopyWith<$Res>? get owners {
    if (_self.owners == null) {
    return null;
  }

  return $OwnersCopyWith<$Res>(_self.owners!, (value) {
    return _then(_self.copyWith(owners: value));
  });
}/// Create a copy of Property
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuildingCharacteristicsCopyWith<$Res>? get buildingCharacteristics {
    if (_self.buildingCharacteristics == null) {
    return null;
  }

  return $BuildingCharacteristicsCopyWith<$Res>(_self.buildingCharacteristics!, (value) {
    return _then(_self.copyWith(buildingCharacteristics: value));
  });
}/// Create a copy of Property
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ZoningCopyWith<$Res>? get zoning {
    if (_self.zoning == null) {
    return null;
  }

  return $ZoningCopyWith<$Res>(_self.zoning!, (value) {
    return _then(_self.copyWith(zoning: value));
  });
}/// Create a copy of Property
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoordinatesCopyWith<$Res>? get coordinates {
    if (_self.coordinates == null) {
    return null;
  }

  return $CoordinatesCopyWith<$Res>(_self.coordinates!, (value) {
    return _then(_self.copyWith(coordinates: value));
  });
}
}


/// @nodoc
mixin _$PropertyInfo {

 String? get propertyType; String? get bbl; double? get floors; int? get resUnits; int? get totalUnits; double? get lotFront; double? get lotDepth; double? get bldgFront; double? get bldgDepth;
/// Create a copy of PropertyInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PropertyInfoCopyWith<PropertyInfo> get copyWith => _$PropertyInfoCopyWithImpl<PropertyInfo>(this as PropertyInfo, _$identity);

  /// Serializes this PropertyInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PropertyInfo&&(identical(other.propertyType, propertyType) || other.propertyType == propertyType)&&(identical(other.bbl, bbl) || other.bbl == bbl)&&(identical(other.floors, floors) || other.floors == floors)&&(identical(other.resUnits, resUnits) || other.resUnits == resUnits)&&(identical(other.totalUnits, totalUnits) || other.totalUnits == totalUnits)&&(identical(other.lotFront, lotFront) || other.lotFront == lotFront)&&(identical(other.lotDepth, lotDepth) || other.lotDepth == lotDepth)&&(identical(other.bldgFront, bldgFront) || other.bldgFront == bldgFront)&&(identical(other.bldgDepth, bldgDepth) || other.bldgDepth == bldgDepth));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,propertyType,bbl,floors,resUnits,totalUnits,lotFront,lotDepth,bldgFront,bldgDepth);

@override
String toString() {
  return 'PropertyInfo(propertyType: $propertyType, bbl: $bbl, floors: $floors, resUnits: $resUnits, totalUnits: $totalUnits, lotFront: $lotFront, lotDepth: $lotDepth, bldgFront: $bldgFront, bldgDepth: $bldgDepth)';
}


}

/// @nodoc
abstract mixin class $PropertyInfoCopyWith<$Res>  {
  factory $PropertyInfoCopyWith(PropertyInfo value, $Res Function(PropertyInfo) _then) = _$PropertyInfoCopyWithImpl;
@useResult
$Res call({
 String? propertyType, String? bbl, double? floors, int? resUnits, int? totalUnits, double? lotFront, double? lotDepth, double? bldgFront, double? bldgDepth
});




}
/// @nodoc
class _$PropertyInfoCopyWithImpl<$Res>
    implements $PropertyInfoCopyWith<$Res> {
  _$PropertyInfoCopyWithImpl(this._self, this._then);

  final PropertyInfo _self;
  final $Res Function(PropertyInfo) _then;

/// Create a copy of PropertyInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? propertyType = freezed,Object? bbl = freezed,Object? floors = freezed,Object? resUnits = freezed,Object? totalUnits = freezed,Object? lotFront = freezed,Object? lotDepth = freezed,Object? bldgFront = freezed,Object? bldgDepth = freezed,}) {
  return _then(_self.copyWith(
propertyType: freezed == propertyType ? _self.propertyType : propertyType // ignore: cast_nullable_to_non_nullable
as String?,bbl: freezed == bbl ? _self.bbl : bbl // ignore: cast_nullable_to_non_nullable
as String?,floors: freezed == floors ? _self.floors : floors // ignore: cast_nullable_to_non_nullable
as double?,resUnits: freezed == resUnits ? _self.resUnits : resUnits // ignore: cast_nullable_to_non_nullable
as int?,totalUnits: freezed == totalUnits ? _self.totalUnits : totalUnits // ignore: cast_nullable_to_non_nullable
as int?,lotFront: freezed == lotFront ? _self.lotFront : lotFront // ignore: cast_nullable_to_non_nullable
as double?,lotDepth: freezed == lotDepth ? _self.lotDepth : lotDepth // ignore: cast_nullable_to_non_nullable
as double?,bldgFront: freezed == bldgFront ? _self.bldgFront : bldgFront // ignore: cast_nullable_to_non_nullable
as double?,bldgDepth: freezed == bldgDepth ? _self.bldgDepth : bldgDepth // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [PropertyInfo].
extension PropertyInfoPatterns on PropertyInfo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PropertyInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PropertyInfo() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PropertyInfo value)  $default,){
final _that = this;
switch (_that) {
case _PropertyInfo():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PropertyInfo value)?  $default,){
final _that = this;
switch (_that) {
case _PropertyInfo() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? propertyType,  String? bbl,  double? floors,  int? resUnits,  int? totalUnits,  double? lotFront,  double? lotDepth,  double? bldgFront,  double? bldgDepth)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PropertyInfo() when $default != null:
return $default(_that.propertyType,_that.bbl,_that.floors,_that.resUnits,_that.totalUnits,_that.lotFront,_that.lotDepth,_that.bldgFront,_that.bldgDepth);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? propertyType,  String? bbl,  double? floors,  int? resUnits,  int? totalUnits,  double? lotFront,  double? lotDepth,  double? bldgFront,  double? bldgDepth)  $default,) {final _that = this;
switch (_that) {
case _PropertyInfo():
return $default(_that.propertyType,_that.bbl,_that.floors,_that.resUnits,_that.totalUnits,_that.lotFront,_that.lotDepth,_that.bldgFront,_that.bldgDepth);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? propertyType,  String? bbl,  double? floors,  int? resUnits,  int? totalUnits,  double? lotFront,  double? lotDepth,  double? bldgFront,  double? bldgDepth)?  $default,) {final _that = this;
switch (_that) {
case _PropertyInfo() when $default != null:
return $default(_that.propertyType,_that.bbl,_that.floors,_that.resUnits,_that.totalUnits,_that.lotFront,_that.lotDepth,_that.bldgFront,_that.bldgDepth);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PropertyInfo implements PropertyInfo {
  const _PropertyInfo({this.propertyType, this.bbl, this.floors, this.resUnits, this.totalUnits, this.lotFront, this.lotDepth, this.bldgFront, this.bldgDepth});
  factory _PropertyInfo.fromJson(Map<String, dynamic> json) => _$PropertyInfoFromJson(json);

@override final  String? propertyType;
@override final  String? bbl;
@override final  double? floors;
@override final  int? resUnits;
@override final  int? totalUnits;
@override final  double? lotFront;
@override final  double? lotDepth;
@override final  double? bldgFront;
@override final  double? bldgDepth;

/// Create a copy of PropertyInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PropertyInfoCopyWith<_PropertyInfo> get copyWith => __$PropertyInfoCopyWithImpl<_PropertyInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PropertyInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PropertyInfo&&(identical(other.propertyType, propertyType) || other.propertyType == propertyType)&&(identical(other.bbl, bbl) || other.bbl == bbl)&&(identical(other.floors, floors) || other.floors == floors)&&(identical(other.resUnits, resUnits) || other.resUnits == resUnits)&&(identical(other.totalUnits, totalUnits) || other.totalUnits == totalUnits)&&(identical(other.lotFront, lotFront) || other.lotFront == lotFront)&&(identical(other.lotDepth, lotDepth) || other.lotDepth == lotDepth)&&(identical(other.bldgFront, bldgFront) || other.bldgFront == bldgFront)&&(identical(other.bldgDepth, bldgDepth) || other.bldgDepth == bldgDepth));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,propertyType,bbl,floors,resUnits,totalUnits,lotFront,lotDepth,bldgFront,bldgDepth);

@override
String toString() {
  return 'PropertyInfo(propertyType: $propertyType, bbl: $bbl, floors: $floors, resUnits: $resUnits, totalUnits: $totalUnits, lotFront: $lotFront, lotDepth: $lotDepth, bldgFront: $bldgFront, bldgDepth: $bldgDepth)';
}


}

/// @nodoc
abstract mixin class _$PropertyInfoCopyWith<$Res> implements $PropertyInfoCopyWith<$Res> {
  factory _$PropertyInfoCopyWith(_PropertyInfo value, $Res Function(_PropertyInfo) _then) = __$PropertyInfoCopyWithImpl;
@override @useResult
$Res call({
 String? propertyType, String? bbl, double? floors, int? resUnits, int? totalUnits, double? lotFront, double? lotDepth, double? bldgFront, double? bldgDepth
});




}
/// @nodoc
class __$PropertyInfoCopyWithImpl<$Res>
    implements _$PropertyInfoCopyWith<$Res> {
  __$PropertyInfoCopyWithImpl(this._self, this._then);

  final _PropertyInfo _self;
  final $Res Function(_PropertyInfo) _then;

/// Create a copy of PropertyInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? propertyType = freezed,Object? bbl = freezed,Object? floors = freezed,Object? resUnits = freezed,Object? totalUnits = freezed,Object? lotFront = freezed,Object? lotDepth = freezed,Object? bldgFront = freezed,Object? bldgDepth = freezed,}) {
  return _then(_PropertyInfo(
propertyType: freezed == propertyType ? _self.propertyType : propertyType // ignore: cast_nullable_to_non_nullable
as String?,bbl: freezed == bbl ? _self.bbl : bbl // ignore: cast_nullable_to_non_nullable
as String?,floors: freezed == floors ? _self.floors : floors // ignore: cast_nullable_to_non_nullable
as double?,resUnits: freezed == resUnits ? _self.resUnits : resUnits // ignore: cast_nullable_to_non_nullable
as int?,totalUnits: freezed == totalUnits ? _self.totalUnits : totalUnits // ignore: cast_nullable_to_non_nullable
as int?,lotFront: freezed == lotFront ? _self.lotFront : lotFront // ignore: cast_nullable_to_non_nullable
as double?,lotDepth: freezed == lotDepth ? _self.lotDepth : lotDepth // ignore: cast_nullable_to_non_nullable
as double?,bldgFront: freezed == bldgFront ? _self.bldgFront : bldgFront // ignore: cast_nullable_to_non_nullable
as double?,bldgDepth: freezed == bldgDepth ? _self.bldgDepth : bldgDepth // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$LastSold {

 double? get lastSoldPrice; String? get lastSoldDate; int? get yearBuilt; double? get landSqft; double? get grossSqft;
/// Create a copy of LastSold
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LastSoldCopyWith<LastSold> get copyWith => _$LastSoldCopyWithImpl<LastSold>(this as LastSold, _$identity);

  /// Serializes this LastSold to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LastSold&&(identical(other.lastSoldPrice, lastSoldPrice) || other.lastSoldPrice == lastSoldPrice)&&(identical(other.lastSoldDate, lastSoldDate) || other.lastSoldDate == lastSoldDate)&&(identical(other.yearBuilt, yearBuilt) || other.yearBuilt == yearBuilt)&&(identical(other.landSqft, landSqft) || other.landSqft == landSqft)&&(identical(other.grossSqft, grossSqft) || other.grossSqft == grossSqft));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lastSoldPrice,lastSoldDate,yearBuilt,landSqft,grossSqft);

@override
String toString() {
  return 'LastSold(lastSoldPrice: $lastSoldPrice, lastSoldDate: $lastSoldDate, yearBuilt: $yearBuilt, landSqft: $landSqft, grossSqft: $grossSqft)';
}


}

/// @nodoc
abstract mixin class $LastSoldCopyWith<$Res>  {
  factory $LastSoldCopyWith(LastSold value, $Res Function(LastSold) _then) = _$LastSoldCopyWithImpl;
@useResult
$Res call({
 double? lastSoldPrice, String? lastSoldDate, int? yearBuilt, double? landSqft, double? grossSqft
});




}
/// @nodoc
class _$LastSoldCopyWithImpl<$Res>
    implements $LastSoldCopyWith<$Res> {
  _$LastSoldCopyWithImpl(this._self, this._then);

  final LastSold _self;
  final $Res Function(LastSold) _then;

/// Create a copy of LastSold
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lastSoldPrice = freezed,Object? lastSoldDate = freezed,Object? yearBuilt = freezed,Object? landSqft = freezed,Object? grossSqft = freezed,}) {
  return _then(_self.copyWith(
lastSoldPrice: freezed == lastSoldPrice ? _self.lastSoldPrice : lastSoldPrice // ignore: cast_nullable_to_non_nullable
as double?,lastSoldDate: freezed == lastSoldDate ? _self.lastSoldDate : lastSoldDate // ignore: cast_nullable_to_non_nullable
as String?,yearBuilt: freezed == yearBuilt ? _self.yearBuilt : yearBuilt // ignore: cast_nullable_to_non_nullable
as int?,landSqft: freezed == landSqft ? _self.landSqft : landSqft // ignore: cast_nullable_to_non_nullable
as double?,grossSqft: freezed == grossSqft ? _self.grossSqft : grossSqft // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [LastSold].
extension LastSoldPatterns on LastSold {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LastSold value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LastSold() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LastSold value)  $default,){
final _that = this;
switch (_that) {
case _LastSold():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LastSold value)?  $default,){
final _that = this;
switch (_that) {
case _LastSold() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double? lastSoldPrice,  String? lastSoldDate,  int? yearBuilt,  double? landSqft,  double? grossSqft)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LastSold() when $default != null:
return $default(_that.lastSoldPrice,_that.lastSoldDate,_that.yearBuilt,_that.landSqft,_that.grossSqft);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double? lastSoldPrice,  String? lastSoldDate,  int? yearBuilt,  double? landSqft,  double? grossSqft)  $default,) {final _that = this;
switch (_that) {
case _LastSold():
return $default(_that.lastSoldPrice,_that.lastSoldDate,_that.yearBuilt,_that.landSqft,_that.grossSqft);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double? lastSoldPrice,  String? lastSoldDate,  int? yearBuilt,  double? landSqft,  double? grossSqft)?  $default,) {final _that = this;
switch (_that) {
case _LastSold() when $default != null:
return $default(_that.lastSoldPrice,_that.lastSoldDate,_that.yearBuilt,_that.landSqft,_that.grossSqft);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LastSold implements LastSold {
  const _LastSold({this.lastSoldPrice, this.lastSoldDate, this.yearBuilt, this.landSqft, this.grossSqft});
  factory _LastSold.fromJson(Map<String, dynamic> json) => _$LastSoldFromJson(json);

@override final  double? lastSoldPrice;
@override final  String? lastSoldDate;
@override final  int? yearBuilt;
@override final  double? landSqft;
@override final  double? grossSqft;

/// Create a copy of LastSold
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LastSoldCopyWith<_LastSold> get copyWith => __$LastSoldCopyWithImpl<_LastSold>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LastSoldToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LastSold&&(identical(other.lastSoldPrice, lastSoldPrice) || other.lastSoldPrice == lastSoldPrice)&&(identical(other.lastSoldDate, lastSoldDate) || other.lastSoldDate == lastSoldDate)&&(identical(other.yearBuilt, yearBuilt) || other.yearBuilt == yearBuilt)&&(identical(other.landSqft, landSqft) || other.landSqft == landSqft)&&(identical(other.grossSqft, grossSqft) || other.grossSqft == grossSqft));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lastSoldPrice,lastSoldDate,yearBuilt,landSqft,grossSqft);

@override
String toString() {
  return 'LastSold(lastSoldPrice: $lastSoldPrice, lastSoldDate: $lastSoldDate, yearBuilt: $yearBuilt, landSqft: $landSqft, grossSqft: $grossSqft)';
}


}

/// @nodoc
abstract mixin class _$LastSoldCopyWith<$Res> implements $LastSoldCopyWith<$Res> {
  factory _$LastSoldCopyWith(_LastSold value, $Res Function(_LastSold) _then) = __$LastSoldCopyWithImpl;
@override @useResult
$Res call({
 double? lastSoldPrice, String? lastSoldDate, int? yearBuilt, double? landSqft, double? grossSqft
});




}
/// @nodoc
class __$LastSoldCopyWithImpl<$Res>
    implements _$LastSoldCopyWith<$Res> {
  __$LastSoldCopyWithImpl(this._self, this._then);

  final _LastSold _self;
  final $Res Function(_LastSold) _then;

/// Create a copy of LastSold
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lastSoldPrice = freezed,Object? lastSoldDate = freezed,Object? yearBuilt = freezed,Object? landSqft = freezed,Object? grossSqft = freezed,}) {
  return _then(_LastSold(
lastSoldPrice: freezed == lastSoldPrice ? _self.lastSoldPrice : lastSoldPrice // ignore: cast_nullable_to_non_nullable
as double?,lastSoldDate: freezed == lastSoldDate ? _self.lastSoldDate : lastSoldDate // ignore: cast_nullable_to_non_nullable
as String?,yearBuilt: freezed == yearBuilt ? _self.yearBuilt : yearBuilt // ignore: cast_nullable_to_non_nullable
as int?,landSqft: freezed == landSqft ? _self.landSqft : landSqft // ignore: cast_nullable_to_non_nullable
as double?,grossSqft: freezed == grossSqft ? _self.grossSqft : grossSqft // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$Mortgage {

 String? get lender; String? get borrower; double? get amount;
/// Create a copy of Mortgage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MortgageCopyWith<Mortgage> get copyWith => _$MortgageCopyWithImpl<Mortgage>(this as Mortgage, _$identity);

  /// Serializes this Mortgage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Mortgage&&(identical(other.lender, lender) || other.lender == lender)&&(identical(other.borrower, borrower) || other.borrower == borrower)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lender,borrower,amount);

@override
String toString() {
  return 'Mortgage(lender: $lender, borrower: $borrower, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $MortgageCopyWith<$Res>  {
  factory $MortgageCopyWith(Mortgage value, $Res Function(Mortgage) _then) = _$MortgageCopyWithImpl;
@useResult
$Res call({
 String? lender, String? borrower, double? amount
});




}
/// @nodoc
class _$MortgageCopyWithImpl<$Res>
    implements $MortgageCopyWith<$Res> {
  _$MortgageCopyWithImpl(this._self, this._then);

  final Mortgage _self;
  final $Res Function(Mortgage) _then;

/// Create a copy of Mortgage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lender = freezed,Object? borrower = freezed,Object? amount = freezed,}) {
  return _then(_self.copyWith(
lender: freezed == lender ? _self.lender : lender // ignore: cast_nullable_to_non_nullable
as String?,borrower: freezed == borrower ? _self.borrower : borrower // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [Mortgage].
extension MortgagePatterns on Mortgage {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Mortgage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Mortgage() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Mortgage value)  $default,){
final _that = this;
switch (_that) {
case _Mortgage():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Mortgage value)?  $default,){
final _that = this;
switch (_that) {
case _Mortgage() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? lender,  String? borrower,  double? amount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Mortgage() when $default != null:
return $default(_that.lender,_that.borrower,_that.amount);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? lender,  String? borrower,  double? amount)  $default,) {final _that = this;
switch (_that) {
case _Mortgage():
return $default(_that.lender,_that.borrower,_that.amount);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? lender,  String? borrower,  double? amount)?  $default,) {final _that = this;
switch (_that) {
case _Mortgage() when $default != null:
return $default(_that.lender,_that.borrower,_that.amount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Mortgage implements Mortgage {
  const _Mortgage({this.lender, this.borrower, this.amount});
  factory _Mortgage.fromJson(Map<String, dynamic> json) => _$MortgageFromJson(json);

@override final  String? lender;
@override final  String? borrower;
@override final  double? amount;

/// Create a copy of Mortgage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MortgageCopyWith<_Mortgage> get copyWith => __$MortgageCopyWithImpl<_Mortgage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MortgageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Mortgage&&(identical(other.lender, lender) || other.lender == lender)&&(identical(other.borrower, borrower) || other.borrower == borrower)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lender,borrower,amount);

@override
String toString() {
  return 'Mortgage(lender: $lender, borrower: $borrower, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$MortgageCopyWith<$Res> implements $MortgageCopyWith<$Res> {
  factory _$MortgageCopyWith(_Mortgage value, $Res Function(_Mortgage) _then) = __$MortgageCopyWithImpl;
@override @useResult
$Res call({
 String? lender, String? borrower, double? amount
});




}
/// @nodoc
class __$MortgageCopyWithImpl<$Res>
    implements _$MortgageCopyWith<$Res> {
  __$MortgageCopyWithImpl(this._self, this._then);

  final _Mortgage _self;
  final $Res Function(_Mortgage) _then;

/// Create a copy of Mortgage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lender = freezed,Object? borrower = freezed,Object? amount = freezed,}) {
  return _then(_Mortgage(
lender: freezed == lender ? _self.lender : lender // ignore: cast_nullable_to_non_nullable
as String?,borrower: freezed == borrower ? _self.borrower : borrower // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$Owners {

 List<String> get currentOwners; List<String> get previousOwners;
/// Create a copy of Owners
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OwnersCopyWith<Owners> get copyWith => _$OwnersCopyWithImpl<Owners>(this as Owners, _$identity);

  /// Serializes this Owners to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Owners&&const DeepCollectionEquality().equals(other.currentOwners, currentOwners)&&const DeepCollectionEquality().equals(other.previousOwners, previousOwners));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(currentOwners),const DeepCollectionEquality().hash(previousOwners));

@override
String toString() {
  return 'Owners(currentOwners: $currentOwners, previousOwners: $previousOwners)';
}


}

/// @nodoc
abstract mixin class $OwnersCopyWith<$Res>  {
  factory $OwnersCopyWith(Owners value, $Res Function(Owners) _then) = _$OwnersCopyWithImpl;
@useResult
$Res call({
 List<String> currentOwners, List<String> previousOwners
});




}
/// @nodoc
class _$OwnersCopyWithImpl<$Res>
    implements $OwnersCopyWith<$Res> {
  _$OwnersCopyWithImpl(this._self, this._then);

  final Owners _self;
  final $Res Function(Owners) _then;

/// Create a copy of Owners
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentOwners = null,Object? previousOwners = null,}) {
  return _then(_self.copyWith(
currentOwners: null == currentOwners ? _self.currentOwners : currentOwners // ignore: cast_nullable_to_non_nullable
as List<String>,previousOwners: null == previousOwners ? _self.previousOwners : previousOwners // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [Owners].
extension OwnersPatterns on Owners {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Owners value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Owners() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Owners value)  $default,){
final _that = this;
switch (_that) {
case _Owners():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Owners value)?  $default,){
final _that = this;
switch (_that) {
case _Owners() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> currentOwners,  List<String> previousOwners)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Owners() when $default != null:
return $default(_that.currentOwners,_that.previousOwners);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> currentOwners,  List<String> previousOwners)  $default,) {final _that = this;
switch (_that) {
case _Owners():
return $default(_that.currentOwners,_that.previousOwners);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> currentOwners,  List<String> previousOwners)?  $default,) {final _that = this;
switch (_that) {
case _Owners() when $default != null:
return $default(_that.currentOwners,_that.previousOwners);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Owners implements Owners {
  const _Owners({final  List<String> currentOwners = const [], final  List<String> previousOwners = const []}): _currentOwners = currentOwners,_previousOwners = previousOwners;
  factory _Owners.fromJson(Map<String, dynamic> json) => _$OwnersFromJson(json);

 final  List<String> _currentOwners;
@override@JsonKey() List<String> get currentOwners {
  if (_currentOwners is EqualUnmodifiableListView) return _currentOwners;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_currentOwners);
}

 final  List<String> _previousOwners;
@override@JsonKey() List<String> get previousOwners {
  if (_previousOwners is EqualUnmodifiableListView) return _previousOwners;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_previousOwners);
}


/// Create a copy of Owners
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OwnersCopyWith<_Owners> get copyWith => __$OwnersCopyWithImpl<_Owners>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OwnersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Owners&&const DeepCollectionEquality().equals(other._currentOwners, _currentOwners)&&const DeepCollectionEquality().equals(other._previousOwners, _previousOwners));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_currentOwners),const DeepCollectionEquality().hash(_previousOwners));

@override
String toString() {
  return 'Owners(currentOwners: $currentOwners, previousOwners: $previousOwners)';
}


}

/// @nodoc
abstract mixin class _$OwnersCopyWith<$Res> implements $OwnersCopyWith<$Res> {
  factory _$OwnersCopyWith(_Owners value, $Res Function(_Owners) _then) = __$OwnersCopyWithImpl;
@override @useResult
$Res call({
 List<String> currentOwners, List<String> previousOwners
});




}
/// @nodoc
class __$OwnersCopyWithImpl<$Res>
    implements _$OwnersCopyWith<$Res> {
  __$OwnersCopyWithImpl(this._self, this._then);

  final _Owners _self;
  final $Res Function(_Owners) _then;

/// Create a copy of Owners
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentOwners = null,Object? previousOwners = null,}) {
  return _then(_Owners(
currentOwners: null == currentOwners ? _self._currentOwners : currentOwners // ignore: cast_nullable_to_non_nullable
as List<String>,previousOwners: null == previousOwners ? _self._previousOwners : previousOwners // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$BuildingCharacteristics {

 int? get propBlock; int? get propLot; String? get address; int? get schoolDist; int? get council; String? get zipcode; String? get policePrct; int? get landUse; double? get lotArea; double? get bldgArea; double? get comArea; double? get resArea; double? get officeArea; double? get retailArea; double? get garageArea; double? get strgeArea; double? get factryArea; double? get otherArea; String? get areaSource; int? get numBldgs; double? get numFloors; int? get unitsRes; int? get unitsTotal; double? get lotFront; double? get lotDepth; double? get bldgFront; double? get bldgDepth; String? get ext; String? get proxCode; String? get irrLotCode; String? get lotType; String? get bsmtCode; double? get assessLand; double? get assessTot; double? get exemptTot;
/// Create a copy of BuildingCharacteristics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BuildingCharacteristicsCopyWith<BuildingCharacteristics> get copyWith => _$BuildingCharacteristicsCopyWithImpl<BuildingCharacteristics>(this as BuildingCharacteristics, _$identity);

  /// Serializes this BuildingCharacteristics to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BuildingCharacteristics&&(identical(other.propBlock, propBlock) || other.propBlock == propBlock)&&(identical(other.propLot, propLot) || other.propLot == propLot)&&(identical(other.address, address) || other.address == address)&&(identical(other.schoolDist, schoolDist) || other.schoolDist == schoolDist)&&(identical(other.council, council) || other.council == council)&&(identical(other.zipcode, zipcode) || other.zipcode == zipcode)&&(identical(other.policePrct, policePrct) || other.policePrct == policePrct)&&(identical(other.landUse, landUse) || other.landUse == landUse)&&(identical(other.lotArea, lotArea) || other.lotArea == lotArea)&&(identical(other.bldgArea, bldgArea) || other.bldgArea == bldgArea)&&(identical(other.comArea, comArea) || other.comArea == comArea)&&(identical(other.resArea, resArea) || other.resArea == resArea)&&(identical(other.officeArea, officeArea) || other.officeArea == officeArea)&&(identical(other.retailArea, retailArea) || other.retailArea == retailArea)&&(identical(other.garageArea, garageArea) || other.garageArea == garageArea)&&(identical(other.strgeArea, strgeArea) || other.strgeArea == strgeArea)&&(identical(other.factryArea, factryArea) || other.factryArea == factryArea)&&(identical(other.otherArea, otherArea) || other.otherArea == otherArea)&&(identical(other.areaSource, areaSource) || other.areaSource == areaSource)&&(identical(other.numBldgs, numBldgs) || other.numBldgs == numBldgs)&&(identical(other.numFloors, numFloors) || other.numFloors == numFloors)&&(identical(other.unitsRes, unitsRes) || other.unitsRes == unitsRes)&&(identical(other.unitsTotal, unitsTotal) || other.unitsTotal == unitsTotal)&&(identical(other.lotFront, lotFront) || other.lotFront == lotFront)&&(identical(other.lotDepth, lotDepth) || other.lotDepth == lotDepth)&&(identical(other.bldgFront, bldgFront) || other.bldgFront == bldgFront)&&(identical(other.bldgDepth, bldgDepth) || other.bldgDepth == bldgDepth)&&(identical(other.ext, ext) || other.ext == ext)&&(identical(other.proxCode, proxCode) || other.proxCode == proxCode)&&(identical(other.irrLotCode, irrLotCode) || other.irrLotCode == irrLotCode)&&(identical(other.lotType, lotType) || other.lotType == lotType)&&(identical(other.bsmtCode, bsmtCode) || other.bsmtCode == bsmtCode)&&(identical(other.assessLand, assessLand) || other.assessLand == assessLand)&&(identical(other.assessTot, assessTot) || other.assessTot == assessTot)&&(identical(other.exemptTot, exemptTot) || other.exemptTot == exemptTot));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,propBlock,propLot,address,schoolDist,council,zipcode,policePrct,landUse,lotArea,bldgArea,comArea,resArea,officeArea,retailArea,garageArea,strgeArea,factryArea,otherArea,areaSource,numBldgs,numFloors,unitsRes,unitsTotal,lotFront,lotDepth,bldgFront,bldgDepth,ext,proxCode,irrLotCode,lotType,bsmtCode,assessLand,assessTot,exemptTot]);

@override
String toString() {
  return 'BuildingCharacteristics(propBlock: $propBlock, propLot: $propLot, address: $address, schoolDist: $schoolDist, council: $council, zipcode: $zipcode, policePrct: $policePrct, landUse: $landUse, lotArea: $lotArea, bldgArea: $bldgArea, comArea: $comArea, resArea: $resArea, officeArea: $officeArea, retailArea: $retailArea, garageArea: $garageArea, strgeArea: $strgeArea, factryArea: $factryArea, otherArea: $otherArea, areaSource: $areaSource, numBldgs: $numBldgs, numFloors: $numFloors, unitsRes: $unitsRes, unitsTotal: $unitsTotal, lotFront: $lotFront, lotDepth: $lotDepth, bldgFront: $bldgFront, bldgDepth: $bldgDepth, ext: $ext, proxCode: $proxCode, irrLotCode: $irrLotCode, lotType: $lotType, bsmtCode: $bsmtCode, assessLand: $assessLand, assessTot: $assessTot, exemptTot: $exemptTot)';
}


}

/// @nodoc
abstract mixin class $BuildingCharacteristicsCopyWith<$Res>  {
  factory $BuildingCharacteristicsCopyWith(BuildingCharacteristics value, $Res Function(BuildingCharacteristics) _then) = _$BuildingCharacteristicsCopyWithImpl;
@useResult
$Res call({
 int? propBlock, int? propLot, String? address, int? schoolDist, int? council, String? zipcode, String? policePrct, int? landUse, double? lotArea, double? bldgArea, double? comArea, double? resArea, double? officeArea, double? retailArea, double? garageArea, double? strgeArea, double? factryArea, double? otherArea, String? areaSource, int? numBldgs, double? numFloors, int? unitsRes, int? unitsTotal, double? lotFront, double? lotDepth, double? bldgFront, double? bldgDepth, String? ext, String? proxCode, String? irrLotCode, String? lotType, String? bsmtCode, double? assessLand, double? assessTot, double? exemptTot
});




}
/// @nodoc
class _$BuildingCharacteristicsCopyWithImpl<$Res>
    implements $BuildingCharacteristicsCopyWith<$Res> {
  _$BuildingCharacteristicsCopyWithImpl(this._self, this._then);

  final BuildingCharacteristics _self;
  final $Res Function(BuildingCharacteristics) _then;

/// Create a copy of BuildingCharacteristics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? propBlock = freezed,Object? propLot = freezed,Object? address = freezed,Object? schoolDist = freezed,Object? council = freezed,Object? zipcode = freezed,Object? policePrct = freezed,Object? landUse = freezed,Object? lotArea = freezed,Object? bldgArea = freezed,Object? comArea = freezed,Object? resArea = freezed,Object? officeArea = freezed,Object? retailArea = freezed,Object? garageArea = freezed,Object? strgeArea = freezed,Object? factryArea = freezed,Object? otherArea = freezed,Object? areaSource = freezed,Object? numBldgs = freezed,Object? numFloors = freezed,Object? unitsRes = freezed,Object? unitsTotal = freezed,Object? lotFront = freezed,Object? lotDepth = freezed,Object? bldgFront = freezed,Object? bldgDepth = freezed,Object? ext = freezed,Object? proxCode = freezed,Object? irrLotCode = freezed,Object? lotType = freezed,Object? bsmtCode = freezed,Object? assessLand = freezed,Object? assessTot = freezed,Object? exemptTot = freezed,}) {
  return _then(_self.copyWith(
propBlock: freezed == propBlock ? _self.propBlock : propBlock // ignore: cast_nullable_to_non_nullable
as int?,propLot: freezed == propLot ? _self.propLot : propLot // ignore: cast_nullable_to_non_nullable
as int?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,schoolDist: freezed == schoolDist ? _self.schoolDist : schoolDist // ignore: cast_nullable_to_non_nullable
as int?,council: freezed == council ? _self.council : council // ignore: cast_nullable_to_non_nullable
as int?,zipcode: freezed == zipcode ? _self.zipcode : zipcode // ignore: cast_nullable_to_non_nullable
as String?,policePrct: freezed == policePrct ? _self.policePrct : policePrct // ignore: cast_nullable_to_non_nullable
as String?,landUse: freezed == landUse ? _self.landUse : landUse // ignore: cast_nullable_to_non_nullable
as int?,lotArea: freezed == lotArea ? _self.lotArea : lotArea // ignore: cast_nullable_to_non_nullable
as double?,bldgArea: freezed == bldgArea ? _self.bldgArea : bldgArea // ignore: cast_nullable_to_non_nullable
as double?,comArea: freezed == comArea ? _self.comArea : comArea // ignore: cast_nullable_to_non_nullable
as double?,resArea: freezed == resArea ? _self.resArea : resArea // ignore: cast_nullable_to_non_nullable
as double?,officeArea: freezed == officeArea ? _self.officeArea : officeArea // ignore: cast_nullable_to_non_nullable
as double?,retailArea: freezed == retailArea ? _self.retailArea : retailArea // ignore: cast_nullable_to_non_nullable
as double?,garageArea: freezed == garageArea ? _self.garageArea : garageArea // ignore: cast_nullable_to_non_nullable
as double?,strgeArea: freezed == strgeArea ? _self.strgeArea : strgeArea // ignore: cast_nullable_to_non_nullable
as double?,factryArea: freezed == factryArea ? _self.factryArea : factryArea // ignore: cast_nullable_to_non_nullable
as double?,otherArea: freezed == otherArea ? _self.otherArea : otherArea // ignore: cast_nullable_to_non_nullable
as double?,areaSource: freezed == areaSource ? _self.areaSource : areaSource // ignore: cast_nullable_to_non_nullable
as String?,numBldgs: freezed == numBldgs ? _self.numBldgs : numBldgs // ignore: cast_nullable_to_non_nullable
as int?,numFloors: freezed == numFloors ? _self.numFloors : numFloors // ignore: cast_nullable_to_non_nullable
as double?,unitsRes: freezed == unitsRes ? _self.unitsRes : unitsRes // ignore: cast_nullable_to_non_nullable
as int?,unitsTotal: freezed == unitsTotal ? _self.unitsTotal : unitsTotal // ignore: cast_nullable_to_non_nullable
as int?,lotFront: freezed == lotFront ? _self.lotFront : lotFront // ignore: cast_nullable_to_non_nullable
as double?,lotDepth: freezed == lotDepth ? _self.lotDepth : lotDepth // ignore: cast_nullable_to_non_nullable
as double?,bldgFront: freezed == bldgFront ? _self.bldgFront : bldgFront // ignore: cast_nullable_to_non_nullable
as double?,bldgDepth: freezed == bldgDepth ? _self.bldgDepth : bldgDepth // ignore: cast_nullable_to_non_nullable
as double?,ext: freezed == ext ? _self.ext : ext // ignore: cast_nullable_to_non_nullable
as String?,proxCode: freezed == proxCode ? _self.proxCode : proxCode // ignore: cast_nullable_to_non_nullable
as String?,irrLotCode: freezed == irrLotCode ? _self.irrLotCode : irrLotCode // ignore: cast_nullable_to_non_nullable
as String?,lotType: freezed == lotType ? _self.lotType : lotType // ignore: cast_nullable_to_non_nullable
as String?,bsmtCode: freezed == bsmtCode ? _self.bsmtCode : bsmtCode // ignore: cast_nullable_to_non_nullable
as String?,assessLand: freezed == assessLand ? _self.assessLand : assessLand // ignore: cast_nullable_to_non_nullable
as double?,assessTot: freezed == assessTot ? _self.assessTot : assessTot // ignore: cast_nullable_to_non_nullable
as double?,exemptTot: freezed == exemptTot ? _self.exemptTot : exemptTot // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [BuildingCharacteristics].
extension BuildingCharacteristicsPatterns on BuildingCharacteristics {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BuildingCharacteristics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BuildingCharacteristics() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BuildingCharacteristics value)  $default,){
final _that = this;
switch (_that) {
case _BuildingCharacteristics():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BuildingCharacteristics value)?  $default,){
final _that = this;
switch (_that) {
case _BuildingCharacteristics() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? propBlock,  int? propLot,  String? address,  int? schoolDist,  int? council,  String? zipcode,  String? policePrct,  int? landUse,  double? lotArea,  double? bldgArea,  double? comArea,  double? resArea,  double? officeArea,  double? retailArea,  double? garageArea,  double? strgeArea,  double? factryArea,  double? otherArea,  String? areaSource,  int? numBldgs,  double? numFloors,  int? unitsRes,  int? unitsTotal,  double? lotFront,  double? lotDepth,  double? bldgFront,  double? bldgDepth,  String? ext,  String? proxCode,  String? irrLotCode,  String? lotType,  String? bsmtCode,  double? assessLand,  double? assessTot,  double? exemptTot)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BuildingCharacteristics() when $default != null:
return $default(_that.propBlock,_that.propLot,_that.address,_that.schoolDist,_that.council,_that.zipcode,_that.policePrct,_that.landUse,_that.lotArea,_that.bldgArea,_that.comArea,_that.resArea,_that.officeArea,_that.retailArea,_that.garageArea,_that.strgeArea,_that.factryArea,_that.otherArea,_that.areaSource,_that.numBldgs,_that.numFloors,_that.unitsRes,_that.unitsTotal,_that.lotFront,_that.lotDepth,_that.bldgFront,_that.bldgDepth,_that.ext,_that.proxCode,_that.irrLotCode,_that.lotType,_that.bsmtCode,_that.assessLand,_that.assessTot,_that.exemptTot);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? propBlock,  int? propLot,  String? address,  int? schoolDist,  int? council,  String? zipcode,  String? policePrct,  int? landUse,  double? lotArea,  double? bldgArea,  double? comArea,  double? resArea,  double? officeArea,  double? retailArea,  double? garageArea,  double? strgeArea,  double? factryArea,  double? otherArea,  String? areaSource,  int? numBldgs,  double? numFloors,  int? unitsRes,  int? unitsTotal,  double? lotFront,  double? lotDepth,  double? bldgFront,  double? bldgDepth,  String? ext,  String? proxCode,  String? irrLotCode,  String? lotType,  String? bsmtCode,  double? assessLand,  double? assessTot,  double? exemptTot)  $default,) {final _that = this;
switch (_that) {
case _BuildingCharacteristics():
return $default(_that.propBlock,_that.propLot,_that.address,_that.schoolDist,_that.council,_that.zipcode,_that.policePrct,_that.landUse,_that.lotArea,_that.bldgArea,_that.comArea,_that.resArea,_that.officeArea,_that.retailArea,_that.garageArea,_that.strgeArea,_that.factryArea,_that.otherArea,_that.areaSource,_that.numBldgs,_that.numFloors,_that.unitsRes,_that.unitsTotal,_that.lotFront,_that.lotDepth,_that.bldgFront,_that.bldgDepth,_that.ext,_that.proxCode,_that.irrLotCode,_that.lotType,_that.bsmtCode,_that.assessLand,_that.assessTot,_that.exemptTot);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? propBlock,  int? propLot,  String? address,  int? schoolDist,  int? council,  String? zipcode,  String? policePrct,  int? landUse,  double? lotArea,  double? bldgArea,  double? comArea,  double? resArea,  double? officeArea,  double? retailArea,  double? garageArea,  double? strgeArea,  double? factryArea,  double? otherArea,  String? areaSource,  int? numBldgs,  double? numFloors,  int? unitsRes,  int? unitsTotal,  double? lotFront,  double? lotDepth,  double? bldgFront,  double? bldgDepth,  String? ext,  String? proxCode,  String? irrLotCode,  String? lotType,  String? bsmtCode,  double? assessLand,  double? assessTot,  double? exemptTot)?  $default,) {final _that = this;
switch (_that) {
case _BuildingCharacteristics() when $default != null:
return $default(_that.propBlock,_that.propLot,_that.address,_that.schoolDist,_that.council,_that.zipcode,_that.policePrct,_that.landUse,_that.lotArea,_that.bldgArea,_that.comArea,_that.resArea,_that.officeArea,_that.retailArea,_that.garageArea,_that.strgeArea,_that.factryArea,_that.otherArea,_that.areaSource,_that.numBldgs,_that.numFloors,_that.unitsRes,_that.unitsTotal,_that.lotFront,_that.lotDepth,_that.bldgFront,_that.bldgDepth,_that.ext,_that.proxCode,_that.irrLotCode,_that.lotType,_that.bsmtCode,_that.assessLand,_that.assessTot,_that.exemptTot);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BuildingCharacteristics implements BuildingCharacteristics {
  const _BuildingCharacteristics({this.propBlock, this.propLot, this.address, this.schoolDist, this.council, this.zipcode, this.policePrct, this.landUse, this.lotArea, this.bldgArea, this.comArea, this.resArea, this.officeArea, this.retailArea, this.garageArea, this.strgeArea, this.factryArea, this.otherArea, this.areaSource, this.numBldgs, this.numFloors, this.unitsRes, this.unitsTotal, this.lotFront, this.lotDepth, this.bldgFront, this.bldgDepth, this.ext, this.proxCode, this.irrLotCode, this.lotType, this.bsmtCode, this.assessLand, this.assessTot, this.exemptTot});
  factory _BuildingCharacteristics.fromJson(Map<String, dynamic> json) => _$BuildingCharacteristicsFromJson(json);

@override final  int? propBlock;
@override final  int? propLot;
@override final  String? address;
@override final  int? schoolDist;
@override final  int? council;
@override final  String? zipcode;
@override final  String? policePrct;
@override final  int? landUse;
@override final  double? lotArea;
@override final  double? bldgArea;
@override final  double? comArea;
@override final  double? resArea;
@override final  double? officeArea;
@override final  double? retailArea;
@override final  double? garageArea;
@override final  double? strgeArea;
@override final  double? factryArea;
@override final  double? otherArea;
@override final  String? areaSource;
@override final  int? numBldgs;
@override final  double? numFloors;
@override final  int? unitsRes;
@override final  int? unitsTotal;
@override final  double? lotFront;
@override final  double? lotDepth;
@override final  double? bldgFront;
@override final  double? bldgDepth;
@override final  String? ext;
@override final  String? proxCode;
@override final  String? irrLotCode;
@override final  String? lotType;
@override final  String? bsmtCode;
@override final  double? assessLand;
@override final  double? assessTot;
@override final  double? exemptTot;

/// Create a copy of BuildingCharacteristics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BuildingCharacteristicsCopyWith<_BuildingCharacteristics> get copyWith => __$BuildingCharacteristicsCopyWithImpl<_BuildingCharacteristics>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BuildingCharacteristicsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BuildingCharacteristics&&(identical(other.propBlock, propBlock) || other.propBlock == propBlock)&&(identical(other.propLot, propLot) || other.propLot == propLot)&&(identical(other.address, address) || other.address == address)&&(identical(other.schoolDist, schoolDist) || other.schoolDist == schoolDist)&&(identical(other.council, council) || other.council == council)&&(identical(other.zipcode, zipcode) || other.zipcode == zipcode)&&(identical(other.policePrct, policePrct) || other.policePrct == policePrct)&&(identical(other.landUse, landUse) || other.landUse == landUse)&&(identical(other.lotArea, lotArea) || other.lotArea == lotArea)&&(identical(other.bldgArea, bldgArea) || other.bldgArea == bldgArea)&&(identical(other.comArea, comArea) || other.comArea == comArea)&&(identical(other.resArea, resArea) || other.resArea == resArea)&&(identical(other.officeArea, officeArea) || other.officeArea == officeArea)&&(identical(other.retailArea, retailArea) || other.retailArea == retailArea)&&(identical(other.garageArea, garageArea) || other.garageArea == garageArea)&&(identical(other.strgeArea, strgeArea) || other.strgeArea == strgeArea)&&(identical(other.factryArea, factryArea) || other.factryArea == factryArea)&&(identical(other.otherArea, otherArea) || other.otherArea == otherArea)&&(identical(other.areaSource, areaSource) || other.areaSource == areaSource)&&(identical(other.numBldgs, numBldgs) || other.numBldgs == numBldgs)&&(identical(other.numFloors, numFloors) || other.numFloors == numFloors)&&(identical(other.unitsRes, unitsRes) || other.unitsRes == unitsRes)&&(identical(other.unitsTotal, unitsTotal) || other.unitsTotal == unitsTotal)&&(identical(other.lotFront, lotFront) || other.lotFront == lotFront)&&(identical(other.lotDepth, lotDepth) || other.lotDepth == lotDepth)&&(identical(other.bldgFront, bldgFront) || other.bldgFront == bldgFront)&&(identical(other.bldgDepth, bldgDepth) || other.bldgDepth == bldgDepth)&&(identical(other.ext, ext) || other.ext == ext)&&(identical(other.proxCode, proxCode) || other.proxCode == proxCode)&&(identical(other.irrLotCode, irrLotCode) || other.irrLotCode == irrLotCode)&&(identical(other.lotType, lotType) || other.lotType == lotType)&&(identical(other.bsmtCode, bsmtCode) || other.bsmtCode == bsmtCode)&&(identical(other.assessLand, assessLand) || other.assessLand == assessLand)&&(identical(other.assessTot, assessTot) || other.assessTot == assessTot)&&(identical(other.exemptTot, exemptTot) || other.exemptTot == exemptTot));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,propBlock,propLot,address,schoolDist,council,zipcode,policePrct,landUse,lotArea,bldgArea,comArea,resArea,officeArea,retailArea,garageArea,strgeArea,factryArea,otherArea,areaSource,numBldgs,numFloors,unitsRes,unitsTotal,lotFront,lotDepth,bldgFront,bldgDepth,ext,proxCode,irrLotCode,lotType,bsmtCode,assessLand,assessTot,exemptTot]);

@override
String toString() {
  return 'BuildingCharacteristics(propBlock: $propBlock, propLot: $propLot, address: $address, schoolDist: $schoolDist, council: $council, zipcode: $zipcode, policePrct: $policePrct, landUse: $landUse, lotArea: $lotArea, bldgArea: $bldgArea, comArea: $comArea, resArea: $resArea, officeArea: $officeArea, retailArea: $retailArea, garageArea: $garageArea, strgeArea: $strgeArea, factryArea: $factryArea, otherArea: $otherArea, areaSource: $areaSource, numBldgs: $numBldgs, numFloors: $numFloors, unitsRes: $unitsRes, unitsTotal: $unitsTotal, lotFront: $lotFront, lotDepth: $lotDepth, bldgFront: $bldgFront, bldgDepth: $bldgDepth, ext: $ext, proxCode: $proxCode, irrLotCode: $irrLotCode, lotType: $lotType, bsmtCode: $bsmtCode, assessLand: $assessLand, assessTot: $assessTot, exemptTot: $exemptTot)';
}


}

/// @nodoc
abstract mixin class _$BuildingCharacteristicsCopyWith<$Res> implements $BuildingCharacteristicsCopyWith<$Res> {
  factory _$BuildingCharacteristicsCopyWith(_BuildingCharacteristics value, $Res Function(_BuildingCharacteristics) _then) = __$BuildingCharacteristicsCopyWithImpl;
@override @useResult
$Res call({
 int? propBlock, int? propLot, String? address, int? schoolDist, int? council, String? zipcode, String? policePrct, int? landUse, double? lotArea, double? bldgArea, double? comArea, double? resArea, double? officeArea, double? retailArea, double? garageArea, double? strgeArea, double? factryArea, double? otherArea, String? areaSource, int? numBldgs, double? numFloors, int? unitsRes, int? unitsTotal, double? lotFront, double? lotDepth, double? bldgFront, double? bldgDepth, String? ext, String? proxCode, String? irrLotCode, String? lotType, String? bsmtCode, double? assessLand, double? assessTot, double? exemptTot
});




}
/// @nodoc
class __$BuildingCharacteristicsCopyWithImpl<$Res>
    implements _$BuildingCharacteristicsCopyWith<$Res> {
  __$BuildingCharacteristicsCopyWithImpl(this._self, this._then);

  final _BuildingCharacteristics _self;
  final $Res Function(_BuildingCharacteristics) _then;

/// Create a copy of BuildingCharacteristics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? propBlock = freezed,Object? propLot = freezed,Object? address = freezed,Object? schoolDist = freezed,Object? council = freezed,Object? zipcode = freezed,Object? policePrct = freezed,Object? landUse = freezed,Object? lotArea = freezed,Object? bldgArea = freezed,Object? comArea = freezed,Object? resArea = freezed,Object? officeArea = freezed,Object? retailArea = freezed,Object? garageArea = freezed,Object? strgeArea = freezed,Object? factryArea = freezed,Object? otherArea = freezed,Object? areaSource = freezed,Object? numBldgs = freezed,Object? numFloors = freezed,Object? unitsRes = freezed,Object? unitsTotal = freezed,Object? lotFront = freezed,Object? lotDepth = freezed,Object? bldgFront = freezed,Object? bldgDepth = freezed,Object? ext = freezed,Object? proxCode = freezed,Object? irrLotCode = freezed,Object? lotType = freezed,Object? bsmtCode = freezed,Object? assessLand = freezed,Object? assessTot = freezed,Object? exemptTot = freezed,}) {
  return _then(_BuildingCharacteristics(
propBlock: freezed == propBlock ? _self.propBlock : propBlock // ignore: cast_nullable_to_non_nullable
as int?,propLot: freezed == propLot ? _self.propLot : propLot // ignore: cast_nullable_to_non_nullable
as int?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,schoolDist: freezed == schoolDist ? _self.schoolDist : schoolDist // ignore: cast_nullable_to_non_nullable
as int?,council: freezed == council ? _self.council : council // ignore: cast_nullable_to_non_nullable
as int?,zipcode: freezed == zipcode ? _self.zipcode : zipcode // ignore: cast_nullable_to_non_nullable
as String?,policePrct: freezed == policePrct ? _self.policePrct : policePrct // ignore: cast_nullable_to_non_nullable
as String?,landUse: freezed == landUse ? _self.landUse : landUse // ignore: cast_nullable_to_non_nullable
as int?,lotArea: freezed == lotArea ? _self.lotArea : lotArea // ignore: cast_nullable_to_non_nullable
as double?,bldgArea: freezed == bldgArea ? _self.bldgArea : bldgArea // ignore: cast_nullable_to_non_nullable
as double?,comArea: freezed == comArea ? _self.comArea : comArea // ignore: cast_nullable_to_non_nullable
as double?,resArea: freezed == resArea ? _self.resArea : resArea // ignore: cast_nullable_to_non_nullable
as double?,officeArea: freezed == officeArea ? _self.officeArea : officeArea // ignore: cast_nullable_to_non_nullable
as double?,retailArea: freezed == retailArea ? _self.retailArea : retailArea // ignore: cast_nullable_to_non_nullable
as double?,garageArea: freezed == garageArea ? _self.garageArea : garageArea // ignore: cast_nullable_to_non_nullable
as double?,strgeArea: freezed == strgeArea ? _self.strgeArea : strgeArea // ignore: cast_nullable_to_non_nullable
as double?,factryArea: freezed == factryArea ? _self.factryArea : factryArea // ignore: cast_nullable_to_non_nullable
as double?,otherArea: freezed == otherArea ? _self.otherArea : otherArea // ignore: cast_nullable_to_non_nullable
as double?,areaSource: freezed == areaSource ? _self.areaSource : areaSource // ignore: cast_nullable_to_non_nullable
as String?,numBldgs: freezed == numBldgs ? _self.numBldgs : numBldgs // ignore: cast_nullable_to_non_nullable
as int?,numFloors: freezed == numFloors ? _self.numFloors : numFloors // ignore: cast_nullable_to_non_nullable
as double?,unitsRes: freezed == unitsRes ? _self.unitsRes : unitsRes // ignore: cast_nullable_to_non_nullable
as int?,unitsTotal: freezed == unitsTotal ? _self.unitsTotal : unitsTotal // ignore: cast_nullable_to_non_nullable
as int?,lotFront: freezed == lotFront ? _self.lotFront : lotFront // ignore: cast_nullable_to_non_nullable
as double?,lotDepth: freezed == lotDepth ? _self.lotDepth : lotDepth // ignore: cast_nullable_to_non_nullable
as double?,bldgFront: freezed == bldgFront ? _self.bldgFront : bldgFront // ignore: cast_nullable_to_non_nullable
as double?,bldgDepth: freezed == bldgDepth ? _self.bldgDepth : bldgDepth // ignore: cast_nullable_to_non_nullable
as double?,ext: freezed == ext ? _self.ext : ext // ignore: cast_nullable_to_non_nullable
as String?,proxCode: freezed == proxCode ? _self.proxCode : proxCode // ignore: cast_nullable_to_non_nullable
as String?,irrLotCode: freezed == irrLotCode ? _self.irrLotCode : irrLotCode // ignore: cast_nullable_to_non_nullable
as String?,lotType: freezed == lotType ? _self.lotType : lotType // ignore: cast_nullable_to_non_nullable
as String?,bsmtCode: freezed == bsmtCode ? _self.bsmtCode : bsmtCode // ignore: cast_nullable_to_non_nullable
as String?,assessLand: freezed == assessLand ? _self.assessLand : assessLand // ignore: cast_nullable_to_non_nullable
as double?,assessTot: freezed == assessTot ? _self.assessTot : assessTot // ignore: cast_nullable_to_non_nullable
as double?,exemptTot: freezed == exemptTot ? _self.exemptTot : exemptTot // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$Zoning {

 List<String> get zoningDistricts; List<String> get commercialOverlays; List<String> get specialDistricts; String? get limitedHeightDistrict; String? get lastUpdated;
/// Create a copy of Zoning
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ZoningCopyWith<Zoning> get copyWith => _$ZoningCopyWithImpl<Zoning>(this as Zoning, _$identity);

  /// Serializes this Zoning to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Zoning&&const DeepCollectionEquality().equals(other.zoningDistricts, zoningDistricts)&&const DeepCollectionEquality().equals(other.commercialOverlays, commercialOverlays)&&const DeepCollectionEquality().equals(other.specialDistricts, specialDistricts)&&(identical(other.limitedHeightDistrict, limitedHeightDistrict) || other.limitedHeightDistrict == limitedHeightDistrict)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(zoningDistricts),const DeepCollectionEquality().hash(commercialOverlays),const DeepCollectionEquality().hash(specialDistricts),limitedHeightDistrict,lastUpdated);

@override
String toString() {
  return 'Zoning(zoningDistricts: $zoningDistricts, commercialOverlays: $commercialOverlays, specialDistricts: $specialDistricts, limitedHeightDistrict: $limitedHeightDistrict, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class $ZoningCopyWith<$Res>  {
  factory $ZoningCopyWith(Zoning value, $Res Function(Zoning) _then) = _$ZoningCopyWithImpl;
@useResult
$Res call({
 List<String> zoningDistricts, List<String> commercialOverlays, List<String> specialDistricts, String? limitedHeightDistrict, String? lastUpdated
});




}
/// @nodoc
class _$ZoningCopyWithImpl<$Res>
    implements $ZoningCopyWith<$Res> {
  _$ZoningCopyWithImpl(this._self, this._then);

  final Zoning _self;
  final $Res Function(Zoning) _then;

/// Create a copy of Zoning
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? zoningDistricts = null,Object? commercialOverlays = null,Object? specialDistricts = null,Object? limitedHeightDistrict = freezed,Object? lastUpdated = freezed,}) {
  return _then(_self.copyWith(
zoningDistricts: null == zoningDistricts ? _self.zoningDistricts : zoningDistricts // ignore: cast_nullable_to_non_nullable
as List<String>,commercialOverlays: null == commercialOverlays ? _self.commercialOverlays : commercialOverlays // ignore: cast_nullable_to_non_nullable
as List<String>,specialDistricts: null == specialDistricts ? _self.specialDistricts : specialDistricts // ignore: cast_nullable_to_non_nullable
as List<String>,limitedHeightDistrict: freezed == limitedHeightDistrict ? _self.limitedHeightDistrict : limitedHeightDistrict // ignore: cast_nullable_to_non_nullable
as String?,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Zoning].
extension ZoningPatterns on Zoning {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Zoning value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Zoning() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Zoning value)  $default,){
final _that = this;
switch (_that) {
case _Zoning():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Zoning value)?  $default,){
final _that = this;
switch (_that) {
case _Zoning() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> zoningDistricts,  List<String> commercialOverlays,  List<String> specialDistricts,  String? limitedHeightDistrict,  String? lastUpdated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Zoning() when $default != null:
return $default(_that.zoningDistricts,_that.commercialOverlays,_that.specialDistricts,_that.limitedHeightDistrict,_that.lastUpdated);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> zoningDistricts,  List<String> commercialOverlays,  List<String> specialDistricts,  String? limitedHeightDistrict,  String? lastUpdated)  $default,) {final _that = this;
switch (_that) {
case _Zoning():
return $default(_that.zoningDistricts,_that.commercialOverlays,_that.specialDistricts,_that.limitedHeightDistrict,_that.lastUpdated);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> zoningDistricts,  List<String> commercialOverlays,  List<String> specialDistricts,  String? limitedHeightDistrict,  String? lastUpdated)?  $default,) {final _that = this;
switch (_that) {
case _Zoning() when $default != null:
return $default(_that.zoningDistricts,_that.commercialOverlays,_that.specialDistricts,_that.limitedHeightDistrict,_that.lastUpdated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Zoning implements Zoning {
  const _Zoning({final  List<String> zoningDistricts = const [], final  List<String> commercialOverlays = const [], final  List<String> specialDistricts = const [], this.limitedHeightDistrict, this.lastUpdated}): _zoningDistricts = zoningDistricts,_commercialOverlays = commercialOverlays,_specialDistricts = specialDistricts;
  factory _Zoning.fromJson(Map<String, dynamic> json) => _$ZoningFromJson(json);

 final  List<String> _zoningDistricts;
@override@JsonKey() List<String> get zoningDistricts {
  if (_zoningDistricts is EqualUnmodifiableListView) return _zoningDistricts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_zoningDistricts);
}

 final  List<String> _commercialOverlays;
@override@JsonKey() List<String> get commercialOverlays {
  if (_commercialOverlays is EqualUnmodifiableListView) return _commercialOverlays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_commercialOverlays);
}

 final  List<String> _specialDistricts;
@override@JsonKey() List<String> get specialDistricts {
  if (_specialDistricts is EqualUnmodifiableListView) return _specialDistricts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_specialDistricts);
}

@override final  String? limitedHeightDistrict;
@override final  String? lastUpdated;

/// Create a copy of Zoning
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ZoningCopyWith<_Zoning> get copyWith => __$ZoningCopyWithImpl<_Zoning>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ZoningToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Zoning&&const DeepCollectionEquality().equals(other._zoningDistricts, _zoningDistricts)&&const DeepCollectionEquality().equals(other._commercialOverlays, _commercialOverlays)&&const DeepCollectionEquality().equals(other._specialDistricts, _specialDistricts)&&(identical(other.limitedHeightDistrict, limitedHeightDistrict) || other.limitedHeightDistrict == limitedHeightDistrict)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_zoningDistricts),const DeepCollectionEquality().hash(_commercialOverlays),const DeepCollectionEquality().hash(_specialDistricts),limitedHeightDistrict,lastUpdated);

@override
String toString() {
  return 'Zoning(zoningDistricts: $zoningDistricts, commercialOverlays: $commercialOverlays, specialDistricts: $specialDistricts, limitedHeightDistrict: $limitedHeightDistrict, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class _$ZoningCopyWith<$Res> implements $ZoningCopyWith<$Res> {
  factory _$ZoningCopyWith(_Zoning value, $Res Function(_Zoning) _then) = __$ZoningCopyWithImpl;
@override @useResult
$Res call({
 List<String> zoningDistricts, List<String> commercialOverlays, List<String> specialDistricts, String? limitedHeightDistrict, String? lastUpdated
});




}
/// @nodoc
class __$ZoningCopyWithImpl<$Res>
    implements _$ZoningCopyWith<$Res> {
  __$ZoningCopyWithImpl(this._self, this._then);

  final _Zoning _self;
  final $Res Function(_Zoning) _then;

/// Create a copy of Zoning
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? zoningDistricts = null,Object? commercialOverlays = null,Object? specialDistricts = null,Object? limitedHeightDistrict = freezed,Object? lastUpdated = freezed,}) {
  return _then(_Zoning(
zoningDistricts: null == zoningDistricts ? _self._zoningDistricts : zoningDistricts // ignore: cast_nullable_to_non_nullable
as List<String>,commercialOverlays: null == commercialOverlays ? _self._commercialOverlays : commercialOverlays // ignore: cast_nullable_to_non_nullable
as List<String>,specialDistricts: null == specialDistricts ? _self._specialDistricts : specialDistricts // ignore: cast_nullable_to_non_nullable
as List<String>,limitedHeightDistrict: freezed == limitedHeightDistrict ? _self.limitedHeightDistrict : limitedHeightDistrict // ignore: cast_nullable_to_non_nullable
as String?,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Coordinates {

 double? get latitude; double? get longitude;
/// Create a copy of Coordinates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoordinatesCopyWith<Coordinates> get copyWith => _$CoordinatesCopyWithImpl<Coordinates>(this as Coordinates, _$identity);

  /// Serializes this Coordinates to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Coordinates&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latitude,longitude);

@override
String toString() {
  return 'Coordinates(latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $CoordinatesCopyWith<$Res>  {
  factory $CoordinatesCopyWith(Coordinates value, $Res Function(Coordinates) _then) = _$CoordinatesCopyWithImpl;
@useResult
$Res call({
 double? latitude, double? longitude
});




}
/// @nodoc
class _$CoordinatesCopyWithImpl<$Res>
    implements $CoordinatesCopyWith<$Res> {
  _$CoordinatesCopyWithImpl(this._self, this._then);

  final Coordinates _self;
  final $Res Function(Coordinates) _then;

/// Create a copy of Coordinates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_self.copyWith(
latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [Coordinates].
extension CoordinatesPatterns on Coordinates {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Coordinates value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Coordinates() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Coordinates value)  $default,){
final _that = this;
switch (_that) {
case _Coordinates():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Coordinates value)?  $default,){
final _that = this;
switch (_that) {
case _Coordinates() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double? latitude,  double? longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Coordinates() when $default != null:
return $default(_that.latitude,_that.longitude);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double? latitude,  double? longitude)  $default,) {final _that = this;
switch (_that) {
case _Coordinates():
return $default(_that.latitude,_that.longitude);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double? latitude,  double? longitude)?  $default,) {final _that = this;
switch (_that) {
case _Coordinates() when $default != null:
return $default(_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Coordinates implements Coordinates {
  const _Coordinates({this.latitude, this.longitude});
  factory _Coordinates.fromJson(Map<String, dynamic> json) => _$CoordinatesFromJson(json);

@override final  double? latitude;
@override final  double? longitude;

/// Create a copy of Coordinates
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoordinatesCopyWith<_Coordinates> get copyWith => __$CoordinatesCopyWithImpl<_Coordinates>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoordinatesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Coordinates&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latitude,longitude);

@override
String toString() {
  return 'Coordinates(latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$CoordinatesCopyWith<$Res> implements $CoordinatesCopyWith<$Res> {
  factory _$CoordinatesCopyWith(_Coordinates value, $Res Function(_Coordinates) _then) = __$CoordinatesCopyWithImpl;
@override @useResult
$Res call({
 double? latitude, double? longitude
});




}
/// @nodoc
class __$CoordinatesCopyWithImpl<$Res>
    implements _$CoordinatesCopyWith<$Res> {
  __$CoordinatesCopyWithImpl(this._self, this._then);

  final _Coordinates _self;
  final $Res Function(_Coordinates) _then;

/// Create a copy of Coordinates
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_Coordinates(
latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
