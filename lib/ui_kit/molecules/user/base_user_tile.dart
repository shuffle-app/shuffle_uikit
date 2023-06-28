import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

abstract class BaseUserTile extends StatelessWidget implements UserTileFactory {
  final String? name;
  final String? avatarUrl;
  final String? username;
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
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BorderedUserCircleAvatar(
                imageUrl: avatarUrl,
                size: 32.r,
                border: avatarBorder,
              ),
              SpacingFoundation.horizontalSpace12,
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        name ?? '',
                        style: textTheme?.caption1Bold.copyWith(color: Colors.white),
                      ),
                      SpacingFoundation.horizontalSpace8,
                      if (trailing != null) trailing!,
                    ],
                  ),
                  Text(
                    username ?? '',
                    style: textTheme?.caption1Medium.copyWith(color: ColorsFoundation.darkNeutral900),
                  ),
                ],
              ),
            ],
          ).paddingAll(EdgeInsetsFoundation.all12),
        ),
      ),
    );
  }
}

enum UserTileType { ordinary, pro, premium, influencer }
