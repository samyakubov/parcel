import 'package:flutter/material.dart';

class DetailItem {
  final String label;
  final String value;
  DetailItem(this.label, this.value);
}

class DetailGrid extends StatelessWidget {
  final List<DetailItem> items;

  const DetailGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
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
}
