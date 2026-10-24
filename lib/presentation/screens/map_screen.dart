import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import '../widgets/search_bar/address_search_bar.dart';
import '../widgets/property_details_sheet.dart';
import '../widgets/map_layer_toggle.dart';
import '../viewmodels/property_search_viewmodel.dart';
import '../viewmodels/map_style_viewmodel.dart';
import '../../core/theme/app_theme.dart';
import '../../core/constants.dart';
import '../../core/utils/error_formatter.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  MapboxMap? mapboxMap;
  CircleAnnotationManager? circleAnnotationManager;
  String? _currentStyle;
  bool _skipNextPropertyFlyTo = false;

  void _onMapCreated(MapboxMap mapboxMap) async {
    try {
      this.mapboxMap = mapboxMap;
      circleAnnotationManager = await mapboxMap.annotations.createCircleAnnotationManager();

      mapboxMap.logo.updateSettings(LogoSettings(enabled: false));
      mapboxMap.attribution.updateSettings(AttributionSettings(enabled: false));

      mapboxMap.setCamera(CameraOptions(
        center: Point(coordinates: Position(-74.0060, 40.7128)),
        zoom: 12.0,
      ));

      setState(() {});
    } catch (e, st) {
      debugPrint('Map initialization failed: $e\n$st');
    }
  }

  void _onMapTap(MapContentGestureContext gestureContext) {
    final position = gestureContext.point.coordinates;
    ref.read(propertySearchViewModelProvider.notifier).searchByFuzzyCoords(
      position.lat.toDouble(), 
      position.lng.toDouble(),
    );
  }

  String _getEffectiveStyle(MapLayerStyle preference, Brightness brightness) {
    if (preference == MapLayerStyle.satellite) {
      return MapboxStyles.SATELLITE_STREETS;
    }
    return brightness == Brightness.dark 
      ? MapboxStyles.DARK 
      : MapboxStyles.LIGHT;
  }

  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(propertySearchViewModelProvider);
    final mapPreference = ref.watch(mapStyleProvider);
    final brightness = Theme.of(context).brightness;
    
    final targetStyle = _getEffectiveStyle(mapPreference, brightness);

    // Update map style when preference changes (guarded to avoid calling in every build)
    if (mapboxMap != null && _currentStyle != targetStyle) {
      _currentStyle = targetStyle;
      mapboxMap!.loadStyleURI(targetStyle);
    } else {
      _currentStyle = targetStyle;
    }

    ref.listen(propertySearchViewModelProvider, (previous, next) {
      if (next.hasError && !(previous?.hasError ?? false)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(formatNetworkError(next.error)),
            duration: const Duration(seconds: 4),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: MediaQuery.of(context).padding.bottom + AppConstants.bottomNavBarHeight - 8,
            ),
          ),
        );
        _skipNextPropertyFlyTo = false;
        return;
      }

      final property = next.value;
      if (property != null && property.coordinates != null && mapboxMap != null) {
        final coords = property.coordinates!;
        if (coords.latitude != null && coords.longitude != null) {
          final position = Position(coords.longitude!, coords.latitude!);

          if (!_skipNextPropertyFlyTo) {
            final screenHeight = MediaQuery.of(context).size.height;
            final cardHeight = screenHeight * 0.4;
            mapboxMap!.flyTo(
              CameraOptions(
                center: Point(coordinates: position),
                zoom: 16.0,
                padding: MbxEdgeInsets(
                  top: 0,
                  left: 0,
                  bottom: cardHeight,
                  right: 0,
                ),
              ),
              MapAnimationOptions(duration: 1500),
            );
          }
          _skipNextPropertyFlyTo = false;

          circleAnnotationManager?.deleteAll();
          circleAnnotationManager?.create(CircleAnnotationOptions(
            geometry: Point(coordinates: position),
            circleColor: Theme.of(context).colorScheme.accentColor.toARGB32(),
            circleRadius: 8.0,
            circleStrokeWidth: 3.0,
            circleStrokeColor: const Color(0xFFE5E2E1).toARGB32(),
          ));
        }
      }
    });

    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          MapWidget(
            key: const ValueKey("mapWidget"),
            styleUri: targetStyle,
            onMapCreated: _onMapCreated,
            onTapListener: _onMapTap,
          ),
          
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: AddressSearchBar(
                  mapboxMap: mapboxMap,
                  onAutocompleteNavigating: () => _skipNextPropertyFlyTo = true,
                ),
              ),
            ),
          ),

          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            bottom: (searchState.value != null || searchState.isLoading)
                ? (screenHeight * 0.5) + 16
                : MediaQuery.of(context).padding.bottom + AppConstants.bottomNavBarHeight + 16,
            right: 16,
            child: const MapLayerToggle(),
          ),

          if (searchState.value != null || searchState.isLoading)
            const Align(
              alignment: Alignment.bottomCenter,
              child: PropertyDetailsSheet(),
            ),
        ],
      ),
    );
  }
}
