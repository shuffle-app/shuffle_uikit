import 'package:flutter/material.dart';

class BaseUiKitButtonData {
  final VoidCallback? onPressed;
  final String text;
  final Widget? icon;

  BaseUiKitButtonData({this.onPressed, this.text = '', this.icon});
}
