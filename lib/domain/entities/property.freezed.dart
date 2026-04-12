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

 LastSold? get lastSold; Mortgage? get mortgage; Owners? get owners; List<Map<String, dynamic>> get records; List<Map<String, dynamic>> get jobFilings; List<Map<String, dynamic>> get violations; List<Map<String, dynamic>> get complaints; Zoning? get zoning; Coordinates? get coordinates;
/// Create a copy of Property
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PropertyCopyWith<Property> get copyWith => _$PropertyCopyWithImpl<Property>(this as Property, _$identity);

  /// Serializes this Property to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Property&&(identical(other.lastSold, lastSold) || other.lastSold == lastSold)&&(identical(other.mortgage, mortgage) || other.mortgage == mortgage)&&(identical(other.owners, owners) || other.owners == owners)&&const DeepCollectionEquality().equals(other.records, records)&&const DeepCollectionEquality().equals(other.jobFilings, jobFilings)&&const DeepCollectionEquality().equals(other.violations, violations)&&const DeepCollectionEquality().equals(other.complaints, complaints)&&(identical(other.zoning, zoning) || other.zoning == zoning)&&(identical(other.coordinates, coordinates) || other.coordinates == coordinates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lastSold,mortgage,owners,const DeepCollectionEquality().hash(records),const DeepCollectionEquality().hash(jobFilings),const DeepCollectionEquality().hash(violations),const DeepCollectionEquality().hash(complaints),zoning,coordinates);

@override
String toString() {
  return 'Property(lastSold: $lastSold, mortgage: $mortgage, owners: $owners, records: $records, jobFilings: $jobFilings, violations: $violations, complaints: $complaints, zoning: $zoning, coordinates: $coordinates)';
}


}

