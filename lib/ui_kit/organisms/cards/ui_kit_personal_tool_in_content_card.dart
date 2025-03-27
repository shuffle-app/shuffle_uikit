import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitPersonalToolInContentCard extends StatelessWidget {
  final VoidCallback? onTap;
  final AutoSizeGroup? group;
  final String? text;

  const UiKitPersonalToolInContentCard({
    super.key,
    this.onTap,
    this.group,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final colorScheme = theme?.colorScheme;

    return UiKitCardWrapper(
      color: colorScheme?.surface1,
      borderRadius: BorderRadiusFoundation.all16,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            text ?? '',
            group: group,
            style: theme?.boldTextTheme.caption2Medium,
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          SpacingFoundation.verticalSpace8,
          GradientableWidget(
            gradient: GradientFoundation.defaultLinearGradient,
            child: context.smallOutlinedButton(
              data: BaseUiKitButtonData(
                onPressed: onTap,
                iconInfo: BaseUiKitButtonIconData(
                  iconData: ShuffleUiKitIcons.chevronright,
                  size: 16.h,
                ),
              ),
            ),
          )
        ],
      ).paddingAll(EdgeInsetsFoundation.all12),
    );
  }
}
