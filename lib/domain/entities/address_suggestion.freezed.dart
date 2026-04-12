// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_suggestion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddressSuggestion {

 String get mapboxId; String get fullName; String? get context; double? get latitude; double? get longitude;
/// Create a copy of AddressSuggestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressSuggestionCopyWith<AddressSuggestion> get copyWith => _$AddressSuggestionCopyWithImpl<AddressSuggestion>(this as AddressSuggestion, _$identity);

  /// Serializes this AddressSuggestion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressSuggestion&&(identical(other.mapboxId, mapboxId) || other.mapboxId == mapboxId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.context, context) || other.context == context)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mapboxId,fullName,context,latitude,longitude);

@override
String toString() {
  return 'AddressSuggestion(mapboxId: $mapboxId, fullName: $fullName, context: $context, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $AddressSuggestionCopyWith<$Res>  {
  factory $AddressSuggestionCopyWith(AddressSuggestion value, $Res Function(AddressSuggestion) _then) = _$AddressSuggestionCopyWithImpl;
@useResult
$Res call({
 String mapboxId, String fullName, String? context, double? latitude, double? longitude
});




}
/// @nodoc
class _$AddressSuggestionCopyWithImpl<$Res>
    implements $AddressSuggestionCopyWith<$Res> {
  _$AddressSuggestionCopyWithImpl(this._self, this._then);

  final AddressSuggestion _self;
  final $Res Function(AddressSuggestion) _then;

/// Create a copy of AddressSuggestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mapboxId = null,Object? fullName = null,Object? context = freezed,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_self.copyWith(
mapboxId: null == mapboxId ? _self.mapboxId : mapboxId // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,context: freezed == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [AddressSuggestion].
extension AddressSuggestionPatterns on AddressSuggestion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddressSuggestion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddressSuggestion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddressSuggestion value)  $default,){
final _that = this;
switch (_that) {
case _AddressSuggestion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddressSuggestion value)?  $default,){
final _that = this;
switch (_that) {
case _AddressSuggestion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String mapboxId,  String fullName,  String? context,  double? latitude,  double? longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddressSuggestion() when $default != null:
return $default(_that.mapboxId,_that.fullName,_that.context,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String mapboxId,  String fullName,  String? context,  double? latitude,  double? longitude)  $default,) {final _that = this;
switch (_that) {
case _AddressSuggestion():
return $default(_that.mapboxId,_that.fullName,_that.context,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String mapboxId,  String fullName,  String? context,  double? latitude,  double? longitude)?  $default,) {final _that = this;
switch (_that) {
case _AddressSuggestion() when $default != null:
return $default(_that.mapboxId,_that.fullName,_that.context,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddressSuggestion implements AddressSuggestion {
  const _AddressSuggestion({required this.mapboxId, required this.fullName, this.context, this.latitude, this.longitude});
  factory _AddressSuggestion.fromJson(Map<String, dynamic> json) => _$AddressSuggestionFromJson(json);

@override final  String mapboxId;
@override final  String fullName;
@override final  String? context;
@override final  double? latitude;
@override final  double? longitude;

/// Create a copy of AddressSuggestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddressSuggestionCopyWith<_AddressSuggestion> get copyWith => __$AddressSuggestionCopyWithImpl<_AddressSuggestion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddressSuggestionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddressSuggestion&&(identical(other.mapboxId, mapboxId) || other.mapboxId == mapboxId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.context, context) || other.context == context)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mapboxId,fullName,context,latitude,longitude);

@override
String toString() {
  return 'AddressSuggestion(mapboxId: $mapboxId, fullName: $fullName, context: $context, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$AddressSuggestionCopyWith<$Res> implements $AddressSuggestionCopyWith<$Res> {
  factory _$AddressSuggestionCopyWith(_AddressSuggestion value, $Res Function(_AddressSuggestion) _then) = __$AddressSuggestionCopyWithImpl;
@override @useResult
$Res call({
 String mapboxId, String fullName, String? context, double? latitude, double? longitude
});




}
/// @nodoc
class __$AddressSuggestionCopyWithImpl<$Res>
    implements _$AddressSuggestionCopyWith<$Res> {
  __$AddressSuggestionCopyWithImpl(this._self, this._then);

  final _AddressSuggestion _self;
  final $Res Function(_AddressSuggestion) _then;

/// Create a copy of AddressSuggestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mapboxId = null,Object? fullName = null,Object? context = freezed,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_AddressSuggestion(
mapboxId: null == mapboxId ? _self.mapboxId : mapboxId // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,context: freezed == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
