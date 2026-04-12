import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../domain/entities/property.dart';
import '../../../../core/utils/date_formatter.dart';
import '../widgets/list_item_card.dart';
import '../widgets/empty_state.dart';
import '../widgets/section_header.dart';

class ActivityTab extends StatelessWidget {
  final Property property;
  final ScrollController controller;

  const ActivityTab({
    super.key,
    required this.property,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    if (property.records.isEmpty) {
      return EmptyState(controller: controller, icon: Icons.history_rounded, message: 'No activity records available.');
    }

    final currencyFormatter = NumberFormat.currency(symbol: '\$', decimalDigits: 0);

    return ListView.builder(
      controller: controller,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      itemCount: property.records.length + 1, // +1 for the header
      itemBuilder: (context, index) {
        if (index == 0) {
          return const SectionHeader(
            title: 'Record Activity',
            subtitle: 'Historical property and ownership data records.',
          );
        }
        
        final record = property.records[index - 1];
        final type = record['partytype_desc']?.toString() ?? 'Record';
        final partyName = record['party_name']?.toString() ?? '—';
        final amount = record['amount'] is num ? (record['amount'] as num).toDouble() : 0.0;
        final date = record['record_filed']?.toString() ?? '';

        return ListItemCard(
          title: type,
          subtitle: partyName,
          date: DateFormatter.format(date),
          amount: amount > 0 ? currencyFormatter.format(amount) : null,
          icon: Icons.description_outlined,
          color: Colors.blue,
        );
      },
    );
  }
}
