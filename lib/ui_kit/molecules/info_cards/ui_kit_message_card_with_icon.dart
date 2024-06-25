import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitMessageCardWithIcon extends StatelessWidget {
  final String message;
  final IconData? icon;
  final String? iconLink;
  final Axis layoutDirection;
  final VoidCallback? onPressed;
  final MessageCardType type;

  const UiKitMessageCardWithIcon({
    super.key,
    required this.message,
    this.icon,
    this.iconLink,
    this.onPressed,
    required this.layoutDirection,
    this.type = MessageCardType.narrow,
  });

  @override
  Widget build(BuildContext context) {
    switch (layoutDirection) {
      case Axis.horizontal:
        return HorizontalMessageCard(
          message: message,
          iconData: icon,
          iconLink: iconLink,
          onPressed: onPressed,
        );
      case Axis.vertical:
        if (type == MessageCardType.wide) {
          return WideVerticalMessageCard(
            message: message,
            iconData: icon,
            iconLink: iconLink,
            onPressed: onPressed,
          );
        }

        return VerticalMessageCard(
          message: message,
          iconData: icon,
          iconLink: iconLink,
          onPressed: onPressed,
        );
    }
  }
}

enum MessageCardType { narrow, wide }
