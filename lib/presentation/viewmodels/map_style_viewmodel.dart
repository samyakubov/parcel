import 'package:flutter_riverpod/flutter_riverpod.dart';

enum MapLayerStyle {
  standard,
  satellite,
}

class MapStyleNotifier extends Notifier<MapLayerStyle> {
  @override
  MapLayerStyle build() => MapLayerStyle.standard;

  void toggleStyle() {
    state = state == MapLayerStyle.standard 
      ? MapLayerStyle.satellite 
      : MapLayerStyle.standard;
  }
}

final mapStyleProvider = NotifierProvider<MapStyleNotifier, MapLayerStyle>(() {
  return MapStyleNotifier();
});
