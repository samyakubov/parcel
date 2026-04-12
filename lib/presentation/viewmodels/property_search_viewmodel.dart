import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/property.dart';
import '../../data/repositories/property_repository_impl.dart';

final propertySearchViewModelProvider = NotifierProvider<PropertySearchViewModel, AsyncValue<Property?>>(PropertySearchViewModel.new);

class PropertySearchViewModel extends Notifier<AsyncValue<Property?>> {
  @override
  AsyncValue<Property?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> searchByAddress(String address) async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(propertyRepositoryProvider);
      final property = await repository.searchByAddress(address);
      state = AsyncValue.data(property);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> searchByFuzzyCoords(double lat, double lng) async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(propertyRepositoryProvider);
      final property = await repository.searchByFuzzyCoords(lat, lng);
      state = AsyncValue.data(property);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  void clearSearch() {
    state = const AsyncValue.data(null);
  }
}
