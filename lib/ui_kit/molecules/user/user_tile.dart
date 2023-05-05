import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

abstract class _UserTile extends StatelessWidget {
  final String name;
  final String avatarUrl;
  final String username;
  final Widget? trailing;
  final Border border;

  const _UserTile({
    Key? key,
    required this.name,
    required this.avatarUrl,
    required this.username,
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
            imageUrl: avatarUrl,
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
                    name,
                    style: textTheme?.caption1Bold.copyWith(color: Colors.white),
                  ),
                  SpacingFoundation.horizontalSpace8,
                  if (trailing != null) trailing!,
                ],
              ),
              Text(
                username,
                style: textTheme?.caption1Medium.copyWith(color: ColorsFoundation.darkNeutral900),
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
    required super.name,
    required super.avatarUrl,
    required super.username,
  }) : super(
          key: key,
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
    required super.name,
    required super.avatarUrl,
    required super.username,
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
    required super.name,
    required super.avatarUrl,
    required super.username,
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
  const InfluencerlUserTile({
    super.key,
    required super.name,
    required super.avatarUrl,
    required super.username,
  }) : super(
          border: const Border(
            top: BorderSide(color: Colors.white, width: 2),
            right: BorderSide(color: Colors.white, width: 2),
            bottom: BorderSide(color: Colors.white, width: 2),
            left: BorderSide(color: Colors.white, width: 2),
          ),
          trailing: const InfluencerAccountMark(),
        );
}
