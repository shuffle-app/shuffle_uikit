import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BadgedBaseUserTile extends StatelessWidget implements UserTileFactory {
  final Widget badge;
  final BaseUiKitUserTileData data;
  final Border avatarBorder;

  const BadgedBaseUserTile({
    Key? key,
    required this.badge,
    required this.avatarBorder,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    late final UserTileType userType;
    if (badge.runtimeType == PremiumMemberPlate) {
      userType = UserTileType.premium;
    } else if (badge.runtimeType == ProMemberPlate) {
      userType = UserTileType.pro;
    } else {
      userType = UserTileType.ordinary;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SpacingFoundation.verticalSpace24,
        Stack(
          fit: StackFit.passthrough,
          clipBehavior: Clip.none,
          children: [
            UiKitCardWrapper(
              color: context.uiKitTheme?.colorScheme.surface1,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  context.userAvatar(
                      size: UserAvatarSize.x48x48, type: userType, userName: data.name ?? '', imageUrl: data.avatarUrl),
                  SpacingFoundation.horizontalSpace8,
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          data.name ?? '',
                          style: boldTextTheme?.subHeadline,
                        ),
                        SpacingFoundation.verticalSpace2,
                         Text(
                                  data.username ?? '',
                                  style: boldTextTheme?.body,
                                ),
                      ],
                    ),
                  ),
                ],
              ).paddingAll(EdgeInsetsFoundation.all16),
            ),
            Positioned(
              top: -24,
              right: 5,
              child: badge,
            ),
            if (data.speciality != null && data.speciality!.isNotEmpty)
              Positioned(
                bottom: -20,
                right: 5,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusFoundation.all24, color: UiKitColors.surfaceGradientMid),
                  child: Text(
                    data.speciality!,
                    style: boldTextTheme?.caption3Medium.copyWith(color: ColorsFoundation.darkNeutral100),
                  ).paddingAll(SpacingFoundation.verticalSpacing4),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
