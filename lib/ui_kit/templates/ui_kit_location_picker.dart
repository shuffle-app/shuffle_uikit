import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitLocationPicker extends StatelessWidget {
  final TextEditingController searchController;
  final VoidCallback? onSearchTapped;
  final VoidCallback? onPickFromMap;
  final VoidCallback? onSearchInputCleaned;
  final ValueChanged<LocationSuggestion>? onSuggestionChosen;
  final LocationPickerSearchOverlayController locationPickerSearchOverlayController;
  final LocationDetailsSheetController locationDetailsSheetController;
  final ValueChanged<GoogleMapController> onMapCreated;
  final ValueChanged<CameraPosition> onCameraMoved;
  final ValueChanged<LatLng>? onMapTapped;
  final CameraPosition initialCameraPosition;
  final Set<Marker> markers;
  final VoidCallback? onLocationConfirmed;
  final ValueChanged<KnownLocation>? onKnownLocationConfirmed;
  final VoidCallback? onCurrentLocationTapped;
  final List<String>? suggestionPlaces;
  final void Function(String placeName)? onConfirmPlaceTap;
  final VoidCallback onNewPlaceTap;

  UiKitLocationPicker({
    super.key,
    this.onSearchTapped,
    this.onPickFromMap,
    this.onSuggestionChosen,
    this.onSearchInputCleaned,
    this.onLocationConfirmed,
    this.onKnownLocationConfirmed,
    this.onMapTapped,
    this.onCurrentLocationTapped,
    this.suggestionPlaces,
    this.onConfirmPlaceTap,
    required this.onNewPlaceTap,
    required this.onMapCreated,
    required this.onCameraMoved,
    required this.searchController,
    required this.locationDetailsSheetController,
    required this.locationPickerSearchOverlayController,
    required this.initialCameraPosition,
    required this.markers,
  });

  late final FocusNode _focusNode = FocusNode()
    ..addListener(() {
      if (!_focusNode.hasFocus) {
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
        );
      }
      if (focusNotifier.value != _focusNode.hasFocus) focusNotifier.value = _focusNode.hasFocus;
    });

  late final ValueNotifier<bool> focusNotifier = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        GoogleMap(
          onMapCreated: onMapCreated,
          initialCameraPosition: initialCameraPosition,
          onCameraMove: onCameraMoved,
          markers: markers,
          webGestureHandling: WebGestureHandling.cooperative,
          onTap: onMapTapped,
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          myLocationEnabled: true,
        ),
        LocationPickerSearchOverlay(
          onSuggestionChosen: (suggestion) {
            locationPickerSearchOverlayController.updateState(LocationPickerOverlayState.hidden);
            locationDetailsSheetController.updateSheetState(LocationDetailsSheetState.visible);
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
          bottom: EdgeInsetsFoundation.vertical24,
          width: kIsWeb ? 0.2.sw : null,
          left: kIsWeb ? null : SpacingFoundation.horizontalSpacing16,
          right: kIsWeb ? null : SpacingFoundation.horizontalSpacing16,
          child: PointerInterceptor(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                StreamBuilder<LocationDetailsSheetState>(
                  stream: locationDetailsSheetController.sheetStateStream,
                  builder: (context, snapshot) {
                    if (snapshot.data == LocationDetailsSheetState.hidden) return SpacingFoundation.none;

                    return Align(
                      alignment: Alignment.centerRight,
                      child: context.smallButton(
                        color: Colors.white,
                        data: BaseUiKitButtonData(
                          icon: ImageWidget(
                            svgAsset: GraphicsFoundation.instance.svg.location,
                          ),
                          onPressed: onCurrentLocationTapped,
                        ),
                      ),
                    );
                  },
                ),
                SpacingFoundation.verticalSpace12,
                LocationDetailsSheet(
                  onKnownLocationConfirmed: onKnownLocationConfirmed,
                  onLocationConfirmed: onLocationConfirmed,
                  controller: locationDetailsSheetController,
                  suggestionPlaces: suggestionPlaces,
                  onConfirmPlaceTap: onConfirmPlaceTap,
                  onNewPlaceTap: onNewPlaceTap,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.viewPaddingOf(context).top + SpacingFoundation.verticalSpacing16,
          left: SpacingFoundation.horizontalSpacing16,
          width: (kIsWeb ? 0.3.sw : 1.sw) - SpacingFoundation.horizontalSpacing32,
          child: PointerInterceptor(
            child: UiKitElevatedInputWithSwitchingPrefix(
              focusNode: _focusNode,
              onTap: () {
                onSearchTapped?.call();
              },
              controller: searchController,
              hintText: 'Search',
              onInputCleaned: onSearchInputCleaned,
              prefix: UiKitSwitchableInputPrefix(
                secondary: GestureDetector(
                  onTap: () {
                    locationDetailsSheetController.updateSheetState(LocationDetailsSheetState.visible);
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
        ),
      ],
    );
  }
}
