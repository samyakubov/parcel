import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

import '../../../core/utils/address_normalizer.dart';
import '../../../core/theme/app_theme.dart';
import '../../../domain/entities/address_suggestion.dart';
import '../../viewmodels/autocomplete_viewmodel.dart';
import '../../viewmodels/property_search_viewmodel.dart';
import 'search_suggestion_list.dart';

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
  bool _isBblMode = false;

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
      _focusNode.unfocus();
      ref.read(autocompleteViewModelProvider.notifier).dismiss();
      
      if (_isBblMode) {
        ref.read(propertySearchViewModelProvider.notifier).searchByBbl(_controller.text);
      } else {
        final streetAddress = AddressNormalizer.streetOnly(_controller.text);
        ref.read(propertySearchViewModelProvider.notifier).searchByAddress(streetAddress);
      }
    }
  }

  void _toggleMode(bool isBbl) {
    setState(() {
      _isBblMode = isBbl;
      _controller.clear();
      ref.read(autocompleteViewModelProvider.notifier).dismiss();
    });
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

    final showDropdown = !_isBblMode && autocompleteState is! AutocompleteIdle;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            // Search bar
            Expanded(
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
                    if (!_isBblMode) {
                      ref.read(autocompleteViewModelProvider.notifier).onQueryChanged(value);
                    }
                  },
                  keyboardType: _isBblMode ? TextInputType.number : TextInputType.text,
                  style: TextStyle(color: theme.colorScheme.onSurface),
                  decoration: InputDecoration(
                    hintText: _isBblMode ? 'BBL...' : 'Search address...',
                    hintStyle: TextStyle(
                      color: theme.colorScheme.onSurface.withOpacity(0.5),
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(
                      Icons.search, 
                      color: theme.colorScheme.goldAccent,
                      size: 20,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            // Mode Toggle
            Container(
              padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: theme.colorScheme.goldAccent,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _ModeButton(
                    icon: Icons.map_rounded,
                    isActive: !_isBblMode,
                    onTap: () => _toggleMode(false),
                  ),
                  _ModeButton(
                    icon: Icons.pin_drop_rounded,
                    isActive: _isBblMode,
                    onTap: () => _toggleMode(true),
                  ),
                ],
              ),
            ),
          ],
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
                  child: SearchSuggestionList(
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

class _ModeButton extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  const _ModeButton({
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isActive ? Colors.white.withOpacity(0.4) : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 18,
          color: isActive ? Colors.white : Colors.white.withOpacity(0.6),
        ),
      ),
    );
  }
}
