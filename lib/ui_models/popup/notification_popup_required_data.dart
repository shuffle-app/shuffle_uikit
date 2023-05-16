import 'package:flutter/widgets.dart';

class NotificationPopupRequiredData {
  final String? titleString;
  final Widget? customTitle;
  final Widget icon;
  final bool gradientBorder;

  NotificationPopupRequiredData({
    this.titleString,
    required this.icon,
    this.customTitle,
    this.gradientBorder = false,
  }) : assert(
          titleString != null || customTitle != null,
          'Either titleString or customTitle must be provided. You can\'t have both',
        );
}
