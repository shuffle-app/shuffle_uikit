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
    this.onInvitePeopleTap,
    required this.tags,
    this.canDenyInvitation = false,
    this.showGang = false,
    this.brightness = Brightness.light,
    this.onAcceptTap,
    this.onDenyTap,
  }) : super(key: key);

  final String username;
  final Brightness brightness;
  final String placeName;
  final String placeImagePath;
  final List<UiKitTag> tags;
  final List<String?> invitedPeopleAvatarPaths;
  final UserTileType userType;
  final bool canDenyInvitation;
  final bool showGang;

  final VoidCallback onPlaceTap;
  final VoidCallback? onInvitePeopleTap;
  final VoidCallback? onAcceptTap;
  final VoidCallback? onDenyTap;

  bool get isDark => brightness == Brightness.dark;

  List<String?> _sortAvatars() {
    final sortedAvatars = invitedPeopleAvatarPaths.where((avatar) => avatar != null).toList();

    return sortedAvatars;
  }

  @override
  Widget build(BuildContext context) {
    final sortedAvatars = _sortAvatars();
    final theme = context.uiKitTheme;
    final avatarWidth = 0.1375.sw;

    return Column(
      children: [
        Row(
          children: [
            if (sortedAvatars.length >= 3 && showGang)
              Expanded(
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
                          backgroundColor: isDark ? theme?.colorScheme.surface4 : theme?.colorScheme.darkNeutral100,
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
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      username,
                      style: theme?.boldTextTheme.caption1Bold.copyWith(color: isDark ? Colors.white : Colors.black),
                    ),
                    SpacingFoundation.horizontalSpace12,
                    if (userType == UserTileType.influencer)
                      GradientableWidget(
                        gradient: GradientFoundation.defaultLinearGradient,
                        child: ImageWidget(
                          iconData: ShuffleUiKitIcons.star2,
                          color: context.uiKitTheme?.colorScheme.inversePrimary,
                          height: 16.w,
                        ),
                      ),
                    if (userType == UserTileType.premium)
                      ImageWidget(
                        iconData: ShuffleUiKitIcons.star2,
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
                  showGang
                      ? S.of(context).InvitesNPeopleTo(invitedPeopleAvatarPaths.length).toLowerCase()
                      : S.of(context).InvitesYouTo.toLowerCase(),
                  style: theme?.boldTextTheme.caption1Medium.copyWith(
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
        SpacingFoundation.verticalSpace12,
        UiKitCardWrapper(
          borderRadius: BorderRadiusFoundation.max,
          color: isDark ? theme?.colorScheme.surface4 : theme?.colorScheme.darkNeutral100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              BorderedUserCircleAvatar(
                size: avatarWidth + 5.w,
                imageUrl: placeImagePath,
              ),
              SpacingFoundation.horizontalSpace12,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SpacingFoundation.verticalSpace2,
                    Text(
                      placeName,
                      style: theme?.boldTextTheme.caption1Bold.copyWith(
                        overflow: TextOverflow.ellipsis,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                      width: 170.w,
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemCount: tags.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) => tags[index].widget,
                        separatorBuilder: (_, __) => SpacingFoundation.horizontalSpace2,
                      ),
                    ),
                  ],
                ),
              ),
              context
                  .smallOutlinedButton(
                    blurred: false,
                    color: Colors.black,
                    data: BaseUiKitButtonData(
                      onPressed: onPlaceTap,
                      iconInfo: BaseUiKitButtonIconData(
                        iconData: ShuffleUiKitIcons.chevronright,
                      ),
                    ),
                  )
                  .paddingAll(EdgeInsetsFoundation.all2),
            ],
          ),
        ),
        SpacingFoundation.verticalSpace12,
        if (canDenyInvitation)
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 4,
                child: context.smallGradientButton(
                  data: BaseUiKitButtonData(
                    onPressed: onAcceptTap,
                    text: S.of(context).Go.toUpperCase(),
                    fit: ButtonFit.fitWidth,
                  ),
                ),
              ),
              SpacingFoundation.horizontalSpace12,
              Expanded(
                flex: 6,
                child: context.smallOutlinedButton(
                  color: isDark ? Colors.white : Colors.black,
                  blurred: false,
                  data: BaseUiKitButtonData(
                    onPressed: onDenyTap,
                    text: S.of(context).NotNow.toUpperCase(),
                    fit: ButtonFit.fitWidth,
                  ),
                ),
              ),
            ],
          ),
        if (!canDenyInvitation)
          context.gradientButton(
            data: BaseUiKitButtonData(
              onPressed: onInvitePeopleTap,
              text: S.of(context).InviteMore.toUpperCase(),
              fit: ButtonFit.fitWidth,
            ),
          ),
      ],
    );
  }
}
