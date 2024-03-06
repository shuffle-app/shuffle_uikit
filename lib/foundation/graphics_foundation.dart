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
      case 'food':
        return ShuffleUiKitIcons.food;
      case 'family':
        return ShuffleUiKitIcons.family;
      case 'pointy-head':
        return ShuffleUiKitIcons.point;
      case 'tiger':
        return ShuffleUiKitIcons.tiger;
      case 'athlete':
        return ShuffleUiKitIcons.athlete;
      case 'sleep':
        return ShuffleUiKitIcons.sleep;
      case 'adventure':
        return ShuffleUiKitIcons.adventure;
      case 'swim':
        return ShuffleUiKitIcons.swim;
      case 'gym':
        return ShuffleUiKitIcons.gym;
      case 'club':
        return ShuffleUiKitIcons.club;
      case 'finance':
        return ShuffleUiKitIcons.finance;
      case 'karaoke':
        return ShuffleUiKitIcons.karaoke;
      case 'aquapark':
        return ShuffleUiKitIcons.aquapark;
      case 'analytics_business':
        return ShuffleUiKitIcons.analyticsBusiness;
      case 'coworking':
        return ShuffleUiKitIcons.coworking;
      case 'investment':
        return ShuffleUiKitIcons.investment;
      case 'restaurant':
        return ShuffleUiKitIcons.restaurant;
      case 'waterpool':
        return ShuffleUiKitIcons.waterpool;
      case 'businessman':
        return ShuffleUiKitIcons.businessman;
      case 'conferences':
        return ShuffleUiKitIcons.conferences;
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
        return ShuffleUiKitIcons.star;
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
      case 'company_layered':
        return ShuffleUiKitIcons.companyLayered;
      case 'person_layered':
        return ShuffleUiKitIcons.personLayered;
      case 'big_arrow':
        return ShuffleUiKitIcons.bigArrow;
      case 'google_logo':
        return ShuffleUiKitIcons.googleLogo;
      case 'apple_logo':
        return ShuffleUiKitIcons.appleLogo;
      case 'facebook_logo':
        return ShuffleUiKitIcons.facebookLogo;
      default:
        return orElse ?? Icons.error;
    }
  }
}
