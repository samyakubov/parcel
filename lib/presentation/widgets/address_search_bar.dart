import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

import '../../core/constants.dart';
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
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _removeOverlay();
    _focusNode.removeListener(_onFocusChanged);
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onFocusChanged() {
    if (!_focusNode.hasFocus) {
      _removeOverlay();
    }
  }

  void _insertOverlay(AutocompleteState state) {
    _removeOverlay();
    final overlay = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => CompositedTransformFollower(
        link: _layerLink,
        showWhenUnlinked: false,
        offset: const Offset(0, 56), // below the search bar
        child: Align(
          alignment: Alignment.topLeft,
          child: TapRegion(
            onTapOutside: (_) {
              ref.read(autocompleteViewModelProvider.notifier).dismiss();
            },
            child: _SuggestionList(
              state: state,
              onSuggestionTap: _onSuggestionTap,
            ),
          ),
        ),
      ),
    );
    overlay.insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _onSuggestionTap(AddressSuggestion suggestion) {
    _controller.text = suggestion.fullName;
    ref.read(autocompleteViewModelProvider.notifier).dismiss();
    _removeOverlay();
    if (widget.mapboxMap != null) {
      widget.onAutocompleteNavigating?.call();
      ref
          .read(autocompleteViewModelProvider.notifier)
          .selectSuggestion(suggestion, widget.mapboxMap!, ref);
    }
  }

  void _onSearch() {
    if (_controller.text.isNotEmpty) {
      final text = _controller.text;
      final streetAddress = text.contains(',') ? text.split(',')[0].trim() : text;
      ref
          .read(propertySearchViewModelProvider.notifier)
          .searchByAddress(streetAddress);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Listen for autocomplete state changes to show/hide overlay and snackbar.
    ref.listen<AutocompleteState>(autocompleteViewModelProvider,
        (previous, next) {
      if (next is AutocompleteError &&
          next.kind == AutocompleteErrorKind.retrieveFailed) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not load location details.'),
          ),
        );
        _removeOverlay();
        return;
      }

      if (next is AutocompleteIdle) {
        _removeOverlay();
      } else {
        _insertOverlay(next);
      }
    });

    return CompositedTransformTarget(
      link: _layerLink,
      child: Container(
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
            ref
                .read(autocompleteViewModelProvider.notifier)
                .onQueryChanged(value);
          },
          style: TextStyle(color: theme.colorScheme.onSurface),
          decoration: InputDecoration(
            hintText: 'Search address...',
            hintStyle: TextStyle(
                color: theme.colorScheme.onSurface.withOpacity(0.5)),
            prefixIcon: Icon(Icons.search,
                color: theme.colorScheme.onSurface.withOpacity(0.6)),
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            suffixIcon: null,
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _SuggestionList
// ---------------------------------------------------------------------------

class _SuggestionList extends StatelessWidget {
  final AutocompleteState state;
  final void Function(AddressSuggestion) onSuggestionTap;

  const _SuggestionList({
    required this.state,
    required this.onSuggestionTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget content;

    if (state is AutocompleteLoading) {
      content = const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(child: CircularProgressIndicator()),
      );
    } else if (state is AutocompleteEmpty) {
      content = const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('No results found'),
      );
    } else if (state is AutocompleteError) {
      final kind = (state as AutocompleteError).kind;
      final message = kind == AutocompleteErrorKind.auth
          ? 'Search unavailable.'
          : 'Could not load suggestions. Please try again.';
      content = Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(message),
      );
    } else if (state is AutocompleteResults) {
      final suggestions = (state as AutocompleteResults).suggestions;
      final itemCount =
          suggestions.length.clamp(0, AppConstants.autocompleteMaxResults);
      content = ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];
          return Semantics(
            label: suggestion.fullName,
            child: ListTile(
              title: Text(suggestion.fullName),
              subtitle: suggestion.context != null
                  ? Text(suggestion.context!)
                  : null,
              onTap: () => onSuggestionTap(suggestion),
            ),
          );
        },
      );
    } else {
      // AutocompleteIdle — should not normally be shown
      return const SizedBox.shrink();
    }

    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(8),
      color: theme.colorScheme.surface,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: content,
      ),
    );
  }
}
