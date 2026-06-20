import 'package:flutter/material.dart';
import 'empty_state.dart';
import 'section_header.dart';

class PropertyListTab extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final ScrollController controller;
  final IconData emptyIcon;
  final String emptyMessage;
  final String sectionTitle;
  final String sectionSubtitle;
  final Widget Function(BuildContext, Map<String, dynamic>) buildItem;

  const PropertyListTab({
    super.key,
    required this.items,
    required this.controller,
    required this.emptyIcon,
    required this.emptyMessage,
    required this.sectionTitle,
    required this.sectionSubtitle,
    required this.buildItem,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return EmptyState(controller: controller, icon: emptyIcon, message: emptyMessage);
    }

    return ListView.builder(
      controller: controller,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      itemCount: items.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return SectionHeader(title: sectionTitle, subtitle: sectionSubtitle);
        }
        return buildItem(context, items[index - 1]);
      },
    );
  }
}
