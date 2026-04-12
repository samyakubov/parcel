import 'package:flutter/material.dart';
import '../../../../domain/entities/property.dart';
import '../widgets/empty_state.dart';
import '../widgets/timeline_entry.dart';

class OwnersTab extends StatelessWidget {
  final Property property;
  final ScrollController controller;

  const OwnersTab({
    super.key,
    required this.property,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final currentOwners = property.owners?.currentOwners ?? [];
    final previousOwners = property.owners?.previousOwners ?? [];

    if (currentOwners.isEmpty && previousOwners.isEmpty) {
      return EmptyState(controller: controller, icon: Icons.people_outline_rounded, message: 'No ownership records found.');
    }

    return ListView(
      controller: controller,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ownership History',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.black87),
              ),
              const SizedBox(height: 4),
              Text(
                'Showing timeline from most recent to earliest.',
                style: TextStyle(color: Colors.grey.shade500, fontSize: 13, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),

        // Current owners
        if (currentOwners.isNotEmpty) ...[
          ...currentOwners.asMap().entries.map((entry) {
            final i = entry.key;
            final owner = entry.value;
            return TimelineEntry(
              name: owner,
              label: 'Current Owner',
              isFirst: i == 0,
              isLast: false,
              isCurrent: true,
            );
          }),
        ],

        // Previous owners
        if (previousOwners.isNotEmpty) ...[
          ...previousOwners.asMap().entries.map((entry) {
            final i = entry.key;
            final owner = entry.value;
            return TimelineEntry(
              name: owner,
              label: 'Previous Owner',
              isFirst: false,
              isLast: i == previousOwners.length - 1,
              isCurrent: false,
            );
          }),
        ],
        const SizedBox(height: 24),
      ],
    );
  }
}
