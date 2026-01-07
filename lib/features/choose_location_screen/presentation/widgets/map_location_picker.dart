import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapLocationPicker extends StatefulWidget {
  final LatLng initialLocation;
  final ValueChanged<LatLng> onLocationChnaged;
  final VoidCallback onMapReady;

  const MapLocationPicker({
    super.key,
    required this.initialLocation,
    required this.onLocationChnaged,
    required this.onMapReady,
  });

  @override
  State<MapLocationPicker> createState() => _MapLocationPickerState();
}

class _MapLocationPickerState extends State<MapLocationPicker> {
  late final MapController _mapController;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _mapController.move(widget.initialLocation, 16);
      widget.onMapReady(); // ✅ Map is ready
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        initialCenter: widget.initialLocation,
        initialZoom: 16,
        onPositionChanged: (position, hasGesture) {
          if (hasGesture) {
            _debounce?.cancel();
            _debounce = Timer(
              const Duration(milliseconds: 600),
              () => widget.onLocationChnaged(position.center),
            );
          }
        },
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.housely.app',
        ),
      ],
    );
  }
}
