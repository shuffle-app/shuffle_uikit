import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitChatTile extends StatelessWidget {
  final String chatTitle;
  final String adminName;
  final DateTime? date;
  final int chatMembersCount;
  final int numberInList;
  final VoidCallback? onTap;
  final String? avatarUrl;
  final UserTileType? userTileType;

  const UiKitChatTile({
    super.key,
    required this.chatTitle,
    this.adminName = '',
    this.date,
    this.chatMembersCount = 0,
    this.numberInList = 1,
    this.avatarUrl,
    this.onTap,
    this.userTileType,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final boldTextTheme = theme?.boldTextTheme;
    final regularTextTheme = theme?.regularTextTheme;
    final colorScheme = theme?.colorScheme;

    return InkWell(
      borderRadius: BorderRadiusFoundation.max,
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '#$numberInList',
            style: boldTextTheme?.body,
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpacingFoundation.horizontalSpace12,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      chatTitle,
                      style: boldTextTheme?.caption1Medium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SpacingFoundation.verticalSpace2,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        context.userAvatar(
                            size: UserAvatarSize.x24x24,
                            type: userTileType ?? UserTileType.ordinary,
                            userName: adminName,
                            imageUrl: avatarUrl),
                        SpacingFoundation.horizontalSpace12,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              S.of(context).Admin,
                              style: regularTextTheme?.caption4.copyWith(color: colorScheme?.darkNeutral400),
                            ),
                            SpacingFoundation.verticalSpace2,
                            Text(
                              adminName,
                              style: regularTextTheme?.caption2.copyWith(color: colorScheme?.darkNeutral400),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
                SpacingFoundation.horizontalSpace12,
                const Spacer(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      DateFormat('MMM dd').format(date!),
                      textAlign: TextAlign.end,
                      style: theme?.regularTextTheme.caption4.copyWith(
                        color: colorScheme?.bodyTypography,
                      ),
                    ),
                    SpacingFoundation.verticalSpace4,
                    RichText(
                      text: TextSpan(children: [
                        WidgetSpan(
                            child: ImageWidget(
                          color: colorScheme?.inversePrimary,
                          svgAsset: GraphicsFoundation.instance.svg.twoPeople,
                          fit: BoxFit.fitHeight,
                          height: boldTextTheme?.caption1Bold.height,
                        )),
                        TextSpan(text: ' $chatMembersCount', style: boldTextTheme?.caption1Bold)
                      ]),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
