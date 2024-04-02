import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitMiniMapWidget extends StatefulWidget {
  final void Function(double lat, double lng)? onMapTap;
  final KnownLocation? initialLocation;

  const UiKitMiniMapWidget({
    Key? key,
    this.onMapTap,
    this.initialLocation,
  }) : super(key: key);

  @override
  State<UiKitMiniMapWidget> createState() => _UiKitMiniMapWidgetState();
}

class _UiKitMiniMapWidgetState extends State<UiKitMiniMapWidget> {
  late Set<Marker> selectedPoint = {
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(widget.initialLocation?.latitude ?? 25.276987, widget.initialLocation?.longitude ?? 55.296249),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(widget.initialLocation?.latitude ?? 25.276987, widget.initialLocation?.longitude ?? 55.296249),
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
