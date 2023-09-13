import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class HorizontalMessageCard extends StatelessWidget {
  final String message;
  final String? iconLink;
  final VoidCallback? onPressed;

  const HorizontalMessageCard({
    Key? key,
    required this.message,
    this.iconLink,
    this.onPressed,
  }) : super(key: key);

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
              if (iconLink != null)
                ImageWidget(
                  link: iconLink!,
                  height: 0.125.sw,
                  width: 0.125.sw,
                  fit: BoxFit.cover,
                ),
              if (iconLink != null) SpacingFoundation.horizontalSpace12,
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
