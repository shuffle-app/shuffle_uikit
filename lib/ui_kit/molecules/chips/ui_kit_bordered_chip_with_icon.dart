import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitBorderedChipWithIcon extends StatelessWidget {
  final String title;
  final ImageWidget icon;
  final VoidCallback? onPressed;
  final bool isSelected;

  const UiKitBorderedChipWithIcon({
    super.key,
    required this.title,
    required this.icon,
    this.onPressed,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.uiKitTheme?.colorScheme;

    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusFoundation.all24,
        side: BorderSide(
          width: 2,
          color: isSelected ? Colors.transparent : colorScheme?.inverseSurface ?? Colors.transparent,
        ),
      ),
      color: isSelected ? colorScheme?.inversePrimary : colorScheme?.primary,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onPressed,
        child: Ink(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                height: 0.028.sh,
                width: 0.08125.sw,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusFoundation.all24,
                ),
                child: icon,
              ),
              SpacingFoundation.horizontalSpace8,
              Text(
                title,
                style: context.uiKitTheme?.boldTextTheme.caption1Bold.copyWith(
                  color: isSelected ? colorScheme?.primary : colorScheme?.inversePrimary,
                ),
              ),
            ],
          ).paddingSymmetric(
            horizontal: EdgeInsetsFoundation.horizontal16,
            vertical: EdgeInsetsFoundation.vertical12,
          ),
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
