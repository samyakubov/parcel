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
    final color = isPositive ? Colors.green : Colors.amber;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.shade50,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(
          color: color.shade700,
          fontSize: 9,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
