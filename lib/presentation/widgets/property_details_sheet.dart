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
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      children: [
        _buildSectionHeader('Valuation & Building'),
        _buildIconRow(Icons.monetization_on_rounded, 'Last Sold Price', property.lastSold?.lastSoldPrice != null ? currencyFormatter.format(property.lastSold!.lastSoldPrice) : 'N/A'),
        _buildIconRow(Icons.calendar_month_rounded, 'Last Sold Date', property.lastSold?.lastSoldDate ?? 'N/A'),
        _buildIconRow(Icons.home_work_rounded, 'Year Built', property.lastSold?.yearBuilt?.toString() ?? 'N/A'),
        _buildIconRow(Icons.landscape_rounded, 'Land SqFt', property.lastSold?.landSqft != null ? numberFormatter.format(property.lastSold!.landSqft) : 'N/A'),
        _buildIconRow(Icons.square_foot_rounded, 'Gross SqFt', property.lastSold?.grossSqft != null ? numberFormatter.format(property.lastSold!.grossSqft) : 'N/A'),
        const SizedBox(height: 32),
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
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      children: [
        _buildSectionHeader('Ownership Timeline'),
        Text(
          'Showing ownership history from most recent to earliest.',
          style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
        ),
        const SizedBox(height: 28),

        // Current owners — top of timeline
        if (currentOwners.isNotEmpty) ...[
          ...currentOwners.asMap().entries.map((entry) {
            final i = entry.key;
            final owner = entry.value;
            return _buildTimelineEntry(
              name: owner,
              label: 'Current Owner',
              isFirst: i == 0 && currentOwners.isNotEmpty,
              isLast: false,
              isCurrent: true,
            );
          }),
        ],

        // Previous owners — descending through time
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
            width: 36,
            child: Column(
              children: [
                // Top connector line
                if (!isFirst)
                  Container(width: 2, height: 12, color: Colors.grey.shade200),
                // Dot
                Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCurrent ? Colors.blue.shade600 : Colors.grey.shade300,
                    border: Border.all(
                      color: isCurrent ? Colors.blue.shade200 : Colors.grey.shade300,
                      width: 3,
                    ),
                  ),
                ),
                // Bottom connector line
                if (!isLast)
                  Expanded(
                    child: Container(width: 2, color: Colors.grey.shade200),
                  ),
                if (isLast) const SizedBox(height: 8),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Card content
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isCurrent ? Colors.blue.shade50 : Colors.grey.shade50,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: isCurrent ? Colors.blue.shade100 : Colors.grey.shade200,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: isCurrent ? Colors.blue.shade600 : Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          label,
                          style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    displayName,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: isCurrent ? Colors.blue.shade900 : Colors.black87,
                    ),
                  ),
                  if (phone != null) ...[
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.phone_rounded, size: 13, color: Colors.grey.shade500),
                        const SizedBox(width: 4),
                        Text(
                          '(${phone.substring(0, 3)}) ${phone.substring(3, 6)}-${phone.substring(6)}',
                          style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
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
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      children: [
        _buildSectionHeader('Mortgage Details'),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade700, Colors.blue.shade500],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withValues(alpha: 0.25),
                blurRadius: 16,
                offset: const Offset(0, 8),
              )
            ],
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Loan Amount', style: TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              Text(
                mortgage.amount != null ? currencyFormatter.format(mortgage.amount) : 'N/A',
                style: const TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.w800, letterSpacing: -1),
              ),
            ],
          ),
        ),
        const SizedBox(height: 28),
        _buildSectionHeader('Lender'),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.account_balance_rounded, color: Colors.blue.shade700, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  mortgage.lender ?? 'Unknown Lender',
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 17, color: Colors.black87),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        _buildSectionHeader('Borrower'),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.person_rounded, color: Colors.green.shade700, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  mortgage.borrower ?? 'Unknown Borrower',
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 17, color: Colors.black87),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
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
        final documentId = record['documentid']?.toString() ?? '';
        final type = record['partytype_desc']?.toString() ?? 'Record';
        final partyName = record['party_name']?.toString() ?? '—';
        final amount = record['amount'] is num ? (record['amount'] as num).toDouble() : 0.0;
        final date = record['record_filed']?.toString() ?? '';

        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFFEEEEEE)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        type,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Color(0xFF111111),
                        ),
                      ),
                    ),
                    if (amount > 0)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0FFF7),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          currencyFormatter.format(amount),
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1A7F4B),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(partyName,
                    style: const TextStyle(fontSize: 13, color: Color(0xFF888888))),
                const SizedBox(height: 6),
                Row(
                  children: [
                    if (date.isNotEmpty) ...
                      [Text(date,
                          style: const TextStyle(fontSize: 12, color: Color(0xFFBBBBBB)))],
                    const Spacer(),
                    if (documentId.isNotEmpty)
                      Text(documentId,
                          style: const TextStyle(
                              fontSize: 11, color: Color(0xFFBBBBBB), fontFamily: 'monospace')),
                  ],
                ),
              ],
            ),
          ),
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
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      itemCount: property.violations.length,
      itemBuilder: (context, index) {
        final violation = property.violations[index];
        final type = violation['violation_type']?.toString() ?? 'Violation';
        final status = violation['violation_status']?.toString() ?? 'Unknown Status';
        final description = violation['description']?.toString() ?? 'No description';
        final penaltyAmount = violation['penalty_amount'] is num ? (violation['penalty_amount'] as num).toDouble() : 0.0;
        final issueDate = violation['issue_date']?.toString() ?? '';
        
        final isClosed = status.toLowerCase().contains('close') || status.toLowerCase().contains('resolved');

        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.02),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        type, 
                        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black87),
                      )
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: isClosed ? Colors.grey.shade100 : Colors.red.shade50,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        status, 
                        style: TextStyle(
                          color: isClosed ? Colors.grey.shade700 : Colors.red.shade700, 
                          fontSize: 12, 
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(description, style: TextStyle(color: Colors.grey.shade800, fontSize: 14)),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (issueDate.isNotEmpty)
                      Row(
                        children: [
                          Icon(Icons.calendar_today_rounded, size: 14, color: Colors.grey.shade500),
                          const SizedBox(width: 4),
                          Text(issueDate, style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
                        ],
                      ),
                    if (penaltyAmount > 0)
                      Text(
                        'Penalty: ${currencyFormatter.format(penaltyAmount)}', 
                        style: TextStyle(color: Colors.red.shade700, fontWeight: FontWeight.w700, fontSize: 14)
                      ),
                  ],
                ),
              ],
            ),
          ),
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
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      itemCount: property.jobFilings.length,
      itemBuilder: (context, index) {
        final job = property.jobFilings[index];
        final type = job['job_type']?.toString() ?? 'Job Filing';
        final status = job['job_status']?.toString() ?? 'Unknown';
        final description = job['job_description']?.toString() ?? 'No description';
        final applicantFirstName = job['applicant_first_name']?.toString() ?? '';
        final applicantLastName = job['applicant_last_name']?.toString() ?? '';
        final title = job['applicant_professional_title']?.toString() ?? '';

        final applicantName = [applicantFirstName, applicantLastName].where((s) => s.isNotEmpty).join(' ');

        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.02),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        type, 
                        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Colors.blueAccent),
                      )
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        status, 
                        style: TextStyle(
                          color: Colors.blue.shade700, 
                          fontSize: 12, 
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(description, style: TextStyle(color: Colors.grey.shade800, fontSize: 14)),
                if (applicantName.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.person_pin_rounded, size: 16, color: Colors.grey.shade500),
                      const SizedBox(width: 6),
                      Text(
                        '$applicantName ${title.isNotEmpty ? '($title)' : ''}', 
                        style: TextStyle(color: Colors.grey.shade700, fontSize: 13, fontStyle: FontStyle.italic)
                      ),
                    ],
                  ),
                ]
              ],
            ),
          ),
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
        final bin = c['bin']?.toString() ?? '';
        final specialDistrict = c['special_district']?.toString() ?? '';
        final inspectionDate = c['inspection_date']?.toString() ?? '';
        final dispositionDate = c['disposition_date']?.toString() ?? '';
        final dispositionCode = c['disposition_code']?.toString() ?? '';
        final dobrunDate = c['dobrun_date']?.toString() ?? '';

        final isClosed = status.toLowerCase().contains('closed');
        final statusColor = isClosed ? const Color(0xFF888888) : const Color(0xFFB45309);
        final statusBg = isClosed ? const Color(0xFFF9F9F9) : const Color(0xFFFFFBEB);

        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFFEEEEEE)),
          ),
          clipBehavior: Clip.hardEdge,
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              tilePadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              childrenPadding: EdgeInsets.zero,
              title: Row(
                children: [
                  Expanded(
                    child: Text(category,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Color(0xFF111111),
                        )),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: statusBg,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(status,
                        style: TextStyle(
                            fontSize: 11, fontWeight: FontWeight.w600, color: statusColor)),
                  ),
                ],
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 2, bottom: 4),
                child: Text('#$number',
                    style: const TextStyle(fontSize: 12, color: Color(0xFFBBBBBB))),
              ),
              children: [
                Container(
                  width: double.infinity,
                  color: const Color(0xFFF9F9F9),
                  padding: const EdgeInsets.fromLTRB(14, 12, 14, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(height: 1, color: Color(0xFFEEEEEE)),
                      const SizedBox(height: 12),
                      _detailGrid([
                        if (inspectionDate.isNotEmpty) _DetailItem('Inspection Date', inspectionDate),
                        if (dispositionDate.isNotEmpty) _DetailItem('Disposition Date', dispositionDate),
                        if (dispositionCode.isNotEmpty) _DetailItem('Disposition Code', dispositionCode),
                        if (dobrunDate.isNotEmpty) _DetailItem('DOB Run Date', dobrunDate),
                        if (bin.isNotEmpty) _DetailItem('BIN', bin),
                        if (specialDistrict.isNotEmpty) _DetailItem('Special District', specialDistrict),
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

  Widget _detailGrid(List<_DetailItem> items) {
    if (items.isEmpty) return const SizedBox.shrink();
    return Wrap(
      spacing: 16,
      runSpacing: 12,
      children: items.map((item) => SizedBox(
        width: 140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.label,
                style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF888888),
                    letterSpacing: 0.4)),
            const SizedBox(height: 2),
            Text(item.value,
                style: const TextStyle(
                    fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFF111111))),
          ],
        ),
      )).toList(),
    );
  }

  Widget _buildZoningTab(Property property, ScrollController controller) {
    final zoning = property.zoning;
    
    return ListView(
      controller: controller,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      children: [
        _buildSectionHeader('Zoning Districts'),
        if (zoning == null || zoning.zoningDistricts.isEmpty)
          const Text('No zoning districts listed.', style: TextStyle(color: Colors.grey)),
        ...?zoning?.zoningDistricts.map((z) => _buildBulletPoint(z)),

        const Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Divider(height: 32)),
        _buildSectionHeader('Commercial Overlays'),
        if (zoning == null || zoning.commercialOverlays.isEmpty)
          const Text('No commercial overlays listed.', style: TextStyle(color: Colors.grey)),
        ...?zoning?.commercialOverlays.map((z) => _buildBulletPoint(z)),

        const Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Divider(height: 32)),
        _buildSectionHeader('Special Districts'),
        if (zoning == null || zoning.specialDistricts.isEmpty)
          const Text('No special districts listed.', style: TextStyle(color: Colors.grey)),
        ...?zoning?.specialDistricts.map((z) => _buildBulletPoint(z)),
        
        if (zoning?.limitedHeightDistrict != null && zoning!.limitedHeightDistrict!.isNotEmpty) ...[
          const Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Divider(height: 32)),
          _buildIconRow(Icons.height_rounded, 'Limited Height District', zoning.limitedHeightDistrict!),
        ],
        
        if (zoning?.lastUpdated != null && zoning!.lastUpdated!.isNotEmpty) ...[
          const SizedBox(height: 24),
          Center(
            child: Text(
              'Last Updated: ${zoning.lastUpdated}', 
              style: TextStyle(color: Colors.grey.shade400, fontSize: 13, fontWeight: FontWeight.w500)
            ),
          ),
        ]
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w800, color: Colors.black87, letterSpacing: -0.3),
      ),
    );
  }

  Widget _buildIconRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 20, color: Colors.blue.shade700),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: TextStyle(fontSize: 13, color: Colors.grey.shade500, fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text(value, style: const TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6, right: 12),
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: Colors.blue.shade400,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(text, style: const TextStyle(fontSize: 15, color: Colors.black87, height: 1.4)),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(ScrollController controller, IconData icon, String message) {
    return ListView(
      controller: controller,
      padding: const EdgeInsets.all(32),
      children: [
        const SizedBox(height: 48),
        Icon(icon, size: 64, color: Colors.grey.shade300),
        const SizedBox(height: 16),
        Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey.shade500, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class _DetailItem {
  final String label;
  final String value;
  const _DetailItem(this.label, this.value);
}
