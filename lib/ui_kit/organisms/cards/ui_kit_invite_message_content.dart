import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitInviteMessageContent extends StatelessWidget {
  const UiKitInviteMessageContent({
    super.key,
    required this.username,
    required this.placeName,
    required this.placeImagePath,
    required this.invitedUsersData,
    required this.userType,
    required this.onPlaceTap,
    this.onInvitePeopleTap,
    required this.tags,
    this.canDenyInvitation = false,
    this.canAddMorePeople = false,
    this.showGang = false,
    this.brightness = Brightness.light,
    this.onAcceptTap,
    this.onDenyTap,
  });

  final String username;
  final Brightness brightness;
  final String placeName;
  final String placeImagePath;
  final List<UiKitTag> tags;
  final List<InviteMessageUsersData> invitedUsersData;
  final UserTileType userType;
  final bool canDenyInvitation;
  final bool canAddMorePeople;
  final bool showGang;

  final VoidCallback onPlaceTap;
  final VoidCallback? onInvitePeopleTap;
  final VoidCallback? onAcceptTap;
  final VoidCallback? onDenyTap;

  bool get isDark => brightness == Brightness.dark;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    UiKitColorScheme colorScheme = UiKitColorScheme.dark();
    if (!isDark) colorScheme = UiKitColorScheme.light();

    final avatarWidth = 0.1375.sw;
    print('placeImagePath: $placeImagePath');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            if (invitedUsersData.length >= 3 && showGang)
              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox(
                      width: 0.15.sw,
                      height: 0.15.sw,
                    ),
                    Positioned(
                      left: -EdgeInsetsFoundation.horizontal32 * 0.1.w,
                      child: context.userAvatar(
                        size: UserAvatarSize.x40x40,
                        type: invitedUsersData.first.userType,
                        imageUrl: invitedUsersData.first.avatarPath,
                        userName: invitedUsersData.first.name,
                      ),
                    ),
                    Positioned(
                      left: EdgeInsetsFoundation.horizontal32 * 0.7.w,
                      child: context.userAvatar(
                        size: UserAvatarSize.x40x40,
                        type: invitedUsersData[1].userType,
                        imageUrl: invitedUsersData[1].avatarPath,
                        userName: invitedUsersData[1].name,
                      ),
                    ),
                    Positioned(
                      left: EdgeInsetsFoundation.horizontal32 * 1.5.w,
                      child: context.userAvatar(
                        size: UserAvatarSize.x40x40,
                        type: invitedUsersData[2].userType,
                        imageUrl: invitedUsersData[2].avatarPath,
                        userName: invitedUsersData[2].name,
                      ),
                    ),
                    if (invitedUsersData.length - 3 > 0)
                      Positioned(
                        left: EdgeInsetsFoundation.horizontal32 * 2.2.w,
                        child: CircleAvatar(
                          radius: avatarWidth / 2,
                          backgroundColor: colorScheme.darkNeutral100,
                          child: Text(
                            '+${invitedUsersData.length - 3}',
                            style: theme?.regularTextTheme.caption1.copyWith(
                              color: ColorsFoundation.mutedText,
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
                      style: theme?.boldTextTheme.caption1Bold.copyWith(color: colorScheme.inverseSurface),
                    ),
                    SpacingFoundation.horizontalSpace12,
                    if (userType == UserTileType.influencer) InfluencerAccountMark(),
                    if (userType == UserTileType.premium) PremiumAccountMark(color: colorScheme.inverseSurface),
                    if (userType == UserTileType.pro) ProAccountMark(),
                  ],
                ),
                Text(
                  showGang
                      ? S.of(context).InvitesNPeopleTo(invitedUsersData.length).toLowerCase()
                      : S.of(context).InvitesYouTo.toLowerCase(),
                  style: theme?.boldTextTheme.caption1Medium.copyWith(color: colorScheme.inverseSurface),
                ),
              ],
            ),
          ],
        ),
        SpacingFoundation.verticalSpace12,
        UiKitCardWrapper(
          borderRadius: BorderRadiusFoundation.max,
          color: colorScheme.surface1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipOval(
                child: ImageWidget(
                  link: placeImagePath,
                  width: 0.125.sw,
                  height: 0.125.sw,
                  fit: BoxFit.cover,
                ),
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
                        color: colorScheme.inverseSurface,
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
                    data: BaseUiKitButtonData(
                      borderColor: colorScheme.inverseSurface,
                      backgroundColor: colorScheme.surface1,
                      onPressed: onPlaceTap,
                      iconInfo: BaseUiKitButtonIconData(
                        iconData: ShuffleUiKitIcons.chevronright,
                        color: colorScheme.inverseSurface,
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
                  blurred: false,
                  data: BaseUiKitButtonData(
                    backgroundColor: colorScheme?.inverseSurface,
                    onPressed: onDenyTap,
                    text: S.of(context).NotNow.toUpperCase(),
                    fit: ButtonFit.fitWidth,
                  ),
                ),
              ),
            ],
          ),
        if (canAddMorePeople)
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

class InviteMessageUsersData {
  final String avatarPath;
  final String name;
  final UserTileType userType;

  const InviteMessageUsersData({
    required this.avatarPath,
    required this.userType,
    required this.name,
  });
}
