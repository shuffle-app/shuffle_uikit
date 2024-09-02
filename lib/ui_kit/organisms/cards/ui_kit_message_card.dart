import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitMessageCard extends StatelessWidget {
  const UiKitMessageCard({
    super.key,
    required this.name,
    required this.userType,
    required this.subtitle,
    required this.avatarPath,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.onTap,
    this.lastMessageSenderName,
    this.subtitleIconPath,
    this.unreadMessageCount,
    this.disabled = false,
  });

  final String name;
  final String? lastMessageSenderName;
  final String subtitle;
  final String? subtitleIconPath;
  final String lastMessage;
  final String lastMessageTime;
  final String avatarPath;
  final UserTileType userType;
  final VoidCallback onTap;
  final bool disabled;

  final int? unreadMessageCount;

  factory UiKitMessageCard.empty() {
    return UiKitMessageCard(
      name: '',
      userType: UserTileType.ordinary,
      subtitle: '',
      avatarPath: '',
      lastMessage: '',
      lastMessageTime: '',
      onTap: () {},
      lastMessageSenderName: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;
    final colorScheme = context.uiKitTheme?.colorScheme;
    final cardColor = context.uiKitTheme?.colorScheme.surface1;

    return Material(
      borderRadius: BorderRadiusFoundation.all24,
      clipBehavior: Clip.hardEdge,
      color: cardColor,
      child: InkWell(
        onTap: disabled ? null : () => onTap.call(),
        child: Ink(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Opacity(
                opacity: disabled ? 0.5 : 1.0,
                child: Row(
                  children: [
                    context.userAvatar(
                      size: UserAvatarSize.x40x40,
                      type: userType,
                      userName: name,
                      imageUrl: avatarPath,
                    ),
                    SpacingFoundation.horizontalSpace12,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        name,
                                        style: boldTextTheme?.caption1Medium.copyWith(overflow: TextOverflow.ellipsis),
                                        maxLines: 2,
                                      ),
                                    ),
                                    SpacingFoundation.horizontalSpace4,
                                    UiKitUserBadge(userType: userType),
                                    SpacingFoundation.horizontalSpace4,
                                  ],
                                ),
                              ),
                              Text(
                                lastMessageTime,
                                style: regularTextTheme?.caption4.copyWith(
                                  color: colorScheme?.darkNeutral900,
                                ),
                                textAlign: TextAlign.end,
                              ),
                            ],
                          ),
                          SpacingFoundation.verticalSpace2,
                          Row(
                            children: [
                              if (subtitleIconPath != null)
                                ImageWidget(
                                  link: subtitleIconPath,
                                  height: 14.h,
                                  fit: BoxFit.fitHeight,
                                  color: colorScheme?.darkNeutral900,
                                ).paddingOnly(right: EdgeInsetsFoundation.horizontal4),
                              Flexible(
                                child: Text(
                                  subtitle,
                                  style: boldTextTheme?.caption1Bold.copyWith(
                                    color: colorScheme?.darkNeutral900,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SpacingFoundation.verticalSpace4,
              Row(
                children: [
                  Expanded(
                    child: RichText(
                      maxLines: 1,
                      text: TextSpan(
                        children: [
                          if (lastMessageSenderName != null && lastMessageSenderName!.isNotEmpty)
                            TextSpan(
                              text: '$lastMessageSenderName: ',
                              style: boldTextTheme?.caption3Medium.copyWith(
                                overflow: TextOverflow.ellipsis,
                                color: ColorsFoundation.neutral48,
                              ),
                            ),
                          TextSpan(
                            text: lastMessage,
                            style: boldTextTheme?.caption3Medium.copyWith(
                              overflow: TextOverflow.ellipsis,
                              color: disabled
                                  ? colorScheme?.inverseSurface
                                  : unreadMessageCount == 0
                                      ? colorScheme?.darkNeutral900
                                      : null,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace4,
                  if (unreadMessageCount != null && unreadMessageCount! > 0)
                    Container(
                      decoration: BoxDecoration(
                        color: colorScheme?.inversePrimary,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        unreadMessageCount!.toStringAsFixed(0),
                        style: boldTextTheme?.caption1Bold.copyWith(color: colorScheme?.primary),
                        textAlign: TextAlign.center,
                      ).paddingAll(EdgeInsetsFoundation.all4),
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
