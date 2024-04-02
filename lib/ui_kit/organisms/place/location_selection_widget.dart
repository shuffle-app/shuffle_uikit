import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class LocationSelectionWidget extends StatefulWidget {
  const LocationSelectionWidget.suggestions({
    super.key,
    required this.places,
    required this.onLocationChanged,
    required this.onLocationConfirmed,
    this.height,
    this.canShowList,
  })  : onKnownLocationConfirmed = null,
        knownLocations = null,
        onNewPlaceTap = null,
        _selectionType = _SuggestionType.suggestion;

  const LocationSelectionWidget({
    super.key,
    required this.onKnownLocationConfirmed,
    required this.knownLocations,
    required this.onNewPlaceTap,
    this.height,
    this.canShowList,
  })  : onLocationChanged = null,
        places = null,
        onLocationConfirmed = null,
        _selectionType = _SuggestionType.known;

  final _SuggestionType _selectionType;

  final List<KnownLocation>? knownLocations;
  final ValueChanged<KnownLocation>? onKnownLocationConfirmed;
  final bool? canShowList;
  final double? height;

  final List<KnownLocation>? places;
  final void Function(KnownLocation location)? onLocationChanged;
  final VoidCallback? onNewPlaceTap;
  final VoidCallback? onLocationConfirmed;

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
    if (oldWidget.places != widget.places ||
        oldWidget.knownLocations != widget.knownLocations ||
        widget._selectionType != oldWidget._selectionType) {
      setState(() => _selectedIndex = 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final isSuggestions = widget._selectionType == _SuggestionType.suggestion;

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
                itemCount: isSuggestions ? widget.places!.length : widget.knownLocations!.length,
                itemBuilder: (_, index) => GestureDetector(
                  onTap: isSuggestions
                      ? () {
                          setState(() => _selectedIndex = index);
                          widget.onLocationChanged?.call(widget.places![index]);
                        }
                      : null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          '${index + 1}. ${isSuggestions ? widget.places![index].title : widget.knownLocations![index].title} ',
                          style: theme?.regularTextTheme.caption1.copyWith(
                            color: theme.colorScheme.primary,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SpacingFoundation.verticalSpace16,
                      isSuggestions
                          ? UiKitRadio(selected: _selectedIndex == index)
                          : context.smallButton(
                              data: BaseUiKitButtonData(
                                onPressed: () => widget.onKnownLocationConfirmed?.call(widget.knownLocations![index]),
                                text: S.of(context).Confirm,
                              ),
                            ),
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
                  onPressed: () => isSuggestions ? widget.onLocationConfirmed?.call() : widget.onNewPlaceTap?.call(),
                  text: isSuggestions ? S.of(context).Confirm : S.of(context).NewPlace,
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
