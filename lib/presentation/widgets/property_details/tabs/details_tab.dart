import 'package:flutter/material.dart';
import '../../../../domain/entities/property.dart';
import '../../../../core/theme/app_theme.dart';
import '../widgets/detail_grid.dart';
import '../widgets/section_header.dart';

class DetailsTab extends StatelessWidget {
  final Property property;
  final ScrollController controller;

  const DetailsTab({
    super.key,
    required this.property,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final zoning = property.zoning;
    final info = property.propertyInfo;

    return ListView(
      controller: controller,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      children: [
        const SectionHeader(
          title: 'Property Info',
          subtitle: 'Building, lot, and zoning characteristics.',
        ),
        if (info != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: DetailGrid(items: [
              if (info.propertyType != null)
                DetailItem('Property Type', info.propertyType!),
              if (info.floors != null)
                DetailItem('Floors', info.floors!.toStringAsFixed(info.floors! % 1 == 0 ? 0 : 1)),
              if (info.resUnits != null)
                DetailItem('Res Units', info.resUnits!.toString()),
              if (info.totalUnits != null)
                DetailItem('Total Units', info.totalUnits!.toString()),
            ]),
          ),
        if (zoning != null && (zoning.zoningDistricts.isNotEmpty || zoning.commercialOverlays.isNotEmpty || zoning.specialDistricts.isNotEmpty || (zoning.limitedHeightDistrict != null && zoning.limitedHeightDistrict!.isNotEmpty))) ...[
          if (zoning.zoningDistricts.isNotEmpty)
            _buildZoningCard(context, title: 'Zoning Districts', codes: zoning.zoningDistricts),
          if (zoning.commercialOverlays.isNotEmpty)
            _buildZoningCard(context, title: 'Commercial Overlays', codes: zoning.commercialOverlays),
          if (zoning.specialDistricts.isNotEmpty)
            _buildZoningCard(context, title: 'Special Districts', codes: zoning.specialDistricts),
          if (zoning.limitedHeightDistrict != null && zoning.limitedHeightDistrict!.isNotEmpty)
            _buildZoningCard(context, title: 'Limited Height District', codes: [zoning.limitedHeightDistrict!]),
          if (zoning.lastUpdated != null && zoning.lastUpdated!.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              'Zoning last updated ${zoning.lastUpdated}',
              style: TextStyle(
                color: theme.colorScheme.secondary.withValues(alpha: 0.5),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildZoningCard(BuildContext context, {
    required String title,
    required List<String> codes,
  }) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
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
