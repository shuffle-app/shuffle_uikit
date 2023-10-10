import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BaseUiKitAdvertisementBannerData {
  final double availableWidth;
  final VoidCallback onPressed;
  final String imageLink;
  final String title;
  final AdvertisementBannerSize size;

  BaseUiKitAdvertisementBannerData({
    required this.availableWidth,
    required this.onPressed,
    required this.imageLink,
    required this.title,
    required this.size,
  });
}
