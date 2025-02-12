import 'package:flutter/material.dart';

class HorizontalCaptionedImageData {
  final int placeId;
  final String imageUrl;
  final String caption;
  final VoidCallback? onTap;
  bool isSelected;

  HorizontalCaptionedImageData({
    required this.placeId,
    required this.imageUrl,
    required this.caption,
    this.onTap,
    this.isSelected = false,
  });
}
