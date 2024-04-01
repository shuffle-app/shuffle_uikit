import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UiKitMiniMapWidget extends StatefulWidget {
  final void Function(double lat, double lng)? onMapTap;

  const UiKitMiniMapWidget({
    Key? key,
    this.onMapTap,
  }) : super(key: key);

  @override
  State<UiKitMiniMapWidget> createState() => _UiKitMiniMapWidgetState();
}

class _UiKitMiniMapWidgetState extends State<UiKitMiniMapWidget> {
  Set<Marker> selectedPoint = {
    Marker(
      markerId: MarkerId('1'),
      position: const LatLng(25.276987, 55.296249),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: const CameraPosition(
        target: LatLng(25.276987, 55.296249),
        zoom: 14.4746,
      ),
      markers: selectedPoint,
      onTap: (latLng) {
        setState(() {
          selectedPoint = {
            Marker(
              markerId: MarkerId('1'),
              position: latLng,
            ),
          };
        });
        widget.onMapTap?.call(latLng.latitude, latLng.longitude);
      },
    );
  }
}
