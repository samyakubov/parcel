import 'package:flutter/material.dart';
import '../../../../domain/entities/property.dart';
import '../widgets/list_item_card.dart';
import '../widgets/empty_state.dart';
import '../widgets/section_header.dart';

class JobsTab extends StatelessWidget {
  final Property property;
  final ScrollController controller;

  const JobsTab({
    super.key,
    required this.property,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    if (property.jobFilings.isEmpty) {
      return EmptyState(controller: controller, icon: Icons.construction_rounded, message: 'No job filings recorded.');
    }

    return ListView.builder(
      controller: controller,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      itemCount: property.jobFilings.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return const SectionHeader(
            title: 'Job Filings',
            subtitle: 'New construction, alterations, and renovation filings.',
          );
        }

        final job = property.jobFilings[index - 1];
        final type = job['job_type']?.toString() ?? 'Job Filing';
        final status = job['job_status']?.toString() ?? 'Unknown';
        final desc = job['job_description']?.toString() ?? '—';
        final applicant = [job['applicant_first_name'], job['applicant_last_name']].where((s) => s != null).join(' ');

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
