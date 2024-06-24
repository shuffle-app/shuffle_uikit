import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BlurredButtonWithIcon extends StatelessWidget implements ButtonFactory {
  final VoidCallback? onPressed;
  final Widget? icon;
  final BaseUiKitButtonIconData? iconInfo;

  const BlurredButtonWithIcon({
    super.key,
    this.onPressed,
    this.icon,
    this.iconInfo,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.uiKitTheme?.colorScheme;

    return Material(
      shape: const CircleBorder(),
      color: colorScheme?.inversePrimary,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadiusFoundation.max,
        child: Ink(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colorScheme?.inversePrimary,
          ),
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 19, sigmaY: 19),
              child: Padding(
                padding: EdgeInsets.all(EdgeInsetsFoundation.all16),
                child: icon ??
                    ImageWidget(
                      iconData: iconInfo?.iconData,
                      link: iconInfo?.iconPath,
                      height: iconInfo?.size,
                      fit: BoxFit.fitHeight,
                      color: iconInfo?.color ?? colorScheme?.primary,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
