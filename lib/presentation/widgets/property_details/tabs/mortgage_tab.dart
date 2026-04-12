import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../domain/entities/property.dart';
import '../widgets/info_card.dart';
import '../widgets/standard_row.dart';
import '../widgets/empty_state.dart';
import '../widgets/section_header.dart';

class MortgageTab extends StatelessWidget {
  final Property property;
  final ScrollController controller;

  const MortgageTab({
    super.key,
    required this.property,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final mortgage = property.mortgage;
    final currencyFormatter = NumberFormat.currency(symbol: '\$', decimalDigits: 0);

    if (mortgage == null) {
      return EmptyState(controller: controller, icon: Icons.account_balance_outlined, message: 'No mortgage information available.');
    }

    return ListView(
      controller: controller,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      children: [
        const SectionHeader(
          title: 'Loan Summary',
          subtitle: 'Current mortgage and financial lender data.',
        ),
        InfoCard(
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
            StandardRow(icon: Icons.business_rounded, label: 'Lender', value: mortgage.lender ?? 'Unknown Lender'),
            const SizedBox(height: 12),
            StandardRow(icon: Icons.person_outline_rounded, label: 'Borrower', value: mortgage.borrower ?? 'Unknown Borrower'),
          ],
        ),
      ],
    );
  }
}
