import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../domain/entities/property.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/theme/app_theme.dart';
import '../widgets/info_card.dart';
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
    final currencyFormatter = NumberFormat.currency(symbol: '\$', decimalDigits: 0);
    final numberFormatter = NumberFormat.decimalPattern();
    final zoning = property.zoning;

    final lastSoldPrice = property.lastSold?.lastSoldPrice;
    final lastSoldDate = property.lastSold?.lastSoldDate;
    final yearBuilt = property.lastSold?.yearBuilt;
    final landSqft = property.lastSold?.landSqft;
    final grossSqft = property.lastSold?.grossSqft;
    final info = property.propertyInfo;

    return ListView(
      controller: controller,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      children: [
        if (info != null) ...[
          const SectionHeader(
            title: 'Property Info',
            subtitle: 'Building and lot characteristics.',
          ),
          InfoCard(
            children: [
              DetailGrid(items: [
                if (info.propertyType != null)
                  DetailItem('PROPERTY TYPE', info.propertyType!),
                if (info.bbl != null)
                  DetailItem('BBL', info.bbl!),
                if (info.floors != null)
                  DetailItem('FLOORS', info.floors!.toStringAsFixed(info.floors! % 1 == 0 ? 0 : 1)),
                if (info.resUnits != null)
                  DetailItem('RES UNITS', info.resUnits!.toString()),
                if (info.totalUnits != null)
                  DetailItem('TOTAL UNITS', info.totalUnits!.toString()),
                if (info.lotFront != null && info.lotDepth != null)
                  DetailItem('LOT DIMS', '${_fmtDim(info.lotFront!)} × ${_fmtDim(info.lotDepth!)}'),
                if (info.bldgFront != null && info.bldgDepth != null)
                  DetailItem('BLDG DIMS', '${_fmtDim(info.bldgFront!)} × ${_fmtDim(info.bldgDepth!)}'),
              ]),
            ],
          ),
        ],

        const SectionHeader(
          title: 'Market Overview',
          subtitle: 'Key metrics and recent assessment data.',
        ),
        
        InfoCard(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Last Sold Price',
                  style: TextStyle(
                    color: theme.colorScheme.secondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  lastSoldPrice != null ? currencyFormatter.format(lastSoldPrice) : 'N/A',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                    color: theme.colorScheme.goldAccent,
                    letterSpacing: -1.5,
                  ),
                ),
              ],
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Divider(height: 1, color: theme.dividerColor),
            ),
            
            // Grid metrics
            DetailGrid(items: [
              DetailItem('SOLD DATE', DateFormatter.format(lastSoldDate)),
              DetailItem('YEAR BUILT', yearBuilt?.toString() ?? 'N/A'),
              DetailItem('LAND SIZE', landSqft != null ? '${numberFormatter.format(landSqft)} SqFt' : 'N/A'),
              DetailItem('GROSS AREA', grossSqft != null ? '${numberFormatter.format(grossSqft)} SqFt' : 'N/A'),
            ]),
          ],
        ),

        // Zoning Section
        if (zoning != null && (zoning.zoningDistricts.isNotEmpty || zoning.commercialOverlays.isNotEmpty || zoning.specialDistricts.isNotEmpty || (zoning.limitedHeightDistrict != null && zoning.limitedHeightDistrict!.isNotEmpty))) ...[
          const SectionHeader(
            title: 'Zoning & Land Use',
            subtitle: 'Zoning districts and classification data.',
          ),
          
          if (zoning.zoningDistricts.isNotEmpty)
            _buildZoningCard(
              context,
              title: 'Zoning Districts',
              codes: zoning.zoningDistricts,
            ),
          
          if (zoning.commercialOverlays.isNotEmpty)
            _buildZoningCard(
              context,
              title: 'Commercial Overlays',
              codes: zoning.commercialOverlays,
            ),
          
          if (zoning.specialDistricts.isNotEmpty)
            _buildZoningCard(
              context,
              title: 'Special Districts',
              codes: zoning.specialDistricts,
            ),
          
          if (zoning.limitedHeightDistrict != null && zoning.limitedHeightDistrict!.isNotEmpty)
            _buildZoningCard(
              context,
              title: 'Limited Height District',
              codes: [zoning.limitedHeightDistrict!],
            ),

          if (zoning.lastUpdated != null && zoning.lastUpdated!.isNotEmpty) ...[
            const SizedBox(height: 12),
            Center(
              child: Text(
                'Zoning Last Updated: ${zoning.lastUpdated}',
                style: TextStyle(
                  color: theme.colorScheme.secondary.withOpacity(0.5),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ],
        const SizedBox(height: 24),
      ],
    );
  }

  String _fmtDim(double v) => v % 1 == 0 ? v.toInt().toString() : v.toString();

  Widget _buildZoningCard(BuildContext context, {
    required String title,
    required List<String> codes,
  }) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 12),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: theme.colorScheme.secondary,
              letterSpacing: 0.5,
            ),
          ),
        ),
        InfoCard(
          children: [
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: codes.map((code) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: theme.brightness == Brightness.light ? Colors.grey.shade50 : theme.dividerColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: theme.colorScheme.cardBorder),
                ),
                child: Text(
                  code,
                  style: TextStyle(
                    color: theme.colorScheme.onSurface,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    letterSpacing: 0.5,
                  ),
                ),
              )).toList(),
            ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
