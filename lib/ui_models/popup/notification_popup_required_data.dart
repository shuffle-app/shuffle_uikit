import 'package:flutter/widgets.dart';

class NotificationPopupRequiredData {
  final String? titleString;
  final Widget? customTitle;
  final Widget icon;
  final bool gradientBorder;
  final TextAlign textAlign;

  NotificationPopupRequiredData({
    this.titleString,
    required this.icon,
    this.customTitle,
    this.textAlign = TextAlign.left,
    this.gradientBorder = false,
  }) : assert(
          titleString != null || customTitle != null,
          'Either titleString or customTitle must be provided. You can\'t have both',
        );
}
