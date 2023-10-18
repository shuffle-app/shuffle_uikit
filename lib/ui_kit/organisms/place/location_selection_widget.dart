import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class LocationSelectionWidget extends StatefulWidget {
  const LocationSelectionWidget({
    super.key,
    required this.selectablePlaces,
    required this.onConfirmTap,
    this.height,
  })  : places = null,
        onConfirmPlaceTap = null,
        onNewPlaceTap = null,
        assert(selectablePlaces != null, 'selectablePlaces must be not null.');

  const LocationSelectionWidget.suggestions({
    super.key,
    required this.places,
    required this.onConfirmPlaceTap,
    required this.onNewPlaceTap,
    this.height,
  })  : onConfirmTap = null,
        selectablePlaces = null,
        assert(places != null, 'places must be not null.');

  final List<({String address, double latitude, double longitude})>? selectablePlaces;
  final void Function(String address, double latitude, double longitude)? onConfirmTap;
  final double? height;

  final List<String>? places;
  final void Function(String placeName)? onConfirmPlaceTap;
  final VoidCallback? onNewPlaceTap;

  @override
  State<LocationSelectionWidget> createState() => _LocationSelectionWidgetState();
}

class _LocationSelectionWidgetState extends State<LocationSelectionWidget> {
  bool _isPlaceEmpty() {
    if ((widget.places?.isEmpty ?? true) && (widget.selectablePlaces?.isEmpty ?? true)) {
      return true;
    }
    return false;
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

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
                itemCount: widget.places != null ? widget.places!.length : widget.selectablePlaces!.length,
                itemBuilder: (_, index) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        '${index + 1}. ${widget.places != null ? widget.places![index] : widget.selectablePlaces![index].address}',
                        style: theme?.regularTextTheme.caption1.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SpacingFoundation.verticalSpace16,
                    widget.places != null
                        ? context.smallButton(
                            backgroundColor: theme?.colorScheme.primary,
                            color: Colors.transparent,
                            data: BaseUiKitButtonData(
                              onPressed: () => widget.onConfirmPlaceTap?.call(widget.places![index]),
                              text: 'confirm',
                            ),
                          )
                        : GestureDetector(
                            onTap: () => setState(() => selectedIndex = index),
                            child: UiKitRadio(selected: selectedIndex == index),
                          ),
                  ],
                ),
                separatorBuilder: (_, __) => SpacingFoundation.verticalSpace14,
              ),
            ),
          SpacingFoundation.verticalSpace16,
          context
              .gradientButton(
                data: BaseUiKitButtonData(
                  onPressed: () => widget.places != null
                      ? widget.onNewPlaceTap?.call()
                      : widget.onConfirmTap?.call(
                          widget.selectablePlaces![selectedIndex].address,
                          widget.selectablePlaces![selectedIndex].latitude,
                          widget.selectablePlaces![selectedIndex].longitude,
                        ),
                  text: widget.places != null ? 'new place' : 'confirm',
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
