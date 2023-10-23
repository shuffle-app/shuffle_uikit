import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class LocationDetailsSheet extends StatefulWidget {
  final LocationDetailsSheetController controller;
  final VoidCallback? onLocationConfirmed;
  final ValueChanged<KnownLocation>? onKnownLocationConfirmed;
  final void Function(String placeName)? onConfirmPlaceTap;
  final List<String>? suggestionPlaces;
  final VoidCallback onNewPlaceTap;

  const LocationDetailsSheet({
    super.key,
    required this.controller,
    required this.onNewPlaceTap,
    this.onLocationConfirmed,
    this.onKnownLocationConfirmed,
    this.onConfirmPlaceTap,
    this.suggestionPlaces,
  });

  @override
  State<LocationDetailsSheet> createState() => _LocationDetailsSheetState();
}

class _LocationDetailsSheetState extends State<LocationDetailsSheet> {
  bool _isNewPlaceTapped = false;

  @override
  Widget build(BuildContext context) {
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
      child: _isNewPlaceTapped
          ? LocationSelectionWidget(
              knownLocations: widget.controller.knownLocations,
              onKnownLocationConfirmed: widget.onKnownLocationConfirmed,
            )
          : LocationSelectionWidget.suggestions(
              places: widget.suggestionPlaces,
              onConfirmPlaceTap: widget.onConfirmPlaceTap,
              onNewPlaceTap: () {
                widget.onNewPlaceTap.call();
                setState(() => _isNewPlaceTapped = true);
              },
            ),
    );
  }
}

class LocationDetailsSheetController {
  final StreamController<LocationDetailsSheetState> _sheetStateController =
      StreamController<LocationDetailsSheetState>();

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
