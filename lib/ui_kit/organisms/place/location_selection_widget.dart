import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class LocationSelectionWidget extends StatelessWidget {
  const LocationSelectionWidget({
    super.key,
    required this.places,
    required this.onConfirmTap,
    required this.onNewPlaceTap,
    this.height,
  });

  final List<String> places;
  final void Function(String placeName) onConfirmTap;
  final VoidCallback onNewPlaceTap;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return UiKitCardWrapper(
      color: theme?.colorScheme.inversePrimary,
      height: height ?? 0.45.sh,
      child: Column(
        children: [
          Expanded(
            child: places.isNotEmpty
                ? ListView.separated(
                    padding: EdgeInsets.only(
                      left: EdgeInsetsFoundation.horizontal16,
                      right: EdgeInsetsFoundation.horizontal16,
                      top: EdgeInsetsFoundation.vertical16,
                    ),
                    itemCount: places.length,
                    itemBuilder: (_, index) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            '${index + 1}. ${places[index]}',
                            style: theme?.regularTextTheme.caption1.copyWith(
                              color: theme.colorScheme.primary,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SpacingFoundation.verticalSpace16,
                        context.smallButton(
                          backgroundColor: theme?.colorScheme.primary,
                          color: Colors.transparent,
                          data: BaseUiKitButtonData(
                            onPressed: () => onConfirmTap(places[index]),
                            text: 'confirm',
                          ),
                        )
                      ],
                    ),
                    separatorBuilder: (_, __) => SpacingFoundation.verticalSpace14,
                  )
                : Center(
                    child: Text(
                      'No saved places found.',
                      style: theme?.regularTextTheme.caption1.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
          ),
          SpacingFoundation.verticalSpace16,
          context
              .gradientButton(
                data: BaseUiKitButtonData(
                  onPressed: onNewPlaceTap,
                  text: 'new place',
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
