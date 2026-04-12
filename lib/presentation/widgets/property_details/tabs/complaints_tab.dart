import 'package:flutter/material.dart';
import '../../../../domain/entities/property.dart';
import '../widgets/status_tag.dart';
import '../widgets/detail_grid.dart';
import '../widgets/empty_state.dart';

class ComplaintsTab extends StatelessWidget {
  final Property property;
  final ScrollController controller;

  const ComplaintsTab({
    super.key,
    required this.property,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    if (property.complaints.isEmpty) {
      return EmptyState(controller: controller, icon: Icons.verified_user_rounded, message: 'No complaints recorded.');
    }

    return ListView.builder(
      controller: controller,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      itemCount: property.complaints.length,
      itemBuilder: (context, index) {
        final c = property.complaints[index];
        final number = c['complaint_number']?.toString() ?? '—';
        final category = c['complaint_category']?.toString() ?? 'Complaint';
        final status = c['status']?.toString() ?? '—';
        final isClosed = status.toLowerCase().contains('closed');

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade100),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 8,
                offset: const Offset(0, 4),
              )
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              childrenPadding: EdgeInsets.zero,
              iconColor: Colors.grey.shade400,
              title: Text(
                category,
                style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15, color: Colors.black87),
              ),
              subtitle: Text('#$number', style: TextStyle(fontSize: 12, color: Colors.grey.shade400, fontWeight: FontWeight.w500)),
              trailing: StatusTag(status: status, isPositive: isClosed),
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.grey.shade50,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DetailGrid(items: [
                        if (c['inspection_date'] != null) DetailItem('Inspection', c['inspection_date']),
                        if (c['disposition_date'] != null) DetailItem('Disposition', c['disposition_date']),
                        if (c['disposition_code'] != null) DetailItem('Code', c['disposition_code']),
                        if (c['bin'] != null) DetailItem('BIN', c['bin']),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
