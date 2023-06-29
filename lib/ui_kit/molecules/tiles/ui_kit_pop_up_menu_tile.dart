import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitPopUpMenuTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? titleIcon;
  final Widget? leading;
  final List<UiKitPopUpMenuButtonOption>? menuOptions;

  const UiKitPopUpMenuTile({
    super.key,
    required this.title,
    this.subtitle,
    this.titleIcon,
    this.leading,
    this.menuOptions,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (leading != null) leading!,
        SpacingFoundation.horizontalSpace12,
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: textTheme?.caption1Medium,
            ),
            SpacingFoundation.verticalSpace2,
            Text(
              subtitle ?? '',
              style: textTheme?.caption1Bold.copyWith(
                color: ColorsFoundation.darkNeutral900,
              ),
            ),
          ],
        ),
        const Spacer(),
        UiKitPopUpMenuButton(
          options: menuOptions ?? [],
        ),
      ],
    );
  }
}
