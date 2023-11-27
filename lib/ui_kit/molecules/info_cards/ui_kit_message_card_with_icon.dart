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
    Key? key,
    required this.message,
    this.icon,
    this.iconLink,
    this.onPressed,
    required this.layoutDirection,
    this.type = MessageCardType.narrow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (layoutDirection) {
      case Axis.horizontal:
        return HorizontalMessageCard(
          message: message,
          iconData: icon,
          onPressed: onPressed,
        );
      case Axis.vertical:
        if (type == MessageCardType.wide) {
          return WideVerticalMessageCard(
            message: message,
            iconData: icon,
            onPressed: onPressed,
          );
        }

        return VerticalMessageCard(
          message: message,
          iconData: icon,
          onPressed: onPressed,
        );
    }
  }
}

enum MessageCardType { narrow, wide }
