import 'package:flutter/material.dart';
import 'status_tag.dart';

class ListItemCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? date;
  final String? amount;
  final String? status;
  final bool isStatusPositive;
  final IconData icon;
  final MaterialColor color;

  const ListItemCard({
    super.key,
    required this.title,
    this.subtitle,
    this.date,
    this.amount,
    this.status,
    this.isStatusPositive = false,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
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
                if (status != null) StatusTag(status: status!, isPositive: isStatusPositive),
                if (amount != null && status == null)
                  Text(
                    amount!,
                    style: TextStyle(color: color.shade700, fontWeight: FontWeight.w700, fontSize: 13),
                  ),
              ],
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 6),
              Text(subtitle!, style: TextStyle(color: Colors.grey.shade600, fontSize: 13, height: 1.3)),
            ],
            if (date != null || (amount != null && status != null)) ...[
              const SizedBox(height: 12),
              Row(
                children: [
                  if (date != null) ...[
                    Icon(Icons.event_note_outlined, size: 13, color: Colors.grey.shade400),
                    const SizedBox(width: 4),
                    Text(date!, style: TextStyle(color: Colors.grey.shade400, fontSize: 12, fontWeight: FontWeight.w500)),
                  ],
                  const Spacer(),
                  if (amount != null && status != null)
                    Text(
                      amount!,
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
}
