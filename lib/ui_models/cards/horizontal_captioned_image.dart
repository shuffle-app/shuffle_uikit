import 'package:flutter/cupertino.dart';

class HorizontalCaptionedImageData {
  final String imageUrl;
  final String caption;
  final VoidCallback? onTap;

  HorizontalCaptionedImageData({
    required this.imageUrl,
    required this.caption,
    this.onTap,
  });
}
