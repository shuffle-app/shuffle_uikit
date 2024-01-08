import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BouncingBlurButton extends StatelessWidget implements ButtonFactory {
  final VoidCallback? onPressed;
  final Widget? icon;
  final BaseUiKitButtonIconData? iconInfo;

  const BouncingBlurButton({
    super.key,
    this.onPressed,
    this.icon,
    this.iconInfo,
  }) : assert(iconInfo != null || icon != null, 'Either iconInfo or icon must be provided');

  @override
  Widget build(BuildContext context) {
    return BouncingIconButtonAnimation(
      icon: icon ??
          ImageWidget(
            iconData: iconInfo?.iconData,
            link: iconInfo?.iconPath,
            height: iconInfo?.size,
            fit: BoxFit.fitHeight,
            color: iconInfo?.color ?? context.uiKitTheme?.colorScheme.surface,
          ),
      onPressed: onPressed,
      iconPadding: EdgeInsetsFoundation.all16,
    );
  }
}
