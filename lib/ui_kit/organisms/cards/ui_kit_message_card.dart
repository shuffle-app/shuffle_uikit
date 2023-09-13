import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitMessageCard extends StatelessWidget {
  const UiKitMessageCard({
    super.key,
    required this.name,
    required this.surname,
    required this.nickname,
    required this.avatarPath,
    required this.lastMessage,
    required this.lastMessageTime,
    this.onTap,
    this.isStarEnabled,
    this.unreadMessageCount,
  });

  final String name;
  final String surname;
  final String nickname;
  final String lastMessage;
  final String lastMessageTime;
  final String avatarPath;

  final bool? isStarEnabled;
  final int? unreadMessageCount;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final colorScheme = context.uiKitTheme?.colorScheme;

    return GestureDetector(
      onTap: () => onTap?.call(),
      child: UiKitCardWrapper(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BorderedUserCircleAvatar(
                  imageUrl: avatarPath,
                  border: GradientFoundation.gradientBorder,
                  size: 40.w,
                ),
                SpacingFoundation.horizontalSpace12,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text.rich(
                          TextSpan(
                            text: name,
                            style: boldTextTheme?.caption1Medium,
                            children: [TextSpan(text: ' $surname')],
                          ),
                        ),
                        SpacingFoundation.horizontalSpace8,
                        if (isStarEnabled ?? false)
                          ImageWidget(svgAsset: GraphicsFoundation.instance.svg.memeberGradientStar),
                      ],
                    ),
                    Text(
                      nickname,
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
    );
  }
}
