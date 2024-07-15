import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class MidSizeOutlinedIconButton extends StatelessWidget implements ButtonFactory {
  final VoidCallback? onPressed;
  final Color? borderColor;
  final Widget? icon;
  final BaseUiKitButtonIconData? iconInfo;
  final bool? loading;
  final ButtonFit? fit;

  const MidSizeOutlinedIconButton({
    Key? key,
    this.onPressed,
    this.borderColor,
    this.icon,
    this.iconInfo,
    this.loading,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final colorScheme = theme?.colorScheme;

    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      color: Colors.transparent,
      child: InkWell(
        onTap: loading ?? false ? null : onPressed,
        borderRadius: BorderRadiusFoundation.max,
        child: Ink(
          padding: EdgeInsets.all(EdgeInsetsFoundation.all10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: borderColor ?? context.uiKitTheme!.colorScheme.inversePrimary,
              width: 2.w,
            ),
          ),
          child: icon ??
              ImageWidget(
                iconData: iconInfo?.iconData,
                link: iconInfo?.iconPath,
                height: iconInfo?.size,
                fit: BoxFit.fitHeight,
                color: iconInfo?.color ?? theme?.colorScheme.inversePrimary,
              ).loadingWrap(loading ?? false, color: colorScheme?.surface),
        ),
      ),
    );
  }
}
