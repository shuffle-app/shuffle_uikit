import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitPostCard extends StatelessWidget {
  final String authorName;
  final String authorUsername;
  final String authorAvatarUrl;
  final String authorSpeciality;
  final String text;
  final UserTileType authorUserType;
  final int heartEyesCount;
  final int likesCount;
  final int sunglassesCount;
  final int firesCount;
  final int smileyCount;
  final bool hasNewMark;

  const UiKitPostCard({
    Key? key,
    required this.authorName,
    required this.authorUsername,
    required this.authorAvatarUrl,
    required this.authorSpeciality,
    required this.text,
    required this.authorUserType,
    required this.heartEyesCount,
    required this.likesCount,
    required this.sunglassesCount,
    required this.firesCount,
    required this.smileyCount,
    this.hasNewMark = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final boldTextTheme = theme?.boldTextTheme;
    final regularTextTheme = theme?.regularTextTheme;
    final colorScheme = theme?.colorScheme;
    final reactionTextColor = colorScheme?.inverseBodyTypography;

    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 0.2.sh,
        maxHeight: 0.25.sh,
        maxWidth: 1.sw,
        minWidth: 1.sw - EdgeInsetsFoundation.horizontal32,
      ),
      child: Stack(
        children: [
          UiKitCardWrapper(
            color: colorScheme?.inverseSurface,
            borderRadius: BorderRadiusFoundation.all24,
            padding: EdgeInsets.all(EdgeInsetsFoundation.all16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                context.userTile(
                  data: BaseUiKitUserTileData(
                    avatarUrl: authorAvatarUrl,
                    name: authorName,
                    username: authorUsername,
                    type: authorUserType,
                    showBadge: true,
                    noMaterialOverlay: true,
                    userNameTextColor: colorScheme?.inverseBodyTypography,
                  ),
                ),
                SpacingFoundation.verticalSpace8,
                Text(
                  text,
                  style: regularTextTheme?.caption2.copyWith(color: colorScheme?.surface),
                ),
                SpacingFoundation.verticalSpace8,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    UiKitHeartEyesReaction(
                      reactionsCount: heartEyesCount,
                      textColor: reactionTextColor,
                    ),
                    SpacingFoundation.horizontalSpace4,
                    UiKitLikeReaction(
                      reactionsCount: likesCount,
                      textColor: reactionTextColor,
                    ),
                    SpacingFoundation.horizontalSpace4,
                    UiKitFireReaction(
                      reactionsCount: firesCount,
                      textColor: reactionTextColor,
                    ),
                    SpacingFoundation.horizontalSpace4,
                    UiKitSunglassesReaction(
                      reactionsCount: sunglassesCount,
                      textColor: reactionTextColor,
                    ),
                    SpacingFoundation.horizontalSpace4,
                    UiKitSmileyReaction(
                      reactionsCount: smileyCount,
                      textColor: reactionTextColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (hasNewMark)
            Align(
              alignment: Alignment.topRight,
              child: Transform.rotate(
                angle: -pi / 9,
                child: UiKitCardWrapper(
                  gradient: GradientFoundation.defaultLinearGradient,
                  child: Text(
                    S.current.New.toLowerCase(),
                    style: boldTextTheme?.caption3Medium.copyWith(color: colorScheme?.surface),
                  ).paddingSymmetric(
                    horizontal: EdgeInsetsFoundation.horizontal4,
                    vertical: EdgeInsetsFoundation.vertical2,
                  ),
                ),
              ).paddingOnly(top: EdgeInsetsFoundation.vertical2),
            ),
          Align(
            alignment: Alignment.bottomRight,
            child: ClipRRect(
              borderRadius: BorderRadiusFoundation.max,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                child: ColoredBox(
                  color: ColorsFoundation.neutral16,
                  child: Text(
                    authorSpeciality,
                    style: boldTextTheme?.caption3Medium.copyWith(color: colorScheme?.darkNeutral100),
                  ).paddingSymmetric(
                    horizontal: EdgeInsetsFoundation.horizontal8,
                    vertical: EdgeInsetsFoundation.vertical4,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
