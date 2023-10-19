import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class LocationDetailsSheet extends StatelessWidget {
  final LocationDetailsSheetController controller;
  final VoidCallback? onLocationConfirmed;
  final ValueChanged<KnownLocation>? onKnownLocationConfirmed;

  const LocationDetailsSheet({
    super.key,
    required this.controller,
    this.onLocationConfirmed,
    this.onKnownLocationConfirmed,
  });

  @override
  Widget build(BuildContext context) {
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;

    return StreamBuilder<LocationDetailsSheetState>(
      stream: controller.sheetStateStream,
      builder: (context, snapshot) {
        final state = snapshot.data;

        final expanded = state == LocationDetailsSheetState.expanded;
        final hidden = state == LocationDetailsSheetState.hidden;
        final hasLocations = controller.knownLocations.isNotEmpty;
        final canShowList = expanded && hasLocations;

        if (hidden) return SpacingFoundation.none;

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadiusFoundation.all24,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 1,
                offset: const Offset(0, 1),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: UiKitCardWrapper(
            borderRadius: BorderRadiusFoundation.all24,
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  height: canShowList ? 0.32.sh : 0,
                  child: canShowList
                      ? ListView.separated(
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            final location = controller.knownLocations.elementAt(index);

                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    location.title,
                                    style: regularTextTheme?.caption1.copyWith(color: Colors.black),
                                  ),
                                ),
                                context.smallButton(
                                  color: Colors.black,
                                  data: BaseUiKitButtonData(
                                    text: 'Confirm',
                                    onPressed: () => onKnownLocationConfirmed?.call(location),
                                  ),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) => SpacingFoundation.verticalSpace12,
                          itemCount: controller.knownLocations.length,
                        )
                      : SpacingFoundation.none,
                ),
                if (expanded && hasLocations) SpacingFoundation.verticalSpace12,
                context.gradientButton(
                  data: BaseUiKitButtonData(
                    fit: ButtonFit.fitWidth,
                    text: !controller.hasSelectedPlace ? 'New place' : 'Confirm',
                    onPressed: onLocationConfirmed,
                  ),
                ),
              ],
            ).paddingSymmetric(
              horizontal: SpacingFoundation.horizontalSpacing16,
              vertical: SpacingFoundation.verticalSpacing12,
            ),
          ),
        );
      },
    );
  }
}

class LocationDetailsSheetController {
  final StreamController<LocationDetailsSheetState> _sheetStateController = StreamController<LocationDetailsSheetState>();

  late Stream<LocationDetailsSheetState> sheetStateStream = _sheetStateController.stream.asBroadcastStream();

  List<KnownLocation> knownLocations = [];

  LocationDetailsSheetState currentState = LocationDetailsSheetState.hidden;

  bool get hasSelectedPlace => currentState == LocationDetailsSheetState.placeSelected;

  void updateSheetState(LocationDetailsSheetState state) {
    _sheetStateController.add(state);
    currentState = state;
  }

  void updateKnownLocations(List<KnownLocation> knownLocations) {
    this.knownLocations = knownLocations;
    if (knownLocations.isNotEmpty) {
      updateSheetState(LocationDetailsSheetState.expanded);
    } else {
      updateSheetState(LocationDetailsSheetState.hidden);
    }
  }

  void dispose() {
    _sheetStateController.close();
  }
}

enum LocationDetailsSheetState {
  hidden,
  visible,
  expanded,
  placeSelected,
}
