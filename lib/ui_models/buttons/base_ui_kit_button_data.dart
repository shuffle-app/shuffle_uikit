import 'package:auto_size_text/auto_size_text.dart';
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
  final Color? backgroundColor;
  final Color? textColor;
  final AutoSizeGroup? autoSizeGroup;

  BaseUiKitButtonData({
    this.onPressed,
    this.text,
    this.iconInfo,
    this.iconWidget,
    this.fit,
    this.loading,
    this.borderColor,
    this.backgroundColor,
    this.autoSizeGroup,
    this.textColor,
  }) : assert(iconInfo == null || iconWidget == null, 'You can only use one of iconInfo or iconWidget');
}

class BaseUiKitButtonIconData {
  final IconData? iconData;
  final String? iconPath;
  final Color? color;
  final double? size;
  final Alignment? _iconAlignment;
  final double? padding;

  bool get isLeftIcon =>
      _iconAlignment == Alignment.bottomLeft ||
      _iconAlignment == Alignment.centerLeft ||
      _iconAlignment == Alignment.topLeft;

  bool get isRightIcon =>
      _iconAlignment == Alignment.bottomRight ||
      _iconAlignment == Alignment.centerRight ||
      _iconAlignment == Alignment.topRight;

  BaseUiKitButtonIconData({
    this.iconData,
    this.iconPath,
    this.color,
    this.size,
    this.padding,
    Alignment? iconAlignment,
  }) : _iconAlignment = iconAlignment ?? Alignment.centerRight;
}
