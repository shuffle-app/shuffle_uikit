import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitMessageCardWithIcon extends StatelessWidget {
  final String message;
  final String? iconLink;
  final Axis layoutDirection;
  final VoidCallback? onPressed;

  const UiKitMessageCardWithIcon({
    Key? key,
    required this.message,
    this.iconLink,
    this.onPressed,
    required this.layoutDirection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (layoutDirection) {
      case Axis.horizontal:
        return HorizontalMessageCard(
          message: message,
          iconLink: iconLink,
          onPressed: onPressed,
        );
      case Axis.vertical:
        return VerticalMessageCard(
          message: message,
          iconLink: iconLink,
          onPressed: onPressed,
        );
    }
  }
}
