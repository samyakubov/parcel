import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../domain/entities/property.dart';
import '../../../../core/utils/date_formatter.dart';
import '../widgets/list_item_card.dart';
import '../widgets/property_list_tab.dart';

class ViolationsTab extends StatelessWidget {
  final Property property;
  final ScrollController controller;

  const ViolationsTab({super.key, required this.property, required this.controller});

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(symbol: '\$', decimalDigits: 0);
    return PropertyListTab(
      items: property.violations,
      controller: controller,
      emptyIcon: Icons.gavel_rounded,
      emptyMessage: 'No violations recorded.',
      sectionTitle: 'Property Violations',
      sectionSubtitle: 'Outstanding and historical legal violations.',
      buildItem: (context, v) {
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
          amount: amount > 0 ? 'Fine: ${currencyFormatter.format(amount)}' : null,
          status: status,
          isStatusPositive: isClosed,
          icon: Icons.gavel_outlined,
          color: Colors.red,
        );
      },
    );
  }
}
