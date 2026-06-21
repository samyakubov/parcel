import 'package:flutter/material.dart';
import '../../../../domain/entities/property.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/utils/property_formatters.dart';
import '../../../../core/theme/app_theme.dart';
import '../widgets/section_header.dart';
import '../widgets/empty_state.dart';

class ActivityTab extends StatelessWidget {
  final Property property;
  final ScrollController controller;

  const ActivityTab({super.key, required this.property, required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final records = property.records;

    if (records.isEmpty) {
      return EmptyState(
        controller: controller,
        icon: Icons.history_rounded,
        message: 'No records available.',
      );
    }

    return ListView(
      controller: controller,
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 40),
      children: [
        const SectionHeader(
          title: 'Property Records',
          subtitle: 'Historical property and ownership data records.',
        ),
        _buildTimeline(theme, records),
      ],
    );
  }

  Widget _buildTimeline(ThemeData theme, List<Map<String, dynamic>> records) {
    final accent = theme.colorScheme.accentColor;
    final lineColor = theme.dividerColor;

    return Column(
      children: List.generate(records.length, (i) {
        final record = records[i];
        final isLast = i == records.length - 1;
        final type = record['partytype_desc']?.toString() ?? 'Record';
        final partyName = record['party_name']?.toString() ?? '—';
        final amount = record['amount'] is num ? (record['amount'] as num).toDouble() : 0.0;
        final date = record['record_filed']?.toString() ?? '';
        final formattedDate = DateFormatter.format(date);
        final formattedAmount = amount > 0 ? currencyFmt.format(amount) : null;

        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 24,
                child: Column(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      margin: const EdgeInsets.only(top: 4),
                      decoration: BoxDecoration(
                        color: accent,
                        shape: BoxShape.circle,
                      ),
                    ),
                    if (!isLast)
                      Expanded(
                        child: Container(width: 2, color: lineColor),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: isLast ? 0 : 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              type,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: theme.colorScheme.onSurface,
                              ),
                            ),
                          ),
                          if (formattedAmount != null) ...[
                            const SizedBox(width: 8),
                            Text(
                              formattedAmount,
                              style: TextStyle(
                                color: accent,
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 3),
                      Text(
                        partyName,
                        style: TextStyle(
                          color: theme.colorScheme.secondary,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      if (formattedDate.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          formattedDate,
                          style: TextStyle(
                            color: theme.colorScheme.secondary.withValues(alpha: 0.6),
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
