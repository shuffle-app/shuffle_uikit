import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class LocationPickerPage extends StatefulWidget {
  const LocationPickerPage({super.key});

  @override
  State<LocationPickerPage> createState() => _LocationPickerPageState();
}

class _LocationPickerPageState extends State<LocationPickerPage> {
  final searchController = TextEditingController();
  final LocationPickerSearchOverlayController locationPickerSearchOverlayController = LocationPickerSearchOverlayController();

  @override
  void dispose() {
    searchController.dispose();
    locationPickerSearchOverlayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UiKitLocationPicker(
        onMapCreated: (controller) {},
        initialCameraPosition: const CameraPosition(
          target: LatLng(0, 0),
          zoom: 16,
        ),
        onCameraMoved: (position) {},
        onMapTapped: (latLng) {},
        markers: const {},
        onSuggestionChosen: (suggestion) {},
        onSearchInputCleaned: () {},
        searchController: searchController,
        locationPickerSearchOverlayController: locationPickerSearchOverlayController,
        onSearchTapped: () {
          SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
          );
          locationPickerSearchOverlayController.updateState(LocationPickerOverlayState.noSuggestions);
        },
        onPickFromMap: () {
          SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
          );
        },
      ),
    );
  }
}
