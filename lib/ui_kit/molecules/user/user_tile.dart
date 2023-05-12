import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

abstract class _BaseUserTile extends StatelessWidget implements UserTileFactory {
  final String? name;
  final String? avatarUrl;
  final String? username;
  final Widget? trailing;
  final Border? avatarBorder;
  final VoidCallback? onTap;

  const _BaseUserTile({
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
          decoration: BoxDecoration(
            color: context.uiKitTheme?.cardColor,
            borderRadius: BorderRadiusFoundation.all24,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              UserCircleAvatar(
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

class UserTile extends _BaseUserTile {
  const UserTile({
    Key? key,
    super.name,
    super.avatarUrl,
    super.username,
    super.onTap,
    Border? border,
  }) : super(
          key: key,
          avatarBorder: border ??
              const Border(
                top: BorderSide(color: Colors.white, width: 2),
                right: BorderSide(color: Colors.white, width: 2),
                bottom: BorderSide(color: Colors.white, width: 2),
                left: BorderSide(color: Colors.white, width: 2),
              ),
        );
}

class PremiumUserTile extends _BaseUserTile {
  PremiumUserTile({
    super.key,
    super.name,
    super.avatarUrl,
    super.username,
    super.onTap,
    Border? border,
  }) : super(
          avatarBorder: border ??
              const Border(
                top: BorderSide(color: Colors.white, width: 2),
                right: BorderSide(color: Colors.white, width: 2),
                bottom: BorderSide(color: Colors.white, width: 2),
                left: BorderSide(color: Colors.white, width: 2),
              ),
          trailing: PremiumAccountMark(),
        );
}

class ProUserTile extends _BaseUserTile {
  ProUserTile({
    super.key,
    super.name,
    super.avatarUrl,
    super.username,
    super.onTap,
    Border? border,
  }) : super(
          avatarBorder: border ??
              const Border(
                top: BorderSide(color: Colors.white, width: 2),
                right: BorderSide(color: Colors.white, width: 2),
                bottom: BorderSide(color: Colors.white, width: 2),
                left: BorderSide(color: Colors.white, width: 2),
              ),
          trailing: ProAccountMark(),
        );
}

class InfluencerUserTile extends _BaseUserTile {
  InfluencerUserTile({
    super.key,
    super.name,
    super.avatarUrl,
    super.username,
    super.onTap,
    Border? border,
  }) : super(
          avatarBorder: border ??
              const Border(
                top: BorderSide(color: Colors.white, width: 2),
                right: BorderSide(color: Colors.white, width: 2),
                bottom: BorderSide(color: Colors.white, width: 2),
                left: BorderSide(color: Colors.white, width: 2),
              ),
          trailing: InfluencerAccountMark(),
        );
}

enum UserTileType { ordinary, pro, premium, influencer }
