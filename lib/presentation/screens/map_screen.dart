import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import '../widgets/search_bar/address_search_bar.dart';
import '../widgets/property_details_sheet.dart';
import '../widgets/map_layer_toggle.dart';
import '../viewmodels/property_search_viewmodel.dart';
import '../viewmodels/map_style_viewmodel.dart';
import '../../core/theme/app_theme.dart';

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
    this.mapboxMap = mapboxMap;
    circleAnnotationManager = await mapboxMap.annotations.createCircleAnnotationManager();
    
    // Clean up UI by removing Mapbox branding
    mapboxMap.logo.updateSettings(LogoSettings(enabled: false));
    mapboxMap.attribution.updateSettings(AttributionSettings(enabled: false));

    mapboxMap.setCamera(CameraOptions(
      center: Point(coordinates: Position(-74.0060, 40.7128)), // NYC
      zoom: 12.0,
    ));

    // Trigger rebuild so AddressSearchBar receives the MapboxMap reference.
    setState(() {});
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

    // Update map style if it change
    if (mapboxMap != null && _currentStyle != targetStyle) {
      _currentStyle = targetStyle;
      mapboxMap!.loadStyleURI(targetStyle);
    } else {
      _currentStyle = targetStyle;
    }

    // Listen for successful searches to fly the camera
    ref.listen(propertySearchViewModelProvider, (previous, next) {
      final property = next.value;
      if (property != null && property.coordinates != null && mapboxMap != null) {
        final coords = property.coordinates!;
        if (coords.latitude != null && coords.longitude != null) {
          final position = Position(coords.longitude!, coords.latitude!);

          // Skip flyTo when autocomplete already handled navigation to avoid
          // a duplicate camera animation (Requirement 4.2).
          if (!_skipNextPropertyFlyTo) {
            mapboxMap!.flyTo(
              CameraOptions(
                center: Point(coordinates: position),
                zoom: 16.0,
              ),
              MapAnimationOptions(duration: 1500),
            );
          }
          _skipNextPropertyFlyTo = false;

          circleAnnotationManager?.deleteAll();
          circleAnnotationManager?.create(CircleAnnotationOptions(
            geometry: Point(coordinates: position),
            circleColor: Theme.of(context).colorScheme.goldAccent.value,
            circleRadius: 8.0,
            circleStrokeWidth: 3.0,
            circleStrokeColor: const Color(0xFFE5E2E1).value,
          ));
        }
      }
    });

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenHeight = constraints.maxHeight;
          return Stack(
            children: [
              MapWidget(
                key: const ValueKey("mapWidget"),
                styleUri: targetStyle,
                onMapCreated: _onMapCreated,
                onTapListener: _onMapTap,
              ),
              
              // Header + Dropdown Overlay
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

              // Map Control Toggles (Floating)
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                bottom: (searchState.value != null || searchState.isLoading)
                    ? (screenHeight * 0.5) + 16
                    : 24 + MediaQuery.of(context).padding.bottom,
                right: 16,
                child: const MapLayerToggle(),
              ),

              // Sheet anchored to bottom — map above remains tappable
              if (searchState.value != null || searchState.isLoading)
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: PropertyDetailsSheet(),
                ),
            ],
          );
        },
      ),
    );
  }
}
