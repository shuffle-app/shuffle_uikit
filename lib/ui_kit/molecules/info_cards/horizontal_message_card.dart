import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class HorizontalMessageCard extends StatelessWidget {
  final String message;
  final Widget? icon;

  const HorizontalMessageCard({
    Key? key,
    required this.message,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messageStyle = context.uiKitTheme?.boldTextTheme.bodyUpperCase;

    return UiKitCardWrapper(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (icon != null) icon!,
          if (icon != null) SpacingFoundation.horizontalSpace12,
          Expanded(
            child: Text(
              message.toUpperCase(),
              style: messageStyle,
            ),
          ),
        ],
      ).paddingAll(EdgeInsetsFoundation.all16),
    );
  }
}
