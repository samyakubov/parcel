import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/property.dart';
import '../../domain/repositories/property_repository.dart';
import '../../data/repositories/property_repository_impl.dart';

final propertySearchViewModelProvider = NotifierProvider<PropertySearchViewModel, AsyncValue<Property?>>(PropertySearchViewModel.new);

class PropertySearchViewModel extends Notifier<AsyncValue<Property?>> {
  @override
  AsyncValue<Property?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> _performSearch(Future<Property> Function(PropertyRepository) searchCall) async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(propertyRepositoryProvider);
      final property = await searchCall(repository);
      state = AsyncValue.data(property);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> searchByAddress(String address) async {
    await _performSearch((repo) => repo.searchByAddress(address));
  }

  Future<void> searchByBbl(String bbl) async {
    await _performSearch((repo) => repo.searchByBbl(bbl));
  }

  Future<void> searchByFuzzyCoords(double lat, double lng) async {
    await _performSearch((repo) => repo.searchByFuzzyCoords(lat, lng));
  }

  void clearSearch() {
    state = const AsyncValue.data(null);
  }
}
