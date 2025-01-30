import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitChatMemberUserTile extends StatelessWidget {
  final String name;
  final String nickname;
  final String? avatarPath;
  final UserTileType userType;
  final bool acceptedInvite;
  final bool canDelete;
  final VoidCallback? onDelete;
  final bool invertThemeColors;

  const UiKitChatMemberUserTile({
    super.key,
    required this.name,
    required this.nickname,
    required this.userType,
    required this.acceptedInvite,
    required this.canDelete,
    this.invertThemeColors = false,
    this.avatarPath,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;
    final colorScheme = context.uiKitTheme?.colorScheme;

    return Row(
      children: [
        context.userAvatar(
          size: UserAvatarSize.x60x60,
          type: userType,
          userName: name,
          imageUrl: avatarPath,
        ),
        SpacingFoundation.horizontalSpace4,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '@$nickname',
                style: regularTextTheme?.caption4Regular.copyWith(
                  color: invertThemeColors ? colorScheme?.surface : null,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      name,
                      style: boldTextTheme?.caption3Medium.copyWith(
                        color: invertThemeColors ? colorScheme?.surface : null,
                      ),
                    ),
                  ),
                  SpacingFoundation.horizontalSpace8,
                  if (userType == UserTileType.pro) ProAccountMark(),
                  if (userType == UserTileType.influencer) InfluencerAccountMark(),
                ],
              ),
            ],
          ),
        ),
        if (acceptedInvite)
          GradientableWidget(
            gradient: GradientFoundation.defaultLinearGradient,
            child: Text(
              S.current.Go.toLowerCase(),
              style: boldTextTheme?.caption2Bold.copyWith(color: Colors.white),
            ).paddingOnly(left: EdgeInsetsFoundation.horizontal4),
          ),
        if (canDelete)
          context
              .iconButtonNoPadding(
                data: BaseUiKitButtonData(
                  iconInfo: BaseUiKitButtonIconData(
                    iconData: ShuffleUiKitIcons.cross,
                    color: ColorsFoundation.mutedText,
                  ),
                  onPressed: onDelete,
                ),
              )
              .paddingOnly(left: EdgeInsetsFoundation.horizontal4),
      ],
    );
  }
}
