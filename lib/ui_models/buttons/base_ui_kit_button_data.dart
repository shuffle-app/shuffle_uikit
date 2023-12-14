import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BaseUiKitButtonData {
  final VoidCallback? onPressed;
  final String? text;
  final Widget? iconWidget;
  final BaseUiKitButtonIconData? iconInfo;
  final ButtonFit? fit;
  final bool? loading;
  final Color? borderColor;

  BaseUiKitButtonData({
    this.onPressed,
    this.text,
    this.iconInfo,
    this.iconWidget,
    this.fit,
    this.loading,
    this.borderColor,
  });
}

class BaseUiKitButtonIconData {
  final IconData? iconData;
  final String? iconPath;
  final Color? color;
  final double? size;

  BaseUiKitButtonIconData({
    this.iconData,
    this.iconPath,
    this.color,
    this.size,
  });
}
