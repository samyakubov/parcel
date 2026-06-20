import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class TimelineEntry extends StatelessWidget {
  final String name;
  final String label;
  final bool isFirst;
  final bool isLast;
  final bool isCurrent;

  const TimelineEntry({
    super.key,
    required this.name,
    required this.label,
    required this.isFirst,
    required this.isLast,
    required this.isCurrent,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    final accent = theme.colorScheme.accentColor;
    final activeBg = accent.withOpacity(0.12);
    
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
                  Container(width: 2, height: 12, color: theme.dividerColor),
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCurrent ? accent : theme.cardColor,
                    border: Border.all(
                      color: isCurrent ? accent.withOpacity(0.5) : theme.colorScheme.secondary.withOpacity(0.3),
                      width: 2,
                    ),
                    boxShadow: [
                      if (isCurrent)
                        BoxShadow(
                          color: accent.withOpacity(0.2),
                          blurRadius: 4,
                          spreadRadius: 1,
                        )
                    ],
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(width: 2, color: theme.dividerColor),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: isCurrent ? activeBg : theme.brightness == Brightness.light ? Colors.grey.shade50 : theme.dividerColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      label.toUpperCase(),
                      style: TextStyle(
                        color: isCurrent ? accent : theme.colorScheme.secondary,
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
                      color: isCurrent ? accent : theme.colorScheme.onSurface,
                    ),
                  ),
                  if (phone != null) ...[
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.phone_rounded, size: 14, color: theme.colorScheme.secondary.withValues(alpha: 0.6)),
                        const SizedBox(width: 6),
                        Text(
                          '(${phone.substring(0, 3)}) ${phone.substring(3, 6)}-${phone.substring(6)}',
                          style: TextStyle(color: theme.colorScheme.secondary, fontSize: 13, fontWeight: FontWeight.w500),
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
}
