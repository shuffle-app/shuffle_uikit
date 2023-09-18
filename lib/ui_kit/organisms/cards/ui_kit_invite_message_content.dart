import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitInviteMessageContent extends StatelessWidget {
  const UiKitInviteMessageContent({
    Key? key,
    required this.username,
    required this.placeName,
    required this.placeImagePath,
    required this.invitedPeopleAvatarPaths,
    required this.userType,
    required this.onPlaceTap,
    required this.onInvitePeopleTap,
    required this.tags,
  }) : super(key: key);

  final String username;
  final String placeName;
  final String placeImagePath;
  final List<UiKitTag> tags;
  final List<String?> invitedPeopleAvatarPaths;
  final UserTileType userType;

  final VoidCallback onPlaceTap;
  final VoidCallback onInvitePeopleTap;

  List<String?> _sortAvatars() {
    final sortedAvatars = invitedPeopleAvatarPaths.where((avatar) => avatar != null).toList();

    return sortedAvatars;
  }

  @override
  Widget build(BuildContext context) {
    final sortedAvatars = _sortAvatars();
    final theme = context.uiKitTheme;
    final avatarWidth = 40.w;

    return Column(
      children: [
        Row(
          children: [
            sortedAvatars.length >= 3
                ? Expanded(
                    child: Stack(
                      children: [
                        BorderedUserCircleAvatar(
                          imageUrl: sortedAvatars.first,
                          size: avatarWidth,
                        ),
                        Positioned(
                          left: EdgeInsetsFoundation.horizontal32 * 0.7.w,
                          child: BorderedUserCircleAvatar(
                            size: avatarWidth,
                            imageUrl: sortedAvatars[1],
                          ),
                        ),
                        Positioned(
                          left: EdgeInsetsFoundation.horizontal32 * 1.5.w,
                          child: BorderedUserCircleAvatar(
                            size: avatarWidth,
                            imageUrl: sortedAvatars[2],
                          ),
                        ),
                        if (invitedPeopleAvatarPaths.length - 3 > 0)
                          Positioned(
                            left: EdgeInsetsFoundation.horizontal32 * 2.2.w,
                            child: CircleAvatar(
                              radius: avatarWidth / 2,
                              backgroundColor: theme?.colorScheme.surface4,
                              child: Text(
                                '+${invitedPeopleAvatarPaths.length - 3}',
                                style: theme?.regularTextTheme.caption1.copyWith(
                                  color: theme.colorScheme.darkNeutral900,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  )
                : const Spacer(),
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
                  'invites ${invitedPeopleAvatarPaths.length} people to',
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SpacingFoundation.verticalSpace4,
                  Row(
                    children: [
                      SpacingFoundation.horizontalSpace12,
                      Text(placeName, style: theme?.boldTextTheme.caption1Bold),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                    width: 170.w,
                    child: ListView.separated(
                      padding: EdgeInsets.only(left: EdgeInsetsFoundation.horizontal12),
                      itemCount: tags.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) => tags[index].widget,
                      separatorBuilder: (_, __) => SpacingFoundation.horizontalSpace2,
                    ),
                  ),
                  SpacingFoundation.verticalSpace2,
                ],
              ),
              Flexible(
                child: context.badgeButtonNoValue(
                  data: BaseUiKitButtonData(
                    onPressed: onPlaceTap,
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
        context.gradientButton(
          data: BaseUiKitButtonData(
            onPressed: onInvitePeopleTap,
            text: 'INVITE MORE',
            fit: ButtonFit.fitWidth,
          ),
        ),
      ],
    );
  }
}
