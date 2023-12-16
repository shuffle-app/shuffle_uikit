import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class LocationPickerSearchOverlay extends StatefulWidget {
  final VoidCallback? onPickFromMap;
  final ValueChanged<LocationSuggestion>? onSuggestionChosen;
  final LocationPickerSearchOverlayController controller;
  final Duration? animationDuration;

  const LocationPickerSearchOverlay({
    super.key,
    this.onPickFromMap,
    this.onSuggestionChosen,
    required this.controller,
    this.animationDuration,
  });

  @override
  State<LocationPickerSearchOverlay> createState() => _LocationPickerSearchOverlayState();
}

class _LocationPickerSearchOverlayState extends State<LocationPickerSearchOverlay> {
  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return StreamBuilder<LocationPickerOverlayState>(
      stream: widget.controller.overlayStateStream,
      builder: (context, snapshot) {
        final state = snapshot.data;

        if (state == LocationPickerOverlayState.hidden) {
          return SpacingFoundation.none;
        }
        final noSuggestions = state == LocationPickerOverlayState.noSuggestions;
        final loaded = state == LocationPickerOverlayState.loaded;
        final loading = state == LocationPickerOverlayState.loading;
        final locationSuggestions = widget.controller.searchSuggestions;

        return ColoredBox(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 1.sh * 0.15,
              ),
              if (loaded)
                Expanded(
                  child: PointerInterceptor(
                      child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final suggestion = locationSuggestions.elementAt(index);

                      return UiKitLocationSearchTile(
                        isLast: (index + 1) == locationSuggestions.length,
                        title: suggestion.title,
                        subtitle: suggestion.subtitle,
                        onTap: () => widget.onSuggestionChosen?.call(suggestion),
                      );
                    },
                    itemCount: locationSuggestions.length,
                  )),
                ),
              if (noSuggestions)
                Expanded(
                  child: Center(
                    child: Text(
                      'No suggestions',
                      style: textTheme?.subHeadline.copyWith(color: Colors.black),
                    ),
                  ),
                ),
              if (loading)
                const Expanded(
                  child: AdaptiveLoader(),
                ),
              SpacingFoundation.verticalSpace16,
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const ImageWidget(
                    iconData: ShuffleUiKitIcons.mapOutlined,
                    color: ColorsFoundation.darkNeutral900,
                  ),
                  SpacingFoundation.horizontalSpace8,
                  Expanded(
                    child: Text(
                      'Pick on the map',
                      style: textTheme?.caption1Medium.copyWith(color: Colors.black),
                    ),
                  ),
                  SpacingFoundation.horizontalSpace8,
                  PointerInterceptor(
                    child: context.smallOutlinedButton(
                      color: Colors.black,
                      data: BaseUiKitButtonData(
                        iconInfo: BaseUiKitButtonIconData(
                          iconData: ShuffleUiKitIcons.chevronright,
                        ),
                        onPressed: widget.onPickFromMap,
                      ),
                    ),
                  ),
                ],
              ),
              SpacingFoundation.verticalSpace24,
            ],
          ).paddingSymmetric(
            horizontal: SpacingFoundation.horizontalSpacing16,
          ),
        );
      },
    );
  }
}

class LocationPickerSearchOverlayController {
  final StreamController<LocationPickerOverlayState> _overlayStateStreamController =
      StreamController<LocationPickerOverlayState>();

  LocationSuggestion? selectedSuggestion;

  List<LocationSuggestion> searchSuggestions = List<LocationSuggestion>.empty(growable: true);

  LocationPickerOverlayState currentState = LocationPickerOverlayState.hidden;

  late Stream<LocationPickerOverlayState> overlayStateStream = _overlayStateStreamController.stream.asBroadcastStream();

  LocationPickerSearchOverlayController() {
    _overlayStateStreamController.add(LocationPickerOverlayState.hidden);
  }

  void updateSuggestions(List<LocationSuggestion> suggestions) {
    searchSuggestions = suggestions;
    _overlayStateStreamController.add(LocationPickerOverlayState.loaded);
  }

  void updateState(LocationPickerOverlayState state) {
    _overlayStateStreamController.add(state);
    currentState = state;
  }

  void updateSelectedSuggestion(LocationSuggestion? suggestion) {
    selectedSuggestion = suggestion;
  }

  void dispose() {
    _overlayStateStreamController.close();
  }
}

enum LocationPickerOverlayState { show, hidden, loading, loaded, noSuggestions }
