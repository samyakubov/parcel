import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../domain/entities/property.dart';
import '../../../../core/utils/date_formatter.dart';
import '../widgets/list_item_card.dart';
import '../widgets/empty_state.dart';
import '../widgets/section_header.dart';

class ViolationsTab extends StatelessWidget {
  final Property property;
  final ScrollController controller;

  const ViolationsTab({
    super.key,
    required this.property,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    if (property.violations.isEmpty) {
      return EmptyState(controller: controller, icon: Icons.gavel_rounded, message: 'No violations recorded.');
    }

    final currencyFormatter = NumberFormat.currency(symbol: '\$', decimalDigits: 0);

    return ListView.builder(
      controller: controller,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      itemCount: property.violations.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return const SectionHeader(
            title: 'Property Violations',
            subtitle: 'Outstanding and historical legal violations.',
          );
        }

        final v = property.violations[index - 1];
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
