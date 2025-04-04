import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SmallGradientIconButton extends StatelessWidget implements ButtonFactory {
  final VoidCallback? onPressed;
  final Widget? icon;
  final BaseUiKitButtonIconData? iconInfo;

  const SmallGradientIconButton({
    super.key,
    this.onPressed,
    this.icon,
    this.iconInfo,
  })  : assert(iconInfo != null || icon != null, 'Either iconInfo or icon must be provided');

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.hardEdge,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onPressed,
        child: Ink(
          decoration: const BoxDecoration(
            gradient: GradientFoundation.defaultRadialGradient,
            shape: BoxShape.circle,
          ),
          child: Center(
              child: icon ??
                ImageWidget(
                  iconData: iconInfo?.iconData,
                  link: iconInfo?.iconPath,
                  height: iconInfo?.size,
                  fit: BoxFit.fitHeight,
                  color: Colors.black,
                ),
          ),
        ),
      ),
    );
  }
}
