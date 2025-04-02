import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class GradientIconButton extends StatelessWidget implements ButtonFactory {
  final Widget? icon;
  final BaseUiKitButtonIconData? iconInfo;
  final VoidCallback? onPressed;
  final bool? loading;
  final ButtonFit? fit;
  final EdgeInsetsGeometry? padding;

  const GradientIconButton({
    super.key,
    required this.icon,
    this.fit,
    this.onPressed,
    this.loading,
    this.iconInfo,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;
    final colorScheme = context.uiKitTheme?.colorScheme;
    final child = Padding(
      padding: padding ?? EdgeInsets.all(EdgeInsetsFoundation.all12),
      child: icon ??
          ImageWidget(
            iconData: iconInfo?.iconData,
            link: iconInfo?.iconPath,
            height: iconInfo?.size,
            fit: BoxFit.fitHeight,
            color: iconInfo?.color ?? Colors.black,
          ),
    );

    return InkWell(
      borderRadius: BorderRadiusFoundation.max,
      onTap: enabled && !(loading ?? false) ? onPressed : null,
      child: DecoratedBox(
        decoration: BoxDecoration(
            gradient: enabled ? GradientFoundation.attentionCard : null,
            color: enabled ? null : ColorsFoundation.darkNeutral300,
            shape: BoxShape.circle
        ),
        child: fit == ButtonFit.hugContent
            ? child
            : Center(child: child),
      ),
    ).loadingWrap(loading ?? false, color: colorScheme?.surface, opacity: 0.5);
  }
}
