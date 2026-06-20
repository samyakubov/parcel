import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../domain/entities/property.dart';
import '../../../../core/utils/date_formatter.dart';
import '../widgets/list_item_card.dart';
import '../widgets/status_tag.dart';
import '../widgets/detail_grid.dart';
import '../widgets/empty_state.dart';
import '../widgets/section_header.dart';

class IssuesTab extends StatelessWidget {
  final Property property;
  final ScrollController controller;

  const IssuesTab({super.key, required this.property, required this.controller});

  static final _currencyFmt = NumberFormat.currency(symbol: '\$', decimalDigits: 0);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final violations = property.violations;
    final complaints = property.complaints;

    if (violations.isEmpty && complaints.isEmpty) {
      return EmptyState(
        controller: controller,
        icon: Icons.verified_rounded,
        message: 'No issues recorded.',
      );
    }

    final complaintTheme = theme.copyWith(dividerColor: Colors.transparent);

    return ListView(
      controller: controller,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      children: [
        if (violations.isNotEmpty) ...[
          const SectionHeader(
            title: 'Violations',
            subtitle: 'Outstanding and historical legal violations.',
          ),
          ...violations.map((v) {
            final type = v['violation_type']?.toString() ?? 'Violation';
            final status = v['violation_status']?.toString() ?? 'Unknown';
            final desc = v['description']?.toString() ?? '—';
            final amount = v['penalty_amount'] is num ? (v['penalty_amount'] as num).toDouble() : 0.0;
            final date = v['issue_date']?.toString() ?? '';
            final isClosed = status.toLowerCase().contains('close') || status.toLowerCase().contains('resolved');
            return ListItemCard(
              title: type,
              subtitle: desc,
              date: DateFormatter.format(date),
              amount: amount > 0 ? 'Fine: ${_currencyFmt.format(amount)}' : null,
              status: status,
              isStatusPositive: isClosed,
              color: Colors.red,
            );
          }),
        ],
        if (violations.isNotEmpty && complaints.isNotEmpty)
          const SizedBox(height: 16),
        if (complaints.isNotEmpty) ...[
          const SectionHeader(
            title: 'Complaints',
            subtitle: 'Formal complaints lodged against the property.',
          ),
          ...complaints.map((c) => _ComplaintTile(complaint: c, theme: theme, complaintTheme: complaintTheme)),
        ],
      ],
    );
  }
}

class _ComplaintTile extends StatelessWidget {
  final Map<String, dynamic> complaint;
  final ThemeData theme;
  final ThemeData complaintTheme;

  const _ComplaintTile({
    required this.complaint,
    required this.theme,
    required this.complaintTheme,
  });

  @override
  Widget build(BuildContext context) {
    final c = complaint;
    final number = c['complaint_number']?.toString() ?? '—';
    final category = c['complaint_category']?.toString() ?? 'Complaint';
    final status = c['status']?.toString() ?? '—';
    final isClosed = status.toLowerCase().contains('closed');
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      children: [
        Theme(
          data: complaintTheme,
          child: ExpansionTile(
            tilePadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
            childrenPadding: EdgeInsets.zero,
            iconColor: theme.colorScheme.secondary,
            collapsedIconColor: theme.colorScheme.secondary.withValues(alpha: 0.5),
            title: Text(
              category,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15, color: theme.colorScheme.onSurface),
            ),
            subtitle: Text(
              '#$number',
              style: TextStyle(fontSize: 12, color: theme.colorScheme.secondary, fontWeight: FontWeight.w500),
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
                  if (c['disposition_code'] != null) DetailItem('Code', c['disposition_code'].toString()),
                  if (c['bin'] != null) DetailItem('BIN', c['bin'].toString()),
                ]),
              ),
            ],
          ),
        ),
        Divider(height: 1, color: theme.dividerColor),
      ],
    );
  }
}
