import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class HorizontalMessageCard extends StatelessWidget {
  final String message;
  final IconData? iconData;
  final String? iconLink;
  final VoidCallback? onPressed;

  const HorizontalMessageCard({
    super.key,
    required this.message,
    this.iconData,
    this.iconLink,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final messageStyle = context.uiKitTheme?.boldTextTheme.bodyUpperCase;
    final colorScheme = context.uiKitTheme?.colorScheme;

    return Material(
      borderRadius: BorderRadiusFoundation.all24,
      color: colorScheme?.surface2,
      child: InkWell(
        borderRadius: BorderRadiusFoundation.all24,
        onTap: onPressed,
        child: Ink(
          decoration: BoxDecoration(
            color: colorScheme?.surface2,
            borderRadius: BorderRadiusFoundation.all24,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (iconData != null || iconLink != null)
                ImageWidget(
                  iconData: iconData,
                  link: iconLink,
                  height: 0.125.sw,
                  width: 0.125.sw,
                  fit: BoxFit.cover,
                ),
              if (iconData != null || iconLink != null) SpacingFoundation.horizontalSpace12,
              Expanded(
                child: Text(
                  message.toUpperCase(),
                  style: messageStyle,
                ),
              ),
            ],
          ).paddingAll(EdgeInsetsFoundation.all16),
        ),
      ),
    );
  }
}
