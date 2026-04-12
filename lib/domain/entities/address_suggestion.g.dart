// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'address_suggestion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddressSuggestion _$AddressSuggestionFromJson(Map<String, dynamic> json) =>
    _AddressSuggestion(
      mapboxId: json['mapbox_id'] as String,
      fullName: json['full_name'] as String,
      context: json['context'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AddressSuggestionToJson(_AddressSuggestion instance) =>
    <String, dynamic>{
      'mapbox_id': instance.mapboxId,
      'full_name': instance.fullName,
      'context': instance.context,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
