import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class LocationSelectionWidget extends StatefulWidget {
  const LocationSelectionWidget({
    super.key,
    required this.knownLocations,
    required this.onKnownLocationConfirmed,
    this.height,
  })  : places = null,
        onConfirmPlaceTap = null,
        onNewPlaceTap = null,
        _selectionType = _SuggestionType.known;

  const LocationSelectionWidget.suggestions({
    super.key,
    required this.places,
    required this.onConfirmPlaceTap,
    required this.onNewPlaceTap,
    this.height,
  })  : onKnownLocationConfirmed = null,
        knownLocations = null,
        _selectionType = _SuggestionType.suggestion;

  final _SuggestionType _selectionType;

  final List<KnownLocation>? knownLocations;
  final ValueChanged<KnownLocation>? onKnownLocationConfirmed;
  final double? height;

  final List<String>? places;
  final void Function(String placeName)? onConfirmPlaceTap;
  final VoidCallback? onNewPlaceTap;

  @override
  State<LocationSelectionWidget> createState() => _LocationSelectionWidgetState();
}

class _LocationSelectionWidgetState extends State<LocationSelectionWidget> {
  bool _isPlaceEmpty() {
    if ((widget.places?.isEmpty ?? true) && (widget.knownLocations?.isEmpty ?? true)) {
      return true;
    }
    return false;
  }

  int _selectedIndex = 0;

  @override
  void didUpdateWidget(LocationSelectionWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() => _selectedIndex = 0);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final suggestionType = widget._selectionType == _SuggestionType.suggestion;

    return UiKitCardWrapper(
      color: theme?.colorScheme.inversePrimary,
      height: _isPlaceEmpty() ? null : widget.height ?? 0.45.sh,
      child: Column(
        children: [
          if (!_isPlaceEmpty())
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.only(
                  left: EdgeInsetsFoundation.horizontal16,
                  right: EdgeInsetsFoundation.horizontal16,
                  top: EdgeInsetsFoundation.vertical16,
                ),
                itemCount: suggestionType ? widget.places!.length : widget.knownLocations!.length,
                itemBuilder: (_, index) => GestureDetector(
                  onTap: suggestionType ? null : () => setState(() => _selectedIndex = index),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          '${index + 1}. ${suggestionType ? widget.places![index] : widget.knownLocations![index].title}',
                          style: theme?.regularTextTheme.caption1.copyWith(
                            color: theme.colorScheme.primary,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SpacingFoundation.verticalSpace16,
                      suggestionType
                          ? context.smallButton(
                              backgroundColor: theme?.colorScheme.primary,
                              color: Colors.transparent,
                              data: BaseUiKitButtonData(
                                onPressed: () => widget.onConfirmPlaceTap?.call(widget.places![index]),
                                text: 'confirm',
                              ),
                            )
                          : UiKitRadio(selected: _selectedIndex == index),
                    ],
                  ),
                ),
                separatorBuilder: (_, __) => SpacingFoundation.verticalSpace14,
              ),
            ),
          SpacingFoundation.verticalSpace16,
          context
              .gradientButton(
                data: BaseUiKitButtonData(
                  onPressed: () => suggestionType
                      ? widget.onNewPlaceTap?.call()
                      : widget.knownLocations?.isEmpty ?? true
                          ? null
                          : widget.onKnownLocationConfirmed?.call(
                              widget.knownLocations![_selectedIndex],
                            ),
                  text: suggestionType ? 'new place' : 'confirm',
                  fit: ButtonFit.fitWidth,
                ),
              )
              .paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16),
        ],
      ).paddingOnly(
        bottom: EdgeInsetsFoundation.vertical16,
      ),
    );
  }
}

enum _SuggestionType {
  suggestion,
  known,
}
