import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitLocationPicker extends StatelessWidget {
  final TextEditingController searchController;
  final MapWidget map;
  final VoidCallback? onSearchTapped;
  final VoidCallback? onPickFromMap;
  final ValueChanged<LocationSuggestion>? onSuggestionChosen;
  final LocationPickerSearchOverlayController locationPickerSearchOverlayController;

  UiKitLocationPicker({
    super.key,
    required this.searchController,
    this.onSearchTapped,
    this.onPickFromMap,
    this.onSuggestionChosen,
    required this.map,
    required this.locationPickerSearchOverlayController,
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
        Container(
          color: Colors.cyan,
          child: map,
        ),
        LocationPickerSearchOverlay(
          onSuggestionChosen: (suggestion) {
            locationPickerSearchOverlayController.updateState(LocationPickerOverlayState.hidden);
            searchController.text = suggestion.title;
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
            prefix: SwitchablePrefix(
              secondary: GestureDetector(
                onTap: () {
                  locationPickerSearchOverlayController.updateState(LocationPickerOverlayState.hidden);
                  _focusNode.unfocus();
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
