import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:housely/core/enums/enums.dart';
import 'package:housely/core/widgets/app_button.dart';
import 'package:housely/core/widgets/search_bar_widget.dart';
import 'package:housely/features/choose_location_screen/presentation/widgets/location_card.dart';
import 'package:housely/features/choose_location_screen/presentation/widgets/map_location_picker.dart';
import 'package:latlong2/latlong.dart';

class ChooseLocationScreen extends StatefulWidget {
  const ChooseLocationScreen({super.key});

  @override
  State<ChooseLocationScreen> createState() => _ChooseLocationScreenState();
}

class _ChooseLocationScreenState extends State<ChooseLocationScreen> {
  LatLng? selectedLatlng;
  String address = "Fetching your location...";
  bool _mapReady = false;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  // Modern Geolocator usage
  Future<Position?> _determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() => address = "Location services are disabled.");
      return null;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() => address = "Location permission denied.");
        return null;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      setState(() => address = "Location permission permanently denied.");
      return null;
    }

    try {
      final LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.high,
      );

      return await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );
    } catch (e) {
      setState(() => address = "Error fetching location: $e");
      return null;
    }
  }

  Future<void> _getCurrentLocation() async {
    Position? position = await _determinePosition();
    if (position != null) {
      selectedLatlng = LatLng(position.latitude, position.longitude);
      _updateAddress(selectedLatlng!);
      setState(() {}); // rebuild to show map
    }
  }

  Future<void> _updateAddress(LatLng latLng) async {
    try {
      final placemarks = await placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );
      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        setState(() {
          address = '${place.street}, ${place.subLocality}, ${place.locality}';
        });
      }
    } catch (_) {
      setState(() {
        address = "Unable to fetch address";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (selectedLatlng != null)
            Positioned.fill(
              child: MapLocationPicker(
                initialLocation: selectedLatlng!,
                onMapReady: () {
                  setState(() => _mapReady = true);
                },
                onLocationChnaged: (latLng) {
                  selectedLatlng = latLng;
                  _updateAddress(latLng);
                },
              ),
            )
          else
            const Center(child: CircularProgressIndicator()),

          Center(
            child: Icon(Icons.location_pin, size: 52, color: Colors.orange),
          ),

          ///SEARCH BAR
          if (_mapReady)
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: AnimatedOpacity(
                  opacity: 1,
                  duration: const Duration(milliseconds: 300),
                  child: LocationSearchBar(
                    onChanged: (value) {},
                    onBack: () => Navigator.pop(context),
                  ),
                ),
              ),
            ),

          Positioned(
            left: 16,
            right: 16,
            bottom: 90,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                LocationCard(address: address),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,

                  child: AppButton(
                    size: ButtonSize.large,
                    label: "Choose Location",
                    onPressed: selectedLatlng == null
                        ? null
                        : () {
                            ///
                          },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
