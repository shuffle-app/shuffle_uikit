import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitMessageCardWithIcon extends StatelessWidget {
  final String message;
  final Widget? icon;
  final Axis layoutDirection;

  const UiKitMessageCardWithIcon({
    Key? key,
    required this.message,
    this.icon,
    required this.layoutDirection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (layoutDirection) {
      case Axis.horizontal:
        return HorizontalMessageCard(
          message: message,
          icon: icon,
        );
      case Axis.vertical:
        return VerticalMessageCard(
          message: message,
          icon: icon,
        );
    }
  }
}
