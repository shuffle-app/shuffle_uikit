import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitFindSomeoneCard extends StatelessWidget {
  final String? avatarUrl;
  final String? userNickName;
  final String? userName;
  final int? userPoints;
  final int? sameInterests;
  final VoidCallback? onMessage;
  final UserTileType userTileType;
  final VoidCallback? onAvatarTapped;

  const UiKitFindSomeoneCard({
    super.key,
    this.avatarUrl,
    this.userNickName,
    this.userName,
    this.userPoints,
    this.sameInterests,
    this.onMessage,
    this.userTileType = UserTileType.ordinary,
    this.onAvatarTapped,
  });

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final colorScheme = context.uiKitTheme?.colorScheme;

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: colorScheme?.surface3,
        borderRadius: BorderRadiusFoundation.all24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: onAvatarTapped,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.loose(Size(60.sp, 60.sp)),
                    child: context.userAvatar(
                      size: UserAvatarSize.x60x60,
                      type: userTileType,
                      userName: userName ?? '',
                      imageUrl: avatarUrl,
                    ),
                  ),
                ),
                SpacingFoundation.verticalSpace2,
                Text(
                  '@$userNickName',
                  style: boldTextTheme?.caption1Bold.copyWith(overflow: TextOverflow.ellipsis),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
                SpacingFoundation.verticalSpace2,
                Text(
                  userName ?? '',
                  maxLines: 2,
                  style: boldTextTheme?.caption1Bold.copyWith(
                    color: ColorsFoundation.darkNeutral900,
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 13.w,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SpacingFoundation.horizontalSpace8,
          Flexible(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: GradientFoundation.findSomeoneGradient,
                    borderRadius: BorderRadiusFoundation.all24,
                  ),
                  child: Center(
                    child: Text(
                      S.current.FindSomeoneCardPoints(userPoints ?? 0),
                      style: boldTextTheme?.caption1Bold.copyWith(fontSize: 13.w, color: Colors.black),
                    ).paddingSymmetric(
                      vertical: EdgeInsetsFoundation.vertical6,
                      horizontal: EdgeInsetsFoundation.horizontal12,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    S.current.FindSomeoneCardSameInterests(sameInterests ?? 0),
                    style: boldTextTheme?.caption1Bold.copyWith(
                      fontSize: 13.w,
                      color: ColorsFoundation.darkNeutral900,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                context.smallButton(
                  data: BaseUiKitButtonData(
                    onPressed: onMessage,
                    text: S.of(context).Message,
                    fit: ButtonFit.fitWidth,
                  ),
                ),
              ],
            ),
          ),
        ],
      ).paddingAll(EdgeInsetsFoundation.all16),
    );
  }
}