/// @nodoc
abstract mixin class $PropertyCopyWith<$Res>  {
  factory $PropertyCopyWith(Property value, $Res Function(Property) _then) = _$PropertyCopyWithImpl;
@useResult
$Res call({
 LastSold? lastSold, Mortgage? mortgage, Owners? owners, List<Map<String, dynamic>> records, List<Map<String, dynamic>> jobFilings, List<Map<String, dynamic>> violations, List<Map<String, dynamic>> complaints, Zoning? zoning, Coordinates? coordinates
});


$LastSoldCopyWith<$Res>? get lastSold;$MortgageCopyWith<$Res>? get mortgage;$OwnersCopyWith<$Res>? get owners;$ZoningCopyWith<$Res>? get zoning;$CoordinatesCopyWith<$Res>? get coordinates;

}
/// @nodoc
class _$PropertyCopyWithImpl<$Res>
    implements $PropertyCopyWith<$Res> {
  _$PropertyCopyWithImpl(this._self, this._then);

  final Property _self;
  final $Res Function(Property) _then;

/// Create a copy of Property
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lastSold = freezed,Object? mortgage = freezed,Object? owners = freezed,Object? records = null,Object? jobFilings = null,Object? violations = null,Object? complaints = null,Object? zoning = freezed,Object? coordinates = freezed,}) {
  return _then(_self.copyWith(
lastSold: freezed == lastSold ? _self.lastSold : lastSold // ignore: cast_nullable_to_non_nullable
as LastSold?,mortgage: freezed == mortgage ? _self.mortgage : mortgage // ignore: cast_nullable_to_non_nullable
as Mortgage?,owners: freezed == owners ? _self.owners : owners // ignore: cast_nullable_to_non_nullable
as Owners?,records: null == records ? _self.records : records // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LastSold? lastSold,  Mortgage? mortgage,  Owners? owners,  List<Map<String, dynamic>> records,  List<Map<String, dynamic>> jobFilings,  List<Map<String, dynamic>> violations,  List<Map<String, dynamic>> complaints,  Zoning? zoning,  Coordinates? coordinates)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Property() when $default != null:
return $default(_that.lastSold,_that.mortgage,_that.owners,_that.records,_that.jobFilings,_that.violations,_that.complaints,_that.zoning,_that.coordinates);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LastSold? lastSold,  Mortgage? mortgage,  Owners? owners,  List<Map<String, dynamic>> records,  List<Map<String, dynamic>> jobFilings,  List<Map<String, dynamic>> violations,  List<Map<String, dynamic>> complaints,  Zoning? zoning,  Coordinates? coordinates)  $default,) {final _that = this;
switch (_that) {
case _Property():
return $default(_that.lastSold,_that.mortgage,_that.owners,_that.records,_that.jobFilings,_that.violations,_that.complaints,_that.zoning,_that.coordinates);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LastSold? lastSold,  Mortgage? mortgage,  Owners? owners,  List<Map<String, dynamic>> records,  List<Map<String, dynamic>> jobFilings,  List<Map<String, dynamic>> violations,  List<Map<String, dynamic>> complaints,  Zoning? zoning,  Coordinates? coordinates)?  $default,) {final _that = this;
switch (_that) {
case _Property() when $default != null:
return $default(_that.lastSold,_that.mortgage,_that.owners,_that.records,_that.jobFilings,_that.violations,_that.complaints,_that.zoning,_that.coordinates);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Property implements Property {
  const _Property({this.lastSold, this.mortgage, this.owners, final  List<Map<String, dynamic>> records = const [], final  List<Map<String, dynamic>> jobFilings = const [], final  List<Map<String, dynamic>> violations = const [], final  List<Map<String, dynamic>> complaints = const [], this.zoning, this.coordinates}): _records = records,_jobFilings = jobFilings,_violations = violations,_complaints = complaints;
  factory _Property.fromJson(Map<String, dynamic> json) => _$PropertyFromJson(json);

@override final  LastSold? lastSold;
@override final  Mortgage? mortgage;
@override final  Owners? owners;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Property&&(identical(other.lastSold, lastSold) || other.lastSold == lastSold)&&(identical(other.mortgage, mortgage) || other.mortgage == mortgage)&&(identical(other.owners, owners) || other.owners == owners)&&const DeepCollectionEquality().equals(other._records, _records)&&const DeepCollectionEquality().equals(other._jobFilings, _jobFilings)&&const DeepCollectionEquality().equals(other._violations, _violations)&&const DeepCollectionEquality().equals(other._complaints, _complaints)&&(identical(other.zoning, zoning) || other.zoning == zoning)&&(identical(other.coordinates, coordinates) || other.coordinates == coordinates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lastSold,mortgage,owners,const DeepCollectionEquality().hash(_records),const DeepCollectionEquality().hash(_jobFilings),const DeepCollectionEquality().hash(_violations),const DeepCollectionEquality().hash(_complaints),zoning,coordinates);

@override
String toString() {
  return 'Property(lastSold: $lastSold, mortgage: $mortgage, owners: $owners, records: $records, jobFilings: $jobFilings, violations: $violations, complaints: $complaints, zoning: $zoning, coordinates: $coordinates)';
}


}

/// @nodoc
abstract mixin class _$PropertyCopyWith<$Res> implements $PropertyCopyWith<$Res> {
  factory _$PropertyCopyWith(_Property value, $Res Function(_Property) _then) = __$PropertyCopyWithImpl;
@override @useResult
$Res call({
 LastSold? lastSold, Mortgage? mortgage, Owners? owners, List<Map<String, dynamic>> records, List<Map<String, dynamic>> jobFilings, List<Map<String, dynamic>> violations, List<Map<String, dynamic>> complaints, Zoning? zoning, Coordinates? coordinates
});


@override $LastSoldCopyWith<$Res>? get lastSold;@override $MortgageCopyWith<$Res>? get mortgage;@override $OwnersCopyWith<$Res>? get owners;@override $ZoningCopyWith<$Res>? get zoning;@override $CoordinatesCopyWith<$Res>? get coordinates;

}
/// @nodoc
class __$PropertyCopyWithImpl<$Res>
    implements _$PropertyCopyWith<$Res> {
  __$PropertyCopyWithImpl(this._self, this._then);

  final _Property _self;
  final $Res Function(_Property) _then;

/// Create a copy of Property
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lastSold = freezed,Object? mortgage = freezed,Object? owners = freezed,Object? records = null,Object? jobFilings = null,Object? violations = null,Object? complaints = null,Object? zoning = freezed,Object? coordinates = freezed,}) {
  return _then(_Property(
lastSold: freezed == lastSold ? _self.lastSold : lastSold // ignore: cast_nullable_to_non_nullable
as LastSold?,mortgage: freezed == mortgage ? _self.mortgage : mortgage // ignore: cast_nullable_to_non_nullable
as Mortgage?,owners: freezed == owners ? _self.owners : owners // ignore: cast_nullable_to_non_nullable
as Owners?,records: null == records ? _self._records : records // ignore: cast_nullable_to_non_nullable
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
