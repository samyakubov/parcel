import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodels/property_search_viewmodel.dart';
import '../../domain/entities/property.dart';
import 'package:intl/intl.dart';
import '../../core/constants.dart';

class PropertyDetailsSheet extends ConsumerWidget {
  const PropertyDetailsSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(propertySearchViewModelProvider);
    final property = state.value;

    if (property == null) return const SizedBox.shrink();

    // Try to extract address from the first record if available
    String addressTitle = 'Property Details';
    if (property.records.isNotEmpty) {
      final firstRecord = property.records.first;
      final streetNumber = firstRecord['prop_streetnumber'] ?? '';
      final streetName = firstRecord['prop_streetname'] ?? '';
      if (streetNumber.toString().isNotEmpty || streetName.toString().isNotEmpty) {
        addressTitle = '$streetNumber $streetName'.trim();
      }
    }

    final coords = property.coordinates;
    final imageUrl = coords != null
        ? 'https://maps.googleapis.com/maps/api/streetview?size=800x600&scale=2&fov=90&pitch=10&location=${coords.latitude},${coords.longitude}&key=${AppConstants.streetViewApiKey}'
        : null;

    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 20,
                spreadRadius: 2,
                offset: const Offset(0, -2),
              )
            ],
          ),
          clipBehavior: Clip.antiAlias, // Ensure image respects rounded corners
          child: DefaultTabController(
            length: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Top Header Section (Draggable area for the sheet)
                SingleChildScrollView(
                  controller: scrollController,
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    children: [
                      // Top Image + Drag Handle Overlay
                      Stack(
                        children: [
                          if (imageUrl != null)
                            Image.network(
                              imageUrl,
                              height: 240,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Container(
                                height: 240,
                                color: Colors.grey.shade100,
                                child: const Center(child: Icon(Icons.broken_image_rounded, size: 48, color: Colors.grey)),
                              ),
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Container(
                                  height: 240,
                                  color: Colors.grey.shade50,
                                  child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                                );
                              },
                            )
                          else
                            Container(height: 240, color: Colors.grey.shade100),
                          
                          // Drag Handle Overlay
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.35),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                              child: Center(
                                child: Container(
                                  width: 52,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.9),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                
                // Address & Details Section
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 20, 24, 12),
                  child: Text(
                    addressTitle,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900, // Heavier weight for premium look
                      letterSpacing: -0.8,
                      color: Colors.black,
                      height: 1.1,
                    ),
                  ),
                ),
                
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TabBar(
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    dividerColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        )
                      ],
                    ),
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey.shade500,
                    labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                    unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    tabs: const [
                      Tab(text: 'Details'),
                      Tab(text: 'Owners'),
                      Tab(text: 'Mortgage'),
                      Tab(text: 'Activity'),
                      Tab(text: 'Violations'),
                      Tab(text: 'Jobs'),
                      Tab(text: 'Complaints'),
                      Tab(text: 'Zoning'),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: TabBarView(
                    children: [
                      _buildDetailsTab(property, scrollController),
                      _buildOwnersTab(property, scrollController),
                      _buildMortgageTab(property, scrollController),
                      _buildActivityTab(property, scrollController),
                      _buildViolationsTab(property, scrollController),
                      _buildJobsTab(property, scrollController),
                      _buildComplaintsTab(property, scrollController),
                      _buildZoningTab(property, scrollController),
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

  Widget _buildDetailsTab(Property property, ScrollController controller) {
    final currencyFormatter = NumberFormat.currency(symbol: '\$', decimalDigits: 0);
    final numberFormatter = NumberFormat.decimalPattern();

    return ListView(
      controller: controller,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      children: [
        _buildInfoCard(
          icon: Icons.analytics_outlined,
          title: 'Market Overview',
          color: Colors.blue,
          children: [
            _buildStandardRow(Icons.monetization_on_outlined, 'Last Sold Price', property.lastSold?.lastSoldPrice != null ? currencyFormatter.format(property.lastSold!.lastSoldPrice) : 'N/A'),
            _buildStandardRow(Icons.calendar_month_outlined, 'Last Sold Date', property.lastSold?.lastSoldDate ?? 'N/A'),
            const Divider(height: 32),
            _buildStandardRow(Icons.home_work_outlined, 'Year Built', property.lastSold?.yearBuilt?.toString() ?? 'N/A'),
            _buildStandardRow(Icons.landscape_outlined, 'Land Size', property.lastSold?.landSqft != null ? '${numberFormatter.format(property.lastSold!.landSqft)} SqFt' : 'N/A'),
            _buildStandardRow(Icons.square_foot_outlined, 'Gross Area', property.lastSold?.grossSqft != null ? '${numberFormatter.format(property.lastSold!.grossSqft)} SqFt' : 'N/A'),
          ],
        ),
      ],
    );
  }

  Widget _buildOwnersTab(Property property, ScrollController controller) {
    final currentOwners = property.owners?.currentOwners ?? [];
    final previousOwners = property.owners?.previousOwners ?? [];

    if (currentOwners.isEmpty && previousOwners.isEmpty) {
      return _buildEmptyState(controller, Icons.people_outline_rounded, 'No ownership records found.');
    }

    return ListView(
      controller: controller,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ownership History',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.black87),
              ),
              const SizedBox(height: 4),
              Text(
                'Showing timeline from most recent to earliest.',
                style: TextStyle(color: Colors.grey.shade500, fontSize: 13, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),

        // Current owners
        if (currentOwners.isNotEmpty) ...[
          ...currentOwners.asMap().entries.map((entry) {
            final i = entry.key;
            final owner = entry.value;
            return _buildTimelineEntry(
              name: owner,
              label: 'Current Owner',
              isFirst: i == 0,
              isLast: false,
              isCurrent: true,
            );
          }),
        ],

        // Previous owners
        if (previousOwners.isNotEmpty) ...[
          ...previousOwners.asMap().entries.map((entry) {
            final i = entry.key;
            final owner = entry.value;
            return _buildTimelineEntry(
              name: owner,
              label: 'Previous Owner',
              isFirst: false,
              isLast: i == previousOwners.length - 1,
              isCurrent: false,
            );
          }),
        ],
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildTimelineEntry({
    required String name,
    required String label,
    required bool isFirst,
    required bool isLast,
    required bool isCurrent,
  }) {
    // Strip phone number from name if present
    final displayName = name.replaceAll(RegExp(r'\s*\(.*?\)\s*'), '').trim();
    final phoneMatch = RegExp(r'\((\d{10})\)').firstMatch(name);
    final phone = phoneMatch?.group(1);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Timeline spine
          SizedBox(
            width: 32,
            child: Column(
              children: [
                if (!isFirst)
                  Container(width: 2, height: 12, color: Colors.grey.shade100),
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCurrent ? Colors.blue.shade600 : Colors.white,
                    border: Border.all(
                      color: isCurrent ? Colors.blue.shade200 : Colors.grey.shade300,
                      width: 2,
                    ),
                    boxShadow: [
                      if (isCurrent)
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.2),
                          blurRadius: 4,
                          spreadRadius: 1,
                        )
                    ],
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(width: 2, color: Colors.grey.shade100),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Card content
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: isCurrent ? Colors.blue.shade50 : Colors.grey.shade100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: isCurrent ? Colors.blue.shade50 : Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      label.toUpperCase(),
                      style: TextStyle(
                        color: isCurrent ? Colors.blue.shade700 : Colors.grey.shade600,
                        fontSize: 9,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    displayName,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: isCurrent ? Colors.blue.shade900 : Colors.black87,
                    ),
                  ),
                  if (phone != null) ...[
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.phone_rounded, size: 14, color: Colors.grey.shade400),
                        const SizedBox(width: 6),
                        Text(
                          '(${phone.substring(0, 3)}) ${phone.substring(3, 6)}-${phone.substring(6)}',
                          style: TextStyle(color: Colors.grey.shade500, fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMortgageTab(Property property, ScrollController controller) {
    final mortgage = property.mortgage;
    final currencyFormatter = NumberFormat.currency(symbol: '\$', decimalDigits: 0);

    if (mortgage == null) {
      return _buildEmptyState(controller, Icons.account_balance_outlined, 'No mortgage information available.');
    }

    return ListView(
      controller: controller,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      children: [
        _buildInfoCard(
          icon: Icons.account_balance_outlined,
          title: 'Loan Summary',
          color: Colors.green,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Principal Amount',
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 12, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  mortgage.amount != null ? currencyFormatter.format(mortgage.amount) : 'N/A',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                    letterSpacing: -1,
                  ),
                ),
              ],
            ),
            const Divider(height: 40),
            _buildStandardRow(Icons.business_rounded, 'Lender', mortgage.lender ?? 'Unknown Lender'),
            const SizedBox(height: 12),
            _buildStandardRow(Icons.person_outline_rounded, 'Borrower', mortgage.borrower ?? 'Unknown Borrower'),
          ],
        ),
      ],
    );
  }

  Widget _buildActivityTab(Property property, ScrollController controller) {
    if (property.records.isEmpty) {
      return _buildEmptyState(controller, Icons.history_rounded, 'No activity records available.');
    }

    final currencyFormatter = NumberFormat.currency(symbol: '\$', decimalDigits: 0);

    return ListView.builder(
      controller: controller,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      itemCount: property.records.length,
      itemBuilder: (context, index) {
        final record = property.records[index];
        final type = record['partytype_desc']?.toString() ?? 'Record';
        final partyName = record['party_name']?.toString() ?? '—';
        final amount = record['amount'] is num ? (record['amount'] as num).toDouble() : 0.0;
        final date = record['record_filed']?.toString() ?? '';

        return _buildListItemCard(
          title: type,
          subtitle: partyName,
          date: date,
          amount: amount > 0 ? currencyFormatter.format(amount) : null,
          icon: Icons.description_outlined,
          color: Colors.blue,
        );
      },
    );
  }

  Widget _buildViolationsTab(Property property, ScrollController controller) {
    if (property.violations.isEmpty) {
      return _buildEmptyState(controller, Icons.gavel_rounded, 'No violations recorded.');
    }

    final currencyFormatter = NumberFormat.currency(symbol: '\$', decimalDigits: 0);

    return ListView.builder(
      controller: controller,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      itemCount: property.violations.length,
      itemBuilder: (context, index) {
        final v = property.violations[index];
        final type = v['violation_type']?.toString() ?? 'Violation';
        final status = v['violation_status']?.toString() ?? 'Unknown';
        final desc = v['description']?.toString() ?? '—';
        final amount = v['penalty_amount'] is num ? (v['penalty_amount'] as num).toDouble() : 0.0;
        final date = v['issue_date']?.toString() ?? '';
        
        final isClosed = status.toLowerCase().contains('close') || status.toLowerCase().contains('resolved');

        return _buildListItemCard(
          title: type,
          subtitle: desc,
          date: date,
          amount: amount > 0 ? 'Fine: ${currencyFormatter.format(amount)}' : null,
          status: status,
          isStatusPositive: isClosed,
          icon: Icons.gavel_outlined,
          color: Colors.red,
        );
      },
    );
  }

  Widget _buildJobsTab(Property property, ScrollController controller) {
    if (property.jobFilings.isEmpty) {
      return _buildEmptyState(controller, Icons.construction_rounded, 'No job filings recorded.');
    }

    return ListView.builder(
      controller: controller,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      itemCount: property.jobFilings.length,
      itemBuilder: (context, index) {
        final job = property.jobFilings[index];
        final type = job['job_type']?.toString() ?? 'Job Filing';
        final status = job['job_status']?.toString() ?? 'Unknown';
        final desc = job['job_description']?.toString() ?? '—';
        final applicant = [job['applicant_first_name'], job['applicant_last_name']].where((s) => s != null).join(' ');

        return _buildListItemCard(
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

  Widget _buildComplaintsTab(Property property, ScrollController controller) {
    if (property.complaints.isEmpty) {
      return _buildEmptyState(controller, Icons.verified_user_rounded, 'No complaints recorded.');
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
              trailing: _buildStatusTag(status, isClosed),
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.grey.shade50,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDetailGrid([
                        if (c['inspection_date'] != null) _DetailItem('Inspection', c['inspection_date']),
                        if (c['disposition_date'] != null) _DetailItem('Disposition', c['disposition_date']),
                        if (c['disposition_code'] != null) _DetailItem('Code', c['disposition_code']),
                        if (c['bin'] != null) _DetailItem('BIN', c['bin']),
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

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required List<Widget> children,
    required MaterialColor color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: color.shade50,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, size: 22, color: color.shade700),
                ),
                const SizedBox(width: 14),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.black87,
                    letterSpacing: -0.3,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildListItemCard({
    required String title,
    String? subtitle,
    String? date,
    String? amount,
    String? status,
    bool isStatusPositive = false,
    required IconData icon,
    required MaterialColor color,
  }) {
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
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15, color: Colors.black87),
                  ),
                ),
                if (status != null) _buildStatusTag(status, isStatusPositive),
                if (amount != null && status == null)
                  Text(
                    amount,
                    style: TextStyle(color: color.shade700, fontWeight: FontWeight.w700, fontSize: 13),
                  ),
              ],
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 6),
              Text(subtitle, style: TextStyle(color: Colors.grey.shade600, fontSize: 13, height: 1.3)),
            ],
            if (date != null || (amount != null && status != null)) ...[
              const SizedBox(height: 12),
              Row(
                children: [
                  if (date != null) ...[
                    Icon(Icons.event_note_outlined, size: 13, color: Colors.grey.shade400),
                    const SizedBox(width: 4),
                    Text(date, style: TextStyle(color: Colors.grey.shade400, fontSize: 12, fontWeight: FontWeight.w500)),
                  ],
                  const Spacer(),
                  if (amount != null && status != null)
                    Text(
                      amount,
                      style: TextStyle(color: color.shade700, fontWeight: FontWeight.w700, fontSize: 12),
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStatusTag(String status, bool isPositive) {
    final color = isPositive ? Colors.green : Colors.amber;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.shade50,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(
          color: color.shade700,
          fontSize: 9,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildStandardRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey.shade400),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: TextStyle(fontSize: 11, color: Colors.grey.shade500, fontWeight: FontWeight.w600)),
            Text(value, style: const TextStyle(fontSize: 15, color: Colors.black87, fontWeight: FontWeight.w600)),
          ],
        ),
      ],
    );
  }

  Widget _buildDetailGrid(List<_DetailItem> items) {
    if (items.isEmpty) return const SizedBox.shrink();
    return Wrap(
      spacing: 20,
      runSpacing: 16,
      children: items.map((item) => SizedBox(
        width: 130,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.grey.shade400, letterSpacing: 0.5)),
            const SizedBox(height: 2),
            Text(item.value, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black87)),
          ],
        ),
      )).toList(),
    );
  }

  Widget _buildZoningTab(Property property, ScrollController controller) {
    final zoning = property.zoning;
    
    if (zoning == null || (zoning.zoningDistricts.isEmpty && zoning.commercialOverlays.isEmpty && zoning.specialDistricts.isEmpty && (zoning.limitedHeightDistrict == null || zoning.limitedHeightDistrict!.isEmpty))) {
      return _buildEmptyState(controller, Icons.map_outlined, 'No zoning information available for this property.');
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
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.shade50,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, size: 20, color: color.shade700),
                ),
                const SizedBox(width: 14),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
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
        ),
      ),
    );
  }

  Widget _buildEmptyState(ScrollController controller, IconData icon, String message) {
    return ListView(
      controller: controller,
      children: [
        const SizedBox(height: 100),
        Icon(icon, size: 60, color: Colors.grey.shade200),
        const SizedBox(height: 16),
        Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey.shade400, fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class _DetailItem {
  final String label;
  final String value;
  _DetailItem(this.label, this.value);
}
