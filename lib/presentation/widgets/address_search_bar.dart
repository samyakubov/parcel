import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/constants.dart';
import '../../core/utils/address_normalizer.dart';
import '../../domain/entities/address_suggestion.dart';
import '../viewmodels/autocomplete_viewmodel.dart';
import '../viewmodels/property_search_viewmodel.dart';

class AddressSearchBar extends ConsumerStatefulWidget {
  final MapboxMap? mapboxMap;
  final VoidCallback? onAutocompleteNavigating;

  const AddressSearchBar({super.key, this.mapboxMap, this.onAutocompleteNavigating});

  @override
  ConsumerState<AddressSearchBar> createState() => _AddressSearchBarState();
}

class _AddressSearchBarState extends ConsumerState<AddressSearchBar> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onSuggestionTap(AddressSuggestion suggestion) {
    _controller.text = suggestion.fullName;
    _focusNode.unfocus();
    ref.read(autocompleteViewModelProvider.notifier).dismiss();
    if (widget.mapboxMap != null) {
      widget.onAutocompleteNavigating?.call();
      ref
          .read(autocompleteViewModelProvider.notifier)
          .selectSuggestion(suggestion, widget.mapboxMap!, ref);
    }
  }

  void _onSearch() {
    if (_controller.text.isNotEmpty) {
      final streetAddress = AddressNormalizer.streetOnly(_controller.text);
      _focusNode.unfocus();
      ref.read(autocompleteViewModelProvider.notifier).dismiss();
      ref
          .read(propertySearchViewModelProvider.notifier)
          .searchByAddress(streetAddress);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final autocompleteState = ref.watch(autocompleteViewModelProvider);

    ref.listen<AutocompleteState>(autocompleteViewModelProvider, (previous, next) {
      if (next is AutocompleteError && next.kind == AutocompleteErrorKind.retrieveFailed) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not load location details.')),
        );
      }
    });

    final showDropdown = autocompleteState is! AutocompleteIdle;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Search bar
        Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: theme.brightness == Brightness.light
                    ? Colors.black12
                    : Colors.black.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            textInputAction: TextInputAction.search,
            onSubmitted: (_) => _onSearch(),
            onChanged: (value) {
              ref.read(autocompleteViewModelProvider.notifier).onQueryChanged(value);
            },
            style: TextStyle(color: theme.colorScheme.onSurface),
            decoration: InputDecoration(
              hintText: 'Search address...',
              hintStyle: TextStyle(color: theme.colorScheme.onSurface.withOpacity(0.5)),
              prefixIcon: Icon(Icons.search, color: theme.colorScheme.onSurface.withOpacity(0.6)),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            ),
          ),
        ),

        // Dropdown
        if (showDropdown) ...[
          const SizedBox(height: 8),
          LimitedBox(
            maxHeight: 300,
            child: Material(
              elevation: 6,
              borderRadius: BorderRadius.circular(16),
              color: theme.colorScheme.surface,
              shadowColor: Colors.black.withOpacity(0.15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SingleChildScrollView(
                  child: _SuggestionListContent(
                    state: autocompleteState,
                    onSuggestionTap: _onSuggestionTap,
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// _SuggestionListContent
// ---------------------------------------------------------------------------

class _SuggestionListContent extends StatelessWidget {
  final AutocompleteState state;
  final void Function(AddressSuggestion) onSuggestionTap;

  const _SuggestionListContent({
    required this.state,
    required this.onSuggestionTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (state is AutocompleteLoading) {
      return Shimmer.fromColors(
        baseColor: theme.colorScheme.surfaceContainerHighest,
        highlightColor: theme.colorScheme.surfaceContainerLow,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (i) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Container(width: 36, height: 36, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8))),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(height: 13, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6))),
                      const SizedBox(height: 7),
                      Container(height: 11, width: 120, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6))),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ),
      );
    }

    if (state is AutocompleteEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Row(
          children: [
            Icon(Icons.search_off, color: theme.colorScheme.onSurfaceVariant, size: 20),
            const SizedBox(width: 12),
            Text('No results found', style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
          ],
        ),
      );
    }

    if (state is AutocompleteError) {
      final kind = (state as AutocompleteError).kind;
      final message = kind == AutocompleteErrorKind.auth ? 'Search unavailable.' : 'Could not load suggestions.';
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Row(
          children: [
            Icon(Icons.error_outline, color: theme.colorScheme.error, size: 20),
            const SizedBox(width: 12),
            Text(message, style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.error)),
          ],
        ),
      );
    }

    if (state is AutocompleteResults) {
      final suggestions = (state as AutocompleteResults).suggestions;
      final itemCount = suggestions.length.clamp(0, AppConstants.autocompleteMaxResults);
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          for (int i = 0; i < itemCount; i++) ...[
            if (i > 0)
              Divider(height: 1, indent: 64, color: theme.colorScheme.outlineVariant.withOpacity(0.5)),
            _SuggestionTile(suggestion: suggestions[i], onTap: onSuggestionTap),
          ],
          const SizedBox(height: 8),
        ],
      );
    }

    return const SizedBox.shrink();
  }
}

class _SuggestionTile extends StatelessWidget {
  final AddressSuggestion suggestion;
  final void Function(AddressSuggestion) onTap;

  const _SuggestionTile({required this.suggestion, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final parts = suggestion.fullName.split(',');
    final street = parts[0].trim();
    final secondary = parts.length > 1 ? parts.sublist(1).join(',').trim() : suggestion.context;

    return Semantics(
      label: suggestion.fullName,
      child: InkWell(
        onTap: () => onTap(suggestion),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Container(
                width: 36, height: 36,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.location_on, size: 18, color: theme.colorScheme.primary),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(street, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600), maxLines: 1, overflow: TextOverflow.ellipsis),
                    if (secondary != null && secondary.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(secondary, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant), maxLines: 1, overflow: TextOverflow.ellipsis),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
