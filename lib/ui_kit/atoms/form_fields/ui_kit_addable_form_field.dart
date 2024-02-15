import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitAddableFormField extends StatelessWidget {
  final String title;
  final bool isAbleToAdd;
  final VoidCallback? onAdd;
  final bool isAbleToRemove;
  final VoidCallback? onRemove;
  final Widget child;

  const UiKitAddableFormField(
      {super.key,
      required this.title,
      this.isAbleToAdd = true,
      this.onAdd,
      this.isAbleToRemove = false,
      this.onRemove,
      required this.child});

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: theme?.regularTextTheme.labelLarge.copyWith(color: UiKitColors.mutedText),
        ),
        SpacingFoundation.verticalSpace8,
        Row(
          children: [
            child,
            const Spacer(),
            if (isAbleToAdd)
              context
                  .smallOutlinedButton(
                      data: BaseUiKitButtonData(
                          onPressed: onAdd, iconInfo: BaseUiKitButtonIconData(iconData: ShuffleUiKitIcons.plus,size: 18)))
                  .paddingSymmetric(horizontal: SpacingFoundation.horizontalSpacing4),
            if (isAbleToRemove)
              context
                  .smallOutlinedButton(
                      data: BaseUiKitButtonData(
                          onPressed: onRemove, iconInfo: BaseUiKitButtonIconData(iconData: ShuffleUiKitIcons.minus)))
                  .paddingSymmetric(horizontal: SpacingFoundation.horizontalSpacing4),
          ],
        )
      ],
    );
  }
}
