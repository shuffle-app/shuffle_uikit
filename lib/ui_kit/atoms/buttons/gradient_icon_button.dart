import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class GradientIconButton extends StatelessWidget implements ButtonFactory {
  final Widget? icon;
  final BaseUiKitButtonIconData? iconInfo;
  final VoidCallback? onPressed;
  final BorderRadius? borderRadius;
  final bool? loading;
  final ButtonFit? fit;

  const GradientIconButton({
    Key? key,
    required this.icon,
    this.fit,
    this.onPressed,
    this.borderRadius,
    this.loading,
    this.iconInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;
    final colorScheme = context.uiKitTheme?.colorScheme;
    final child = Padding(
      padding: EdgeInsets.all(EdgeInsetsFoundation.all12),
      child: icon ??
          ImageWidget(
            iconData: iconInfo?.iconData,
            link: iconInfo?.iconPath,
            height: iconInfo?.size,
            fit: BoxFit.fitHeight,
            color: iconInfo?.color ?? Colors.black,
          ),
    );

    return Material(
      borderRadius: borderRadius ?? BorderRadiusFoundation.all24,
      child: InkWell(
        borderRadius: borderRadius ?? BorderRadiusFoundation.all24,
        onTap: enabled && !(loading ?? false) ? onPressed : null,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadiusFoundation.all24,
            gradient: enabled ? GradientFoundation.attentionCard : null,
            color: enabled ? null : ColorsFoundation.darkNeutral300,
          ),
          child: loading ?? false
              ? const SizedBox()
              : fit == ButtonFit.hugContent
                  ? child
                  : Center(child: child),
        ),
      ),
    ).loadingWrap(loading ?? false, color: colorScheme?.inverseSurface);
  }
}
