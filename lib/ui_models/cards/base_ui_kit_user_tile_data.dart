import 'dart:ui';

import 'package:shuffle_uikit/shuffle_uikit.dart';

class BaseUiKitUserTileData {
  final String? name;
  final String? username;
  final String? avatarUrl;
  final UserTileType? type;
  final void Function()? onTap;
  final bool? showBadge;
  final bool? noMaterialOverlay;
  final String? speciality;
  final Color? userNameTextColor;

  BaseUiKitUserTileData({
    this.name,
    this.username,
    this.avatarUrl,
    this.type,
    this.onTap,
    this.showBadge,
    this.speciality,
    this.noMaterialOverlay,
    this.userNameTextColor,
  });
}
