import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/constants.dart';
import '../../../domain/entities/address_suggestion.dart';
import '../../../core/theme/app_theme.dart';

class SearchSuggestionList extends StatelessWidget {
  final AsyncValue<List<AddressSuggestion>?> state;
  final void Function(AddressSuggestion) onSuggestionTap;

  const SearchSuggestionList({
    super.key,
    required this.state,
    required this.onSuggestionTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return state.when(
      data: (suggestions) {
        if (suggestions == null) return const SizedBox.shrink();
        if (suggestions.isEmpty) {
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

        final itemCount = suggestions.length.clamp(0, AppConstants.autocompleteMaxResults);
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            for (int i = 0; i < itemCount; i++) ...[
              if (i > 0)
                Divider(height: 1, indent: 64, color: theme.colorScheme.outlineVariant.withOpacity(0.5)),
              SearchSuggestionTile(suggestion: suggestions[i], onTap: onSuggestionTap),
            ],
            const SizedBox(height: 8),
          ],
        );
      },
      loading: () => Shimmer.fromColors(
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
      ),
      error: (error, stack) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Row(
          children: [
            Icon(Icons.error_outline, color: theme.colorScheme.error, size: 20),
            const SizedBox(width: 12),
            Text('Could not load suggestions.', style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.error)),
          ],
        ),
      ),
    );
  }
}

class SearchSuggestionTile extends StatelessWidget {
  final AddressSuggestion suggestion;
  final void Function(AddressSuggestion) onTap;

  const SearchSuggestionTile({
    super.key,
    required this.suggestion,
    required this.onTap,
  });

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
                  color: theme.colorScheme.goldAccent.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.location_on, size: 18, color: theme.colorScheme.goldAccent),
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
