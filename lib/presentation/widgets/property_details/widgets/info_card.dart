import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import 'property_card_surface.dart';

class InfoCard extends StatelessWidget {
  final List<Widget> children;

  const InfoCard({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
 
    return PropertyCardSurface(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(24),
      radius: 20,
      borderColor: theme.colorScheme.goldAccent.withValues(alpha: 0.35),
      lightShadowOpacity: 0.03,
      shadowBlurRadius: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }
}
