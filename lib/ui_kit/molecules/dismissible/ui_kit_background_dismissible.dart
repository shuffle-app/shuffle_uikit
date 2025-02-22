import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitBackgroundDismissible extends StatelessWidget {
  const UiKitBackgroundDismissible({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: ColorsFoundation.red,
        borderRadius: BorderRadiusFoundation.all24r,
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            context.iconButtonNoPadding(
              data: BaseUiKitButtonData(
                iconInfo: BaseUiKitButtonIconData(
                  iconData: ShuffleUiKitIcons.trash,
                ),
              ),
            ),
            SpacingFoundation.horizontalSpace2,
            Text(
              S.of(context).Remove,
              style: theme?.boldTextTheme.caption2Medium,
            ),
            SpacingFoundation.horizontalSpace12,
          ],
        ),
      ),
    );
  }
}
