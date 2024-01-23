import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

abstract class BaseUserTile extends StatelessWidget implements UserTileFactory {
  final String? name;
  final String? avatarUrl;
  final Future<String?>? username;
  final Widget? trailing;
  final Border? avatarBorder;
  final VoidCallback? onTap;

  const BaseUserTile({
    Key? key,
    this.name,
    this.avatarUrl,
    this.username,
    this.avatarBorder,
    this.trailing,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;
    late final UserTileType  userType;
    if(trailing.runtimeType == ProAccountMark) {
      userType = UserTileType.pro;
    } else if (trailing.runtimeType == PremiumAccountMark) {
      userType = UserTileType.premium;
    } else {
      userType = UserTileType.ordinary;
    }

    return Material(
      color: Colors.transparent,
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadiusFoundation.all24,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadiusFoundation.all24,
        child: Ink(
          width: double.infinity,
          decoration: BoxDecoration(
            color: context.uiKitTheme?.cardColor,
            borderRadius: BorderRadiusFoundation.all24,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              context.userAvatar(
                size: UserAvatarSize.x40x40,
                type: userType,
                imageUrl: avatarUrl,
                userName: name ?? '',
              ),
              // BorderedUserCircleAvatar(
              //   imageUrl: avatarUrl,
              //   size: 37.r,
              //   border: avatarBorder,
              // ),
              SpacingFoundation.horizontalSpace12,
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: Text(
                            name ?? '',
                            style: textTheme?.caption1Bold.copyWith(
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        SpacingFoundation.horizontalSpace8,
                        if (trailing != null) trailing!,
                      ],
                    ),
                    FutureBuilder(future: username, builder: (context, snapshot) =>
                    Text(
                      snapshot.hasData ? snapshot.data ?? '' : '',
                      style: textTheme?.caption1Medium.copyWith(color: ColorsFoundation.darkNeutral900),
                    )),
                  ],
                ),
              ),
            ],
          ).paddingAll(EdgeInsetsFoundation.all12),
        ),
      ),
    );
  }
}

enum UserTileType { ordinary, pro, premium, influencer }
