import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitInviteMessageContent extends StatelessWidget {
  const UiKitInviteMessageContent({
    super.key,
    required this.username,
    required this.placeName,
    required this.placeImagePath,
    required this.invitedPeopleAvatarPaths,
    required this.invitedPeopleAmount,
    required this.firstTagName,
    required this.firstTagImage,
    required this.secondTagName,
    required this.secondTagImage,
    required this.onNextTap,
    required this.onInvitePeopleTap,
    required this.userType,
  });

  final String username;
  final String placeName;

  final String firstTagName;
  final SvgGenImage firstTagImage;
  final String secondTagName;
  final SvgGenImage secondTagImage;

  final String placeImagePath;
  final int invitedPeopleAmount;
  final List<String> invitedPeopleAvatarPaths;
  final UserTileType userType;

  final VoidCallback onNextTap;
  final VoidCallback onInvitePeopleTap;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final avatarWidth = 40.w;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Stack(
                children: [
                  BorderedUserCircleAvatar(
                    imageUrl: invitedPeopleAvatarPaths.first,
                    size: avatarWidth,
                  ),
                  if (invitedPeopleAvatarPaths.length >= 2)
                    Positioned(
                      left: EdgeInsetsFoundation.horizontal32 * 0.7.w,
                      child: BorderedUserCircleAvatar(
                        size: avatarWidth,
                        imageUrl: invitedPeopleAvatarPaths[1],
                      ),
                    ),
                  if (invitedPeopleAvatarPaths.length >= 3)
                    Positioned(
                      left: EdgeInsetsFoundation.horizontal32 * 1.5.w,
                      child: BorderedUserCircleAvatar(
                        size: avatarWidth,
                        imageUrl: invitedPeopleAvatarPaths[2],
                      ),
                    ),
                  if (invitedPeopleAmount - 3 > 0)
                    Positioned(
                      left: EdgeInsetsFoundation.horizontal32 * 2.2.w,
                      child: CircleAvatar(
                        radius: avatarWidth / 2,
                        backgroundColor: theme?.colorScheme.surface4,
                        child: Text(
                          '+${invitedPeopleAmount - 3}',
                          style: theme?.regularTextTheme.caption1.copyWith(
                            color: theme.colorScheme.darkNeutral900,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(username, style: theme?.boldTextTheme.caption1Bold),
                    SpacingFoundation.horizontalSpace12,
                    if (userType == UserTileType.influencer)
                      GradientableWidget(
                        gradient: GradientFoundation.defaultLinearGradient,
                        child: ImageWidget(
                          svgAsset: GraphicsFoundation.instance.svg.star2,
                          color: context.uiKitTheme?.colorScheme.inversePrimary,
                          height: 16.w,
                        ),
                      ),
                    if (userType == UserTileType.premium)
                      ImageWidget(
                        svgAsset: GraphicsFoundation.instance.svg.star2,
                        color: context.uiKitTheme?.colorScheme.inversePrimary,
                        height: 16.w,
                      ),
                    if (userType == UserTileType.pro)
                      GradientableWidget(
                        gradient: GradientFoundation.defaultLinearGradient,
                        child: Text(
                          'pro',
                          style: theme?.boldTextTheme.caption1Bold.copyWith(color: Colors.white),
                        ),
                      ),
                  ],
                ),
                Text(
                  'invites $invitedPeopleAmount people to',
                  style: theme?.boldTextTheme.caption1Medium,
                ),
              ],
            ),
          ],
        ),
        SpacingFoundation.verticalSpace12,
        UiKitCardWrapper(
          borderRadius: BorderRadiusFoundation.all40,
          color: theme?.colorScheme.surface4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BorderedUserCircleAvatar(
                size: avatarWidth + 5.w,
                imageUrl: placeImagePath,
              ),
              SpacingFoundation.horizontalSpace12,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SpacingFoundation.verticalSpace4,
                  Text(placeName, style: theme?.boldTextTheme.caption1Bold),
                  SpacingFoundation.verticalSpace2,
                  Row(
                    children: [
                      ImageWidget(
                        svgAsset: firstTagImage,
                        color: theme?.colorScheme.darkNeutral900,
                      ),
                      SpacingFoundation.horizontalSpace4,
                      Text(
                        firstTagName,
                        style: theme?.boldTextTheme.caption2Bold.copyWith(
                          color: theme.colorScheme.darkNeutral900,
                        ),
                      ),
                      SpacingFoundation.horizontalSpace8,
                      ImageWidget(
                        svgAsset: secondTagImage,
                        color: theme?.colorScheme.darkNeutral900,
                      ),
                      SpacingFoundation.horizontalSpace4,
                      Text(
                        secondTagName,
                        style: theme?.boldTextTheme.caption2Bold.copyWith(
                          color: theme.colorScheme.darkNeutral900,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Flexible(
                child: context.badgeButtonNoValue(
                  data: BaseUiKitButtonData(
                    onPressed: onNextTap,
                    icon: Icon(
                      CupertinoIcons.chevron_right_circle,
                      size: avatarWidth + 5.w,
                      color: theme?.colorScheme.inversePrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SpacingFoundation.verticalSpace12,
        ConstrainedBox(
          constraints: BoxConstraints.expand(width: double.infinity, height: 40.h),
          child: context.gradientButton(
            data: BaseUiKitButtonData(
              onPressed: onInvitePeopleTap,
              text: 'INVITE MORE',
            ),
          ),
        ),
      ],
    );
  }
}
