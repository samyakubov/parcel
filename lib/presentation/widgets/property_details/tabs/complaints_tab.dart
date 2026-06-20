import 'package:flutter/material.dart';
import '../../../../domain/entities/property.dart';
import '../../../../core/utils/date_formatter.dart';
import '../widgets/status_tag.dart';
import '../widgets/detail_grid.dart';
import '../widgets/empty_state.dart';
import '../widgets/section_header.dart';

class ComplaintsTab extends StatelessWidget {
  final Property property;
  final ScrollController controller;

  const ComplaintsTab({
    super.key,
    required this.property,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    if (property.complaints.isEmpty) {
      return EmptyState(controller: controller, icon: Icons.verified_user_rounded, message: 'No complaints recorded.');
    }

    return ListView.builder(
      controller: controller,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      itemCount: property.complaints.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return const SectionHeader(
            title: 'Property Complaints',
            subtitle: 'Formal complaints lodged against the property.',
          );
        }

        final c = property.complaints[index - 1];
        final number = c['complaint_number']?.toString() ?? '—';
        final category = c['complaint_category']?.toString() ?? 'Complaint';
        final status = c['status']?.toString() ?? '—';
        final isClosed = status.toLowerCase().contains('closed');

        return Column(
          children: [
            Theme(
              data: theme.copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                tilePadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                childrenPadding: EdgeInsets.zero,
                iconColor: theme.colorScheme.secondary,
                collapsedIconColor: theme.colorScheme.secondary.withOpacity(0.5),
                title: Text(
                  category,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                subtitle: Text(
                  '#$number',
                  style: TextStyle(
                    fontSize: 12,
                    color: theme.colorScheme.secondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: StatusTag(status: status, isPositive: isClosed),
                children: [
                  Container(
                    width: double.infinity,
                    color: isDark ? theme.dividerColor.withValues(alpha: 0.3) : Colors.grey.shade50,
                    padding: const EdgeInsets.all(20),
                    child: DetailGrid(items: [
                      if (c['inspection_date'] != null) DetailItem('Inspection', DateFormatter.format(c['inspection_date'])),
                      if (c['disposition_date'] != null) DetailItem('Disposition', DateFormatter.format(c['disposition_date'])),
                      if (c['disposition_code'] != null) DetailItem('Code', c['disposition_code']),
                      if (c['bin'] != null) DetailItem('BIN', c['bin']),
                    ]),
                  ),
                ],
              ),
            ),
            Divider(height: 1, color: theme.dividerColor),
          ],
        );
      },
    );
  }
}
