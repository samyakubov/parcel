import 'package:flutter/material.dart';

class StandardRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const StandardRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(icon, size: 18, color: theme.colorScheme.secondary.withOpacity(0.5)),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label, 
                style: TextStyle(
                  fontSize: 11, 
                  color: theme.colorScheme.secondary, 
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                value, 
                style: TextStyle(
                  fontSize: 15, 
                  color: theme.colorScheme.onSurface, 
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
