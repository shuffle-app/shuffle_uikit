import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class FlatCircleButton extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData iconData;
  const FlatCircleButton({super.key, this.onTap, required this.iconData});

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final iconColor = theme?.customAppBapTheme.iconTheme?.color;
    final colorScheme = theme?.colorScheme;

    return Material(
      shape: const CircleBorder(),
      color: colorScheme?.surface3,
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colorScheme?.surface3,
          ),
          width: 28.w,
          height: 28.h,
          child: Center(
            child: ImageWidget(
              iconData: iconData,
              fit: BoxFit.cover,
              color: iconColor,
              height: 10.h,
            ),
          ),
        ),
      ),
    );
  }
}
