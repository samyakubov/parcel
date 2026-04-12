import 'package:flutter/material.dart';

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
                  Container(width: 2, height: 12, color: Colors.grey.shade100),
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCurrent ? Colors.blue.shade600 : Colors.white,
                    border: Border.all(
                      color: isCurrent ? Colors.blue.shade200 : Colors.grey.shade300,
                      width: 2,
                    ),
                    boxShadow: [
                      if (isCurrent)
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.2),
                          blurRadius: 4,
                          spreadRadius: 1,
                        )
                    ],
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(width: 2, color: Colors.grey.shade100),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Card content
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: isCurrent ? Colors.blue.shade50 : Colors.grey.shade100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: isCurrent ? Colors.blue.shade50 : Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      label.toUpperCase(),
                      style: TextStyle(
                        color: isCurrent ? Colors.blue.shade700 : Colors.grey.shade600,
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
                      color: isCurrent ? Colors.blue.shade900 : Colors.black87,
                    ),
                  ),
                  if (phone != null) ...[
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.phone_rounded, size: 14, color: Colors.grey.shade400),
                        const SizedBox(width: 6),
                        Text(
                          '(${phone.substring(0, 3)}) ${phone.substring(3, 6)}-${phone.substring(6)}',
                          style: TextStyle(color: Colors.grey.shade500, fontSize: 13, fontWeight: FontWeight.w500),
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
