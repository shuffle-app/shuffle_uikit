import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitMessageCard extends StatelessWidget {
  const UiKitMessageCard({
    super.key,
    required this.name,
    required this.userType,
    required this.username,
    required this.avatarPath,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.onTap,
    this.unreadMessageCount,
  });

  final String name;
  final String username;
  final String lastMessage;
  final String lastMessageTime;
  final String avatarPath;
  final UserTileType userType;
  final VoidCallback onTap;

  final int? unreadMessageCount;

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final colorScheme = context.uiKitTheme?.colorScheme;
    final cardColor = context.uiKitTheme?.cardColor;

    return Material(
      borderRadius: BorderRadiusFoundation.all24,
      clipBehavior: Clip.hardEdge,
      color: cardColor,
      child: InkWell(
        onTap: () => onTap.call(),
        child: Ink(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  context.userAvatar(size: UserAvatarSize.x40x40, type: userType, userName: name,imageUrl: avatarPath),
                  SpacingFoundation.horizontalSpace12,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(name, style: boldTextTheme?.caption1Medium),
                          SpacingFoundation.horizontalSpace8,
                          if (userType == UserTileType.premium)
                            ImageWidget(
                              iconData: ShuffleUiKitIcons.star2,
                              color: colorScheme?.inversePrimary,
                              fit: BoxFit.cover,
                              height: 16.w,
                            ),
                          if (userType == UserTileType.influencer)
                            ImageWidget(
                              iconData: ShuffleUiKitIcons.memeberGradientStar,
                              fit: BoxFit.cover,
                              height: 16.w,
                            ),
                          if (userType == UserTileType.pro)
                            GradientableWidget(
                              gradient: GradientFoundation.premiumLinearGradient,
                              child: Text(
                                'pro',
                                style: boldTextTheme?.caption1Bold.copyWith(color: Colors.white),
                              ),
                            )
                        ],
                      ),
                      Text(
                        username,
                        style: boldTextTheme?.caption1Bold.copyWith(
                          color: colorScheme?.darkNeutral900,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    lastMessageTime,
                    style: boldTextTheme?.caption1Medium.copyWith(
                      color: colorScheme?.darkNeutral900,
                    ),
                  ),
                ],
              ),
              SpacingFoundation.verticalSpace8,
              Row(
                children: [
                  Flexible(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: 20.w),
                      child: Center(
                        child: Text(
                          lastMessage,
                          overflow: TextOverflow.ellipsis,
                          style: boldTextTheme?.caption1Medium.copyWith(
                            color: (unreadMessageCount ?? 0) == 0 ? colorScheme?.darkNeutral900 : null,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SpacingFoundation.horizontalSpace8,
                  if ((unreadMessageCount ?? 0) != 0)
                    CircleAvatar(
                      radius: 10.w,
                      backgroundColor: colorScheme?.inversePrimary,
                      child: Text(
                        '$unreadMessageCount',
                        style: boldTextTheme?.caption1Bold.copyWith(color: colorScheme?.primary),
                      ),
                    )
                ],
              ),
            ],
          ).paddingAll(EdgeInsetsFoundation.all16),
        ),
      ),
    );
  }
}
