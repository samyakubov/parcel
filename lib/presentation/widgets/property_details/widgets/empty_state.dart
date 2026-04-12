import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final IconData icon;
  final String message;
  final ScrollController controller;

  const EmptyState({
    super.key,
    required this.icon,
    required this.message,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: controller,
      children: [
        const SizedBox(height: 100),
        Icon(icon, size: 60, color: Colors.grey.shade200),
        const SizedBox(height: 16),
        Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey.shade400, fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
