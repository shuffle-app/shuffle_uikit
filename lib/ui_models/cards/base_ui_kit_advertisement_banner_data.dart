import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BaseUiKitAdvertisementBannerData {
  final double availableWidth;
  final double? customHeight;
  final VoidCallback? onPressed;
  final String imageLink;
  final String title;
  final AdvertisementBannerSize size;

  BaseUiKitAdvertisementBannerData({
    required this.availableWidth,
    this.onPressed,
    this.customHeight,
    required this.imageLink,
    required this.title,
    required this.size,
  });
}
