import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import 'property_card_surface.dart';
import 'status_tag.dart';

class ListItemCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? date;
  final String? amount;
  final String? status;
  final bool isStatusPositive;
  final IconData icon;
  final Color color;

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
    final theme = Theme.of(context);
 
    return PropertyCardSurface(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      borderColor: theme.colorScheme.cardBorder,
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
            const SizedBox(height: 6),
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
            const SizedBox(height: 12),
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
    );
  }
}
