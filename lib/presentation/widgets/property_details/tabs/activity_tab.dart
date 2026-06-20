import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../domain/entities/property.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/theme/app_theme.dart';
import '../widgets/list_item_card.dart';
import '../widgets/property_list_tab.dart';

class ActivityTab extends StatelessWidget {
  final Property property;
  final ScrollController controller;

  const ActivityTab({super.key, required this.property, required this.controller});

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(symbol: '\$', decimalDigits: 0);
    return PropertyListTab(
      items: property.records,
      controller: controller,
      emptyIcon: Icons.history_rounded,
      emptyMessage: 'No activity records available.',
      sectionTitle: 'Record Activity',
      sectionSubtitle: 'Historical property and ownership data records.',
      buildItem: (context, record) {
        final type = record['partytype_desc']?.toString() ?? 'Record';
        final partyName = record['party_name']?.toString() ?? '—';
        final amount = record['amount'] is num ? (record['amount'] as num).toDouble() : 0.0;
        final date = record['record_filed']?.toString() ?? '';
        return ListItemCard(
          title: type,
          subtitle: partyName,
          date: DateFormatter.format(date),
          amount: amount > 0 ? currencyFormatter.format(amount) : null,
          color: Theme.of(context).colorScheme.goldAccent,
        );
      },
    );
  }
}
