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

    final avatarWidth = 0.125.sw;
    print('placeImagePath: $placeImagePath');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 0.125.sw,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  if (invitedUsersData.length <= 3)
                    SizedBox(
                      width: ((invitedUsersData.length + 1) * EdgeInsetsFoundation.horizontal24) +
                          EdgeInsetsFoundation.horizontal16,
                      height: 0.15.sw,
                    ),
                  if (invitedUsersData.length <= 3)
                    ...invitedUsersData.map(
                      (e) {
                        final index = invitedUsersData.indexOf(e);
                        return Positioned(
                          left: EdgeInsetsFoundation.horizontal24 * index, //EdgeInsetsFoundation.horizontal32,
                          child: context.userAvatar(
                            size: UserAvatarSize.x40x40,
                            type: invitedUsersData.elementAt(index).userType,
                            imageUrl: invitedUsersData.elementAt(index).avatarPath,
                            userName: invitedUsersData.elementAt(index).name,
                          ),
                        );
                      },
                    ),
                  if (invitedUsersData.length > 3) ...[
                    SizedBox(
                      width: (3 * EdgeInsetsFoundation.horizontal24) + avatarWidth + EdgeInsetsFoundation.horizontal4,
                      height: 0.15.sw,
                    ),
                    ...invitedUsersData.sublist(0, 3).map(
                      (e) {
                        final index = invitedUsersData.indexOf(e);
                        return Positioned(
                          left: EdgeInsetsFoundation.horizontal24 * index, //EdgeInsetsFoundation.horizontal32,
                          child: context.userAvatar(
                            size: UserAvatarSize.x40x40,
                            type: invitedUsersData.elementAt(index).userType,
                            imageUrl: invitedUsersData.elementAt(index).avatarPath,
                            userName: invitedUsersData.elementAt(index).name,
                          ),
                        );
                      },
                    ),
                    Positioned(
                      left: 3 * EdgeInsetsFoundation.horizontal24,
                      child: Container(
                        width: 0.125.sw,
                        height: 0.125.sw,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: colorScheme.darkNeutral100,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '+${invitedUsersData.length - 3}',
                            style: theme?.regularTextTheme.caption1.copyWith(
                              color: ColorsFoundation.mutedText,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
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
                  Flexible(
                    child: Text(
                      showGang
                          ? S.of(context).InvitesNPeopleTo(invitedUsersData.length).toLowerCase()
                          : S.of(context).InvitesYouTo.toLowerCase(),
                      style: theme?.boldTextTheme.caption1Medium.copyWith(
                        color: colorScheme.inverseSurface,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
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
                    backgroundColor: colorScheme.inverseSurface,
                    onPressed: onDenyTap,
                    text: S.of(context).NotNow.toUpperCase(),
                    fit: ButtonFit.fitWidth,
                  ),
                ),
              ),
            ],
          ).paddingOnly(top: EdgeInsetsFoundation.vertical2),
        if (canAddMorePeople)
          context
              .gradientButton(
                data: BaseUiKitButtonData(
                  onPressed: onInvitePeopleTap,
                  text: S.of(context).InviteMore.toUpperCase(),
                  fit: ButtonFit.fitWidth,
                ),
              )
              .paddingOnly(top: EdgeInsetsFoundation.vertical2),
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
