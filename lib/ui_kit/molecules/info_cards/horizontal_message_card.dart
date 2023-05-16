import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class HorizontalMessageCard extends StatelessWidget {
  final String message;
  final Widget? icon;
  final VoidCallback? onPressed;

  const HorizontalMessageCard({
    Key? key,
    required this.message,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messageStyle = context.uiKitTheme?.boldTextTheme.bodyUpperCase;

    return Material(
      borderRadius: BorderRadiusFoundation.all24,
      color: context.uiKitTheme?.cardColor,
      child: InkWell(
        borderRadius: BorderRadiusFoundation.all24,
        onTap: onPressed,
        child: Ink(
          decoration: BoxDecoration(
            color: context.uiKitTheme?.cardColor,
            borderRadius: BorderRadiusFoundation.all24,
          ),
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
        ),
      ),
    );
  }
}
