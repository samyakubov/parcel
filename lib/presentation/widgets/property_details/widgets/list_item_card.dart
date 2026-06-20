import 'package:flutter/material.dart';
import 'status_tag.dart';

class ListItemCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? date;
  final String? amount;
  final String? status;
  final bool isStatusPositive;
  final Color color;

  const ListItemCard({
    super.key,
    required this.title,
    this.subtitle,
    this.date,
    this.amount,
    this.status,
    this.isStatusPositive = false,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ),
                  if (status != null)
                    StatusTag(status: status!, isPositive: isStatusPositive),
                  if (amount != null && status == null)
                    Text(
                      amount!,
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
                ],
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 4),
                Text(
                  subtitle!,
                  style: TextStyle(
                    color: theme.colorScheme.secondary,
                    fontSize: 13,
                    height: 1.3,
                  ),
                ),
              ],
              if (date != null || (amount != null && status != null)) ...[
                const SizedBox(height: 10),
                Row(
                  children: [
                    if (date != null) ...[
                      Icon(Icons.event_note_outlined, size: 13, color: theme.colorScheme.secondary.withValues(alpha: 0.5)),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          date!,
                          style: TextStyle(
                            color: theme.colorScheme.secondary.withValues(alpha: 0.7),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                    if (date == null) const Spacer(),
                    if (amount != null && status != null) ...[
                      if (date != null) const SizedBox(width: 12),
                      Text(
                        amount!,
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ],
            ],
          ),
        ),
        Divider(height: 1, color: theme.dividerColor),
      ],
    );
  }
}
