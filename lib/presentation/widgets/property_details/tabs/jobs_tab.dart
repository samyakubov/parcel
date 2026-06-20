import 'package:flutter/material.dart';
import '../../../../domain/entities/property.dart';
import '../widgets/list_item_card.dart';
import '../widgets/property_list_tab.dart';

class JobsTab extends StatelessWidget {
  final Property property;
  final ScrollController controller;

  const JobsTab({super.key, required this.property, required this.controller});

  @override
  Widget build(BuildContext context) {
    return PropertyListTab(
      items: property.jobFilings,
      controller: controller,
      emptyIcon: Icons.construction_rounded,
      emptyMessage: 'No job filings recorded.',
      sectionTitle: 'Job Filings',
      sectionSubtitle: 'New construction, alterations, and renovation filings.',
      buildItem: (context, job) {
        final type = job['job_type']?.toString() ?? 'Job Filing';
        final status = job['job_status']?.toString() ?? 'Unknown';
        final desc = job['job_description']?.toString() ?? '—';
        final applicant = [job['applicant_first_name'], job['applicant_last_name']]
            .where((s) => s != null).join(' ');
        return ListItemCard(
          title: type,
          subtitle: desc,
          date: applicant.isNotEmpty ? 'Applicant: $applicant' : null,
          status: status,
          isStatusPositive: status.toLowerCase().contains('permit') || status.toLowerCase().contains('complete'),
          icon: Icons.construction_outlined,
          color: Colors.amber,
        );
      },
    );
  }
}
