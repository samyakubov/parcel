import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodels/map_style_viewmodel.dart';

class MapLayerToggle extends ConsumerWidget {
  const MapLayerToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = ref.watch(mapStyleProvider);
    final theme = Theme.of(context);
    final isSatellite = style == MapLayerStyle.satellite;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Material(
            color: theme.cardColor.withOpacity(0.8),
            child: InkWell(
              onTap: () => ref.read(mapStyleProvider.notifier).toggleStyle(),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isSatellite ? Icons.satellite_alt_rounded : Icons.layers_rounded,
                      size: 20,
                      color: isSatellite ? theme.colorScheme.primary : theme.colorScheme.onSurface,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
