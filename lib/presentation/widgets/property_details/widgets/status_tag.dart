import 'package:flutter/material.dart';

class StatusTag extends StatelessWidget {
  final String status;
  final bool isPositive;

  const StatusTag({
    super.key,
    required this.status,
    this.isPositive = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final baseColor = isPositive ? Colors.green : Colors.amber;
    final bgColor = theme.brightness == Brightness.light 
      ? baseColor.shade50 
      : baseColor.withOpacity(0.15);
    final textColor = theme.brightness == Brightness.light 
      ? baseColor.shade700 
      : baseColor.shade300;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(
          color: textColor,
          fontSize: 9,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
