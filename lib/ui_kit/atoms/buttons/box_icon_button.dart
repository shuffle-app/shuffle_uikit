import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BoxIconButton extends StatelessWidget implements ButtonFactory {
  final Widget? icon;
  final BaseUiKitButtonIconData? iconInfo;
  final VoidCallback? onPressed;
  final Color? backgroundColor;

  const BoxIconButton({
    Key? key,
    this.icon,
    this.iconInfo,
    this.onPressed,
    this.backgroundColor,
  })  : assert(iconInfo != null || icon != null,
            'Either iconInfo or icon must be provided'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusFoundation.all8,
        color: backgroundColor ?? theme?.colorScheme.surface1,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadiusFoundation.all8,
          child: Ink(
            child: ImageWidget(
              iconData: iconInfo?.iconData,
              link: iconInfo?.iconPath,
              height: iconInfo?.size,
              fit: BoxFit.fitHeight,
              color: iconInfo?.color ?? theme?.colorScheme.inverseSurface,
            ).paddingAll(EdgeInsetsFoundation.all6),
          ),
        ),
      ),
    );
  }
}
