import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitTitledFilterChip extends StatelessWidget {
  final String title;
  final bool selected;

  final VoidCallback? onPressed;
  final dynamic icon;

  const UiKitTitledFilterChip({
    super.key,
    required this.title,
    this.selected = false,
    this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = context.uiKitTheme?.boldTextTheme.caption1Bold;
    final colorScheme = context.uiKitTheme?.colorScheme;

    return Material(
      borderRadius: BorderRadiusFoundation.max,
      color: selected ? colorScheme?.inversePrimary : colorScheme?.surface2,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onPressed,
        child: Ink(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Transform.translate(
                  offset: Offset(0, icon is IconData ? -2.h : 0),
                  child: ImageWidget(
                    fit: BoxFit.fitHeight,
                    iconData: icon is IconData ? icon as IconData : null,
                    link: icon is String ? icon as String : null,
                    color: selected ? colorScheme?.primary : colorScheme?.inversePrimary,
                  )),
              SpacingFoundation.horizontalSpace8,
              Text(
                title,
                style: titleStyle?.copyWith(
                  color: selected ? colorScheme?.primary : colorScheme?.inversePrimary,
                ),
              ),
            ],
          ).paddingSymmetric(
              horizontal: SpacingFoundation.horizontalSpacing16, vertical: SpacingFoundation.verticalSpacing14),
        ),
      ),
    );
  }
}
