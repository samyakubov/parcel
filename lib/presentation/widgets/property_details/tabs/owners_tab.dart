import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../domain/entities/property.dart';
import '../../../../core/theme/app_theme.dart';
import '../widgets/empty_state.dart';
import '../widgets/timeline_entry.dart';
import '../widgets/section_header.dart';

class OwnersTab extends ConsumerStatefulWidget {
  final Property property;
  final ScrollController controller;

  const OwnersTab({
    super.key,
    required this.property,
    required this.controller,
  });

  @override
  ConsumerState<OwnersTab> createState() => _OwnersTabState();
}

class _OwnersTabState extends ConsumerState<OwnersTab> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<String> _filterOwners(List<String> owners) {
    final q = _searchQuery.toLowerCase();
    return owners.where((o) => o.toLowerCase().contains(q)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final allCurrentOwners = widget.property.owners?.currentOwners ?? [];
    final allPreviousOwners = widget.property.owners?.previousOwners ?? [];

    if (allCurrentOwners.isEmpty && allPreviousOwners.isEmpty) {
      return EmptyState(
        controller: widget.controller, 
        icon: Icons.people_outline_rounded, 
        message: 'No ownership records found.',
      );
    }

    final filteredCurrentOwners = _filterOwners(allCurrentOwners);
    final filteredPreviousOwners = _filterOwners(allPreviousOwners);

    final hasNoResults = _searchQuery.isNotEmpty && 
                         filteredCurrentOwners.isEmpty && 
                         filteredPreviousOwners.isEmpty;

    return ListView(
      controller: widget.controller,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      children: [
        const SectionHeader(
          title: 'Ownership History',
          subtitle: 'Showing timeline from most recent to earliest.',
        ),

        // Search Bar
        Container(
          margin: const EdgeInsets.only(bottom: 24),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
            ),
          ),
          child: TextField(
            controller: _searchController,
            onChanged: (val) => setState(() => _searchQuery = val),
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
              hintText: 'Search through owners...',
              hintStyle: TextStyle(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                fontSize: 14,
              ),
              prefixIcon: Icon(
                Icons.search_rounded, 
                size: 20, 
                color: theme.colorScheme.accentColor,
              ),
              suffixIcon: _searchQuery.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.close_rounded, size: 18),
                      onPressed: () {
                        _searchController.clear();
                        setState(() => _searchQuery = '');
                      },
                    )
                  : null,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
          ),
        ),

        if (hasNoResults)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
              children: [
                Icon(Icons.person_search_rounded,
                  size: 48,
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.2),
                ),
                const SizedBox(height: 16),
                Text(
                  'No owners match "$_searchQuery"',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          )
        else ...[
          // Current owners
          if (filteredCurrentOwners.isNotEmpty) ...[
            ...filteredCurrentOwners.asMap().entries.map((entry) {
              final i = entry.key;
              final owner = entry.value;
              return TimelineEntry(
                name: owner,
                label: 'Current Owner',
                isFirst: i == 0,
                isLast: filteredPreviousOwners.isEmpty && i == filteredCurrentOwners.length - 1,
                isCurrent: true,
              );
            }),
          ],

          if (filteredPreviousOwners.isNotEmpty) ...[
            ...filteredPreviousOwners.asMap().entries.map((entry) {
              final i = entry.key;
              final owner = entry.value;
              return TimelineEntry(
                name: owner,
                label: 'Previous Owner',
                isFirst: false,
                isLast: i == filteredPreviousOwners.length - 1,
                isCurrent: false,
              );
            }),
          ],
        ],
        const SizedBox(height: 24),
      ],
    );
  }
}
