import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final iconColor = context.uiKitTheme?.customAppBapTheme.iconTheme?.color;
    final colorScheme = context.uiKitTheme?.colorScheme;

    return Material(
      shape: const CircleBorder(),
      color: colorScheme?.surface3,
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Ink(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colorScheme?.surface3,
          ),
          width: 28.w,
          height: 28.h,
          child: Center(
            child: ImageWidget(
              iconData: ShuffleUiKitIcons.chevronleft,
              fit: BoxFit.cover,
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
