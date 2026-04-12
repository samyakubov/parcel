import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../domain/entities/property.dart';
import '../widgets/info_card.dart';
import '../widgets/standard_row.dart';

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
    final currencyFormatter = NumberFormat.currency(symbol: '\$', decimalDigits: 0);
    final numberFormatter = NumberFormat.decimalPattern();

    return ListView(
      controller: controller,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      children: [
        InfoCard(
          icon: Icons.analytics_outlined,
          title: 'Market Overview',
          color: Colors.blue,
          children: [
            StandardRow(icon: Icons.monetization_on_outlined, label: 'Last Sold Price', value: property.lastSold?.lastSoldPrice != null ? currencyFormatter.format(property.lastSold!.lastSoldPrice) : 'N/A'),
            StandardRow(icon: Icons.calendar_month_outlined, label: 'Last Sold Date', value: property.lastSold?.lastSoldDate ?? 'N/A'),
            const Divider(height: 32),
            StandardRow(icon: Icons.home_work_outlined, label: 'Year Built', value: property.lastSold?.yearBuilt?.toString() ?? 'N/A'),
            StandardRow(icon: Icons.landscape_outlined, label: 'Land Size', value: property.lastSold?.landSqft != null ? '${numberFormatter.format(property.lastSold!.landSqft)} SqFt' : 'N/A'),
            StandardRow(icon: Icons.square_foot_outlined, label: 'Gross Area', value: property.lastSold?.grossSqft != null ? '${numberFormatter.format(property.lastSold!.grossSqft)} SqFt' : 'N/A'),
          ],
        ),
      ],
    );
  }
}
