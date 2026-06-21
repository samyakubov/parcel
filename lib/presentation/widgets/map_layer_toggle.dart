import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_theme.dart';
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
        color: theme.colorScheme.accentColor,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Semantics(
        button: true,
        label: isSatellite ? 'Switch to standard map' : 'Switch to satellite view',
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => ref.read(mapStyleProvider.notifier).toggleStyle(),
            borderRadius: BorderRadius.circular(14),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(
                isSatellite ? Icons.satellite_alt_rounded : Icons.layers_rounded,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
