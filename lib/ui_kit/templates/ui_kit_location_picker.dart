import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitLocationPicker extends StatelessWidget {
  final TextEditingController searchController;
  final VoidCallback? onSearchTapped;
  final VoidCallback? onPickFromMap;
  final VoidCallback? onSearchInputCleaned;
  final ValueChanged<LocationSuggestion>? onSuggestionChosen;
  final LocationPickerSearchOverlayController locationPickerSearchOverlayController;
  final ValueChanged<GoogleMapController> onMapCreated;
  final ValueChanged<CameraPosition> onCameraMoved;
  final ValueChanged<LatLng>? onMapTapped;
  final CameraPosition initialCameraPosition;
  final Set<Marker> markers;

  UiKitLocationPicker({
    super.key,
    required this.searchController,
    this.onSearchTapped,
    this.onPickFromMap,
    this.onSuggestionChosen,
    this.onSearchInputCleaned,
    required this.locationPickerSearchOverlayController,
    required this.onMapCreated,
    required this.onCameraMoved,
    this.onMapTapped,
    required this.initialCameraPosition,
    required this.markers,
  });

  late final FocusNode _focusNode = FocusNode()
    ..addListener(() {
      if (focusNotifier.value != _focusNode.hasFocus) focusNotifier.value = _focusNode.hasFocus;
    });

  late final ValueNotifier<bool> focusNotifier = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        GoogleMap(
          onMapCreated: onMapCreated,
          initialCameraPosition: initialCameraPosition,
          onCameraMove: onCameraMoved,
          markers: markers,
          onTap: onMapTapped,
        ),
        LocationPickerSearchOverlay(
          onSuggestionChosen: (suggestion) {
            locationPickerSearchOverlayController.updateState(LocationPickerOverlayState.hidden);
            _focusNode.unfocus();
            onSuggestionChosen?.call(suggestion);
          },
          onPickFromMap: () {
            locationPickerSearchOverlayController.updateState(LocationPickerOverlayState.hidden);
            onPickFromMap?.call();
            _focusNode.unfocus();
          },
          controller: locationPickerSearchOverlayController,
        ),
        Positioned(
          top: MediaQuery.of(context).viewPadding.top + SpacingFoundation.verticalSpacing16,
          left: SpacingFoundation.horizontalSpacing16,
          width: 1.sw - SpacingFoundation.horizontalSpacing32,
          child: UiKitElevatedInputWithSwitchingPrefix(
            focusNode: _focusNode,
            onTap: onSearchTapped,
            controller: searchController,
            hintText: 'Search',
            onInputCleaned: onSearchInputCleaned,
            prefix: UiKitSwitchableInputPrefix(
              secondary: GestureDetector(
                onTap: () {
                  locationPickerSearchOverlayController.updateState(LocationPickerOverlayState.hidden);
                  _focusNode.unfocus();
                  searchController.clear();
                },
                child: ImageWidget(
                  svgAsset: GraphicsFoundation.instance.svg.arrowLeft,
                  color: ColorsFoundation.darkNeutral900,
                ),
              ),
              primary: ImageWidget(
                svgAsset: GraphicsFoundation.instance.svg.landmark,
                color: ColorsFoundation.darkNeutral900,
              ),
              notifier: focusNotifier,
            ),
          ),
        ),
      ],
    );
  }
}
