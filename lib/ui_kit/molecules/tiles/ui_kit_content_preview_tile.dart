import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitContentPreviewTile extends StatelessWidget {
  final String? avatarPath;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;

  const UiKitContentPreviewTile({
    Key? key,
    this.avatarPath,
    required this.title,
    this.subtitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.uiKitTheme?.colorScheme;
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return UiKitCardWrapper(
      color: colorScheme?.surface1,
      padding: EdgeInsets.all(EdgeInsetsFoundation.all12),
      child: Row(
        children: [
          context.userAvatar(
            size: UserAvatarSize.x40x40,
            type: UserTileType.ordinary,
            userName: title,
            imageUrl: avatarPath,
          ),
          SpacingFoundation.horizontalSpace8,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: boldTextTheme?.caption1Bold.copyWith(color: colorScheme?.bodyTypography),
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: boldTextTheme?.caption1Medium.copyWith(color: ColorsFoundation.mutedText),
                  ),
              ],
            ),
          ),
          if (onTap != null)
            context.smallButton(
              data: BaseUiKitButtonData(
                onPressed: onTap,
                iconInfo: BaseUiKitButtonIconData(
                  iconData: ShuffleUiKitIcons.chevronright,
                  color: colorScheme?.inverseSurface,
                ),
                backgroundColor: colorScheme?.surface3,
              ),
            ),
        ],
      ),
    );
  }
}
