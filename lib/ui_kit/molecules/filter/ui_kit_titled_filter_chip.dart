import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitTitledFilterChip extends StatelessWidget {
  final String title;
  final bool selected;

  final VoidCallback? onPressed;
  final IconData icon;

  const UiKitTitledFilterChip({
    Key? key,
    required this.title,
    this.selected = false,
    this.onPressed,
    required this.icon,
  }) : super(key: key);

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
            children: [
              ImageWidget(
                height: 16,
                fit: BoxFit.fitHeight,
                iconData: icon,
                color: selected ? colorScheme?.primary : colorScheme?.inversePrimary,
              ),
              SpacingFoundation.horizontalSpace8,
              Text(
                title,
                style: titleStyle?.copyWith(
                  color: selected ? colorScheme?.primary : colorScheme?.inversePrimary,
                ),
              ),
            ],
          ).paddingAll(EdgeInsetsFoundation.all16),
        ),
      ),
    );
  }
}
