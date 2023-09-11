import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitBorderedChipWithIcon extends StatelessWidget {
  final String title;
  final ImageWidget icon;
  final VoidCallback? onPressed;
  final bool isSelected;

  const UiKitBorderedChipWithIcon({
    Key? key,
    required this.title,
    required this.icon,
    this.onPressed,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.uiKitTheme?.colorScheme;

    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusFoundation.all24,
        side: BorderSide(
          width: 2,
          color: isSelected ? Colors.transparent : Colors.white,
        ),
      ),
      color: isSelected ? colorScheme?.primary : colorScheme?.inversePrimary,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onPressed,
        child: Ink(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SpacingFoundation.horizontalSpace8,
              ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 16.w),
                  child: ClipRRect(
                    borderRadius: BorderRadiusFoundation.all24,
                    child: icon,
                  )),
              SpacingFoundation.horizontalSpace8,
              Text(
                title,
                style: context.uiKitTheme?.boldTextTheme.caption1Bold.copyWith(
                  color: isSelected ? colorScheme?.inversePrimary : colorScheme?.primary,
                ),
              ),
            ],
          ).paddingOnly(right: SpacingFoundation.horizontalSpacing8),
        ),
      ),
    );
  }
}

// class UiKitBorderedChipWithIconData {
//   final String title;
//   final ImageWidget icon;
//   final bool isSelected;
//   final VoidCallback? onPressed;
//
//   UiKitBorderedChipWithIconData({
//     required this.title,
//     required this.icon,
//     required this.isSelected,
//     this.onPressed,
//   });
// }
