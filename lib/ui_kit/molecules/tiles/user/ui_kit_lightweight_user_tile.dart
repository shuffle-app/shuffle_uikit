import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitLightweightUserTile extends BaseUserTile {
  final UserTileType? userType;
  final Color? userNameTextColor;

  const UiKitLightweightUserTile({
    Key? key,
    super.name,
    super.username,
    super.avatarUrl,
    this.userType,
    this.userNameTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return Row(
      children: [
        context.userAvatar(
          size: UserAvatarSize.x40x40,
          type: userType ?? UserTileType.ordinary,
          userName: username ?? '',
          imageUrl: avatarUrl,
        ),
        SpacingFoundation.horizontalSpace8,
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text(
                      '@$username',
                      style: boldTextTheme?.caption1Bold.copyWith(color: userNameTextColor),
                    ),
                  ),
                  SpacingFoundation.horizontalSpace8,
                  if (userType == UserTileType.influencer) InfluencerAccountMark(),
                  if (userType == UserTileType.pro) ProAccountMark(),
                ],
              ),
              SpacingFoundation.verticalSpace2,
              Text(
                name ?? '',
                style: boldTextTheme?.caption1Medium.copyWith(color: ColorsFoundation.mutedText),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
