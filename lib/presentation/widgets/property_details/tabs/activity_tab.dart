import 'package:flutter/material.dart';
import '../../../../domain/entities/property.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/utils/property_formatters.dart';
import '../../../../core/theme/app_theme.dart';
import '../widgets/list_item_card.dart';
import '../widgets/section_header.dart';
import '../widgets/detail_grid.dart';
import '../widgets/empty_state.dart';

class ActivityTab extends StatelessWidget {
  final Property property;
  final ScrollController controller;

  const ActivityTab({super.key, required this.property, required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final info = property.propertyInfo;
    final zoning = property.zoning;
    final records = property.records;

    final hasZoning = zoning != null && (
      zoning.zoningDistricts.isNotEmpty ||
      zoning.commercialOverlays.isNotEmpty ||
      zoning.specialDistricts.isNotEmpty ||
      (zoning.limitedHeightDistrict?.isNotEmpty ?? false)
    );

    final infoItems = [
      if (info?.propertyType != null) DetailItem('Property Type', info!.propertyType!),
      if (info?.floors != null) DetailItem('Floors', info!.floors!.toStringAsFixed(info.floors! % 1 == 0 ? 0 : 1)),
      if (info?.resUnits != null) DetailItem('Res Units', info!.resUnits!.toString()),
      if (info?.totalUnits != null) DetailItem('Total Units', info!.totalUnits!.toString()),
    ];

    final hasInfo = infoItems.isNotEmpty;

    if (!hasInfo && !hasZoning && records.isEmpty) {
      return EmptyState(
        controller: controller,
        icon: Icons.history_rounded,
        message: 'No records available.',
      );
    }

    return ListView.builder(
      controller: controller,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      itemCount: _itemCount(hasInfo, hasZoning, zoning, records),
      itemBuilder: (context, index) => _buildItem(context, theme, index, hasInfo, infoItems, hasZoning, zoning, records),
    );
  }

  int _itemCount(bool hasInfo, bool hasZoning, dynamic zoning, List<Map<String, dynamic>> records) {
    int count = 0;
    if (hasInfo) count += 2; // header + grid
    if (hasZoning) {
      if (zoning.zoningDistricts.isNotEmpty) count++;
      if (zoning.commercialOverlays.isNotEmpty) count++;
      if (zoning.specialDistricts.isNotEmpty) count++;
      if (zoning.limitedHeightDistrict?.isNotEmpty ?? false) count++;
      if (zoning.lastUpdated?.isNotEmpty ?? false) count++;
    }
    if (records.isNotEmpty) count += 1 + records.length; // header + records
    return count;
  }

  Widget _buildItem(BuildContext context, ThemeData theme, int index,
      bool hasInfo, List<DetailItem> infoItems, bool hasZoning, dynamic zoning,
      List<Map<String, dynamic>> records) {
    int cursor = 0;

    if (hasInfo) {
      if (index == cursor) {
        return const SectionHeader(
          title: 'Property Info',
          subtitle: 'Building, lot, and zoning characteristics.',
        );
      }
      cursor++;
      if (index == cursor) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: DetailGrid(items: infoItems),
        );
      }
      cursor++;
    }

    if (hasZoning) {
      final zoningRows = <Widget>[];
      if (zoning.zoningDistricts.isNotEmpty) zoningRows.add(_zoningRow(context, 'Zoning Districts', zoning.zoningDistricts));
      if (zoning.commercialOverlays.isNotEmpty) zoningRows.add(_zoningRow(context, 'Commercial Overlays', zoning.commercialOverlays));
      if (zoning.specialDistricts.isNotEmpty) zoningRows.add(_zoningRow(context, 'Special Districts', zoning.specialDistricts));
      if (zoning.limitedHeightDistrict?.isNotEmpty ?? false) zoningRows.add(_zoningRow(context, 'Limited Height District', [zoning.limitedHeightDistrict!]));
      if (zoning.lastUpdated?.isNotEmpty ?? false) {
        zoningRows.add(Text(
          'Zoning last updated ${zoning.lastUpdated}',
          style: TextStyle(
            color: theme.colorScheme.secondary.withValues(alpha: 0.5),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ));
      }

      final zoningCount = zoningRows.length;
      if (index < cursor + zoningCount) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: zoningRows[index - cursor],
        );
      }
      cursor += zoningCount;
    }

    if (records.isNotEmpty) {
      if (index == cursor) {
        return const SectionHeader(
          title: 'Property Records',
          subtitle: 'Historical property and ownership data records.',
        );
      }
      cursor++;
      final record = records[index - cursor];
      final type = record['partytype_desc']?.toString() ?? 'Record';
      final partyName = record['party_name']?.toString() ?? '—';
      final amount = record['amount'] is num ? (record['amount'] as num).toDouble() : 0.0;
      final date = record['record_filed']?.toString() ?? '';
      return ListItemCard(
        title: type,
        subtitle: partyName,
        date: DateFormatter.format(date),
        amount: amount > 0 ? currencyFmt.format(amount) : null,
        color: Theme.of(context).colorScheme.accentColor,
      );
    }

    return const SizedBox.shrink();
  }

  Widget _zoningRow(BuildContext context, String title, List<String> codes) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: theme.colorScheme.accentColor,
              letterSpacing: 0.5,
            ),
          ),
        ),
        Text(
          codes.join(', '),
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
