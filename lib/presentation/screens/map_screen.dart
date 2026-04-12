import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import '../widgets/address_search_bar.dart';
import '../widgets/property_details_sheet.dart';
import '../viewmodels/property_search_viewmodel.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  MapboxMap? mapboxMap;
  CircleAnnotationManager? circleAnnotationManager;

  void _onMapCreated(MapboxMap mapboxMap) async {
    this.mapboxMap = mapboxMap;
    circleAnnotationManager = await mapboxMap.annotations.createCircleAnnotationManager();
    
    mapboxMap.setCamera(CameraOptions(
      center: Point(coordinates: Position(-74.0060, 40.7128)), // NYC
      zoom: 12.0,
    ));
  }

  void _onMapTap(MapContentGestureContext gestureContext) {
    final position = gestureContext.point.coordinates;
    ref.read(propertySearchViewModelProvider.notifier).searchByFuzzyCoords(
      position.lat.toDouble(), 
      position.lng.toDouble(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(propertySearchViewModelProvider);

    // Listen for successful searches to fly the camera
    ref.listen(propertySearchViewModelProvider, (previous, next) {
      final property = next.value;
      if (property != null && property.coordinates != null && mapboxMap != null) {
        final coords = property.coordinates!;
        if (coords.latitude != null && coords.longitude != null) {
          final position = Position(coords.longitude!, coords.latitude!);
          
          mapboxMap!.flyTo(
            CameraOptions(
              center: Point(coordinates: position),
              zoom: 16.0,
            ),
            MapAnimationOptions(duration: 1500),
          );

          circleAnnotationManager?.deleteAll();
          circleAnnotationManager?.create(CircleAnnotationOptions(
            geometry: Point(coordinates: position),
            circleColor: Colors.blue.value,
            circleRadius: 8.0,
            circleStrokeWidth: 3.0,
            circleStrokeColor: Colors.white.value,
          ));
        }
      }
    });

    return Scaffold(
      body: Stack(
        children: [
          MapWidget(
            key: const ValueKey("mapWidget"),
            styleUri: MapboxStyles.SATELLITE_STREETS,
            onMapCreated: _onMapCreated,
            onTapListener: _onMapTap,
          ),
          const SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: AddressSearchBar(),
              ),
            ),
          ),
          // Sheet anchored to bottom — map above remains tappable
          if (searchState.value != null && !searchState.isLoading)
            const Align(
              alignment: Alignment.bottomCenter,
              child: PropertyDetailsSheet(),
            ),
        ],
      ),
    );
  }
}
