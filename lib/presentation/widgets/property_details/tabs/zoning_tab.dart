import 'package:flutter/material.dart';
import '../../../../domain/entities/property.dart';
import '../widgets/info_card.dart';
import '../widgets/empty_state.dart';

class ZoningTab extends StatelessWidget {
  final Property property;
  final ScrollController controller;

  const ZoningTab({
    super.key,
    required this.property,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final zoning = property.zoning;
    
    if (zoning == null || (zoning.zoningDistricts.isEmpty && zoning.commercialOverlays.isEmpty && zoning.specialDistricts.isEmpty && (zoning.limitedHeightDistrict == null || zoning.limitedHeightDistrict!.isEmpty))) {
      return EmptyState(controller: controller, icon: Icons.map_outlined, message: 'No zoning information available for this property.');
    }

    return ListView(
      controller: controller,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      children: [
        if (zoning.zoningDistricts.isNotEmpty)
          _buildZoningCard(
            icon: Icons.layers_outlined,
            title: 'Zoning Districts',
            codes: zoning.zoningDistricts,
            color: Colors.blue,
          ),
        
        if (zoning.commercialOverlays.isNotEmpty)
          _buildZoningCard(
            icon: Icons.storefront_outlined,
            title: 'Commercial Overlays',
            codes: zoning.commercialOverlays,
            color: Colors.orange,
          ),
        
        if (zoning.specialDistricts.isNotEmpty)
          _buildZoningCard(
            icon: Icons.stars_outlined,
            title: 'Special Districts',
            codes: zoning.specialDistricts,
            color: Colors.purple,
          ),
        
        if (zoning.limitedHeightDistrict != null && zoning.limitedHeightDistrict!.isNotEmpty)
          _buildZoningCard(
            icon: Icons.vertical_align_top_outlined,
            title: 'Limited Height District',
            codes: [zoning.limitedHeightDistrict!],
            color: Colors.red,
          ),

        if (zoning.lastUpdated != null && zoning.lastUpdated!.isNotEmpty) ...[
          const SizedBox(height: 32),
          Center(
            child: Text(
              'Last Updated: ${zoning.lastUpdated}',
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ],
    );
  }

  Widget _buildZoningCard({
    required IconData icon,
    required String title,
    required List<String> codes,
    required MaterialColor color,
  }) {
    return InfoCard(
      icon: icon,
      title: title,
      color: color,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: codes.map((code) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Text(
              code,
              style: TextStyle(
                color: Colors.grey.shade800,
                fontWeight: FontWeight.w700,
                fontSize: 14,
                letterSpacing: 0.5,
              ),
            ),
          )).toList(),
        ),
      ],
    );
  }
}
