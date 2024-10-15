import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class GraphicsFoundation {
  static GraphicsFoundation instance = const GraphicsFoundation._();

  $AssetsImagesSvgGen get svg => Assets.images.svg;

  $AssetsImagesPngGen get png => Assets.images.png;

  $AssetsAnimationsGen get animations => Assets.animations;

  const GraphicsFoundation._();

  IconData iconFromString(String iconName, {IconData? orElse}) {
    switch (iconName) {
      case 'logout':
        return ShuffleUiKitIcons.logout;
      case 'wallet':
        return ShuffleUiKitIcons.wallet;
      case 'archive':
        return ShuffleUiKitIcons.archive;
      case 'building':
        return ShuffleUiKitIcons.building;
      case 'label':
        return ShuffleUiKitIcons.label;
      case 'profile-delete':
        return ShuffleUiKitIcons.profiledelete;
      case 'warning':
        return ShuffleUiKitIcons.warning;
      case 'flag':
        return ShuffleUiKitIcons.flag;
      case 'location':
        return ShuffleUiKitIcons.location;
      case 'star-outline':
        return ShuffleUiKitIcons.staroutline;
      case 'star':
        return ShuffleUiKitIcons.staroutline;
      case 'star-fill':
        return ShuffleUiKitIcons.starfill;
      case 'heart-fill':
        return ShuffleUiKitIcons.heartfill;
      case 'profile_outline':
        return ShuffleUiKitIcons.profileoutline;
      case 'user':
        return ShuffleUiKitIcons.user;
      case 'landmark':
        return ShuffleUiKitIcons.landmark;
      case 'bell':
        return ShuffleUiKitIcons.bell;
      default:
        return orElse ?? Icons.error;
    }
  }
}
