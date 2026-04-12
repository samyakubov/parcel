import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_suggestion.freezed.dart';
part 'address_suggestion.g.dart';

@freezed
abstract class AddressSuggestion with _$AddressSuggestion {
  const factory AddressSuggestion({
    required String mapboxId,
    required String fullName,
    String? context,
    double? latitude,
    double? longitude,
  }) = _AddressSuggestion;

  factory AddressSuggestion.fromJson(Map<String, Object?> json) =>
      _$AddressSuggestionFromJson(json);
}
