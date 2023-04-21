import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_kit/atoms/user/premium_user_star.dart';
import 'package:shuffle_uikit/ui_kit/atoms/user/user_circle_avatar.dart';

abstract class _UserTile extends StatelessWidget {
  final UserTileInfo info;
  final Widget? trailing;
  final Border border;

  const _UserTile({
    Key? key,
    required this.info,
    required this.border,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;
    return CardWrapper(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          UserCircleAvatar(
            imageUrl: info.avatarUrl,
            size: 32.r,
            border: border,
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
                    info.name,
                    style: textTheme?.caption1.copyWith(color: Colors.white),
                  ),
                  SpacingFoundation.horizontalSpace8,
                  if (trailing != null) trailing!,
                ],
              ),
              Text(
                info.username,
                style: textTheme?.caption1Medium.copyWith(color: ColorsFoundation.solidGreyText),
              ),
            ],
          ),
        ],
      ).paddingAll(EdgeInsetsFoundation.all12),
    );
  }
}

class OrdinaryUserTile extends _UserTile {
  const OrdinaryUserTile({
    Key? key,
    required UserTileInfo info,
  }) : super(
          key: key,
          info: info,
          border: const Border(
            top: BorderSide(color: Colors.white, width: 2),
            right: BorderSide(color: Colors.white, width: 2),
            bottom: BorderSide(color: Colors.white, width: 2),
            left: BorderSide(color: Colors.white, width: 2),
          ),
        );
}

class PremiumUserTile extends _UserTile {
  const PremiumUserTile({
    super.key,
    required super.info,
  }) : super(
          border: const Border(
            top: BorderSide(color: Colors.white, width: 2),
            right: BorderSide(color: Colors.white, width: 2),
            bottom: BorderSide(color: Colors.white, width: 2),
            left: BorderSide(color: Colors.white, width: 2),
          ),
          trailing: const PremiumAccountMark(),
        );
}

class ProUserTile extends _UserTile {
  const ProUserTile({
    super.key,
    required super.info,
  }) : super(
          border: const Border(
            top: BorderSide(color: Colors.white, width: 2),
            right: BorderSide(color: Colors.white, width: 2),
            bottom: BorderSide(color: Colors.white, width: 2),
            left: BorderSide(color: Colors.white, width: 2),
          ),
          trailing: const ProAccountMark(),
        );
}

class InfluencerlUserTile extends _UserTile {
  const InfluencerlUserTile({super.key, required super.info})
      : super(
          border: const Border(
            top: BorderSide(color: Colors.white, width: 2),
            right: BorderSide(color: Colors.white, width: 2),
            bottom: BorderSide(color: Colors.white, width: 2),
            left: BorderSide(color: Colors.white, width: 2),
          ),
          trailing: const InfluencerAccountMark(),
        );
}
