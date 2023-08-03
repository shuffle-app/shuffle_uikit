import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BaseUiKitButtonData {
  final VoidCallback? onPressed;
  final String text;
  final Widget? icon;
  final ButtonFit? fit;
  final bool? loading;

  BaseUiKitButtonData({
    this.onPressed,
    this.text = '',
    this.icon,
    this.fit,
    this.loading,
  });
}
