import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

abstract class BaseUiKitAdvertisementBannerConfig {
  final double availableWidth;
  final double? customHeight;
  final VoidCallback? onPressed;
  final String imageLink;
  final AdvertisementBannerSize size;

  const BaseUiKitAdvertisementBannerConfig({
    required this.availableWidth,
    required this.imageLink,
    required this.size,
    this.customHeight,
    this.onPressed,
  });
}

class BaseUiKitAdvertisementImageBannerData extends BaseUiKitAdvertisementBannerConfig {
  final String title;

  const BaseUiKitAdvertisementImageBannerData({
    required this.title,
    required super.availableWidth,
    required super.imageLink,
    required super.size,
    super.customHeight,
    super.onPressed,
  });
}

class BaseUiKitAdvertisementTextBannerData extends BaseUiKitAdvertisementImageBannerData {
  final Widget textWidget;
  final Alignment? textAlignment;
  final Offset? textExactOffset;
  final double? customPadding;
  final Widget? decoration;
  final BoxFit? imageFit;

  const BaseUiKitAdvertisementTextBannerData({
    required this.textWidget,
    this.textAlignment,
    this.textExactOffset,
    this.customPadding,
    this.decoration,
    this.imageFit,
    super.title = '',
    required super.availableWidth,
    required super.imageLink,
    required super.size,
    super.customHeight,
    super.onPressed,
  });
}
