import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitInfluencerToolInContentCard extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  final AutoSizeGroup? group;
  final IconData? iconData;

  const UiKitInfluencerToolInContentCard({
    super.key,
    this.title,
    this.onTap,
    this.group,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return GestureDetector(
      onTap: onTap,
      child: UiKitCardWrapper(
        color: theme?.colorScheme.surface2,
        borderRadius: BorderRadiusFoundation.all24r,
        child: Column(
          children: [
            context.smallOutlinedButton(
              data: BaseUiKitButtonData(
                backgroundColor: Colors.transparent,
                onPressed: onTap,
                iconInfo: BaseUiKitButtonIconData(
                  iconData: iconData,
                  size: 16.h,
                ),
              ),
            ),
            SpacingFoundation.verticalSpace12,
            AutoSizeText(
              title ?? '',
              group: group,
              maxLines: 2,
              style: theme?.boldTextTheme.caption2UpperCaseMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ).paddingSymmetric(
          vertical: SpacingFoundation.verticalSpacing16,
          horizontal: SpacingFoundation.horizontalSpacing28,
        ),
      ),
    );
  }
}
