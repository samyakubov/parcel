import 'package:flutter/material.dart';

import '../../../domain/entities/address_suggestion.dart';
import '../../../core/theme/app_theme.dart';

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
                  color: theme.colorScheme.accentColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.location_on, size: 18, color: theme.colorScheme.accentColor),
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
