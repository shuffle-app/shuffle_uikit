import 'package:flutter/material.dart';
import 'package:flutter_html_iframe/shims/dart_ui_real.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SmallBlurredOutlinedIconButton extends StatelessWidget implements ButtonFactory {
  final VoidCallback? onPressed;
  final Color? borderColor;
  final Color? backgroundColor;
  final Widget? icon;
  final BaseUiKitButtonIconData? iconInfo;
  final bool? loading;
  final double blurValue;
  final BorderRadius? borderRadius;
  final Gradient? gradient;

  const SmallBlurredOutlinedIconButton({
    super.key,
    this.onPressed,
    this.borderColor,
    this.backgroundColor,
    this.iconInfo,
    required this.icon,
    this.loading,
    this.gradient,
    this.borderRadius,
    double? blurValue,
  })  : blurValue = blurValue ?? 18,
        assert(iconInfo != null || icon != null, 'Either iconInfo or icon must be provided');

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final colorScheme = theme?.colorScheme;
    final isLightTheme = theme?.themeMode == ThemeMode.light;
    final buttonBody = BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: blurValue,
        sigmaY: blurValue,
        tileMode: TileMode.repeated,
      ),
      child: Padding(
        padding: EdgeInsets.all(EdgeInsetsFoundation.all6),
        child: icon ??
            ImageWidget(
              iconData: iconInfo?.iconData,
              link: iconInfo?.iconPath,
              height: iconInfo?.size,
              fit: BoxFit.fitHeight,
              color: iconInfo?.color ?? theme?.colorScheme.inversePrimary,
            ),
      ).loadingWrap(loading ?? false, color: colorScheme?.surface),
    );

    return Material(
      shape: gradient == null
          ? CircleBorder(
              side: BorderSide(
                color: borderColor ?? (isLightTheme ? ColorsFoundation.neutral24 : ColorsFoundation.neutral8),
                width: 1,
              ),
            )
          : null,
      clipBehavior: Clip.hardEdge,
      color: backgroundColor ?? Colors.black.withOpacity(0.1),
      borderRadius: borderRadius,
      child: InkWell(
        onTap: loading ?? false ? null : onPressed,
        borderRadius: borderRadius ?? BorderRadiusFoundation.max,
        child: Ink(
          decoration: BoxDecoration(
              borderRadius: borderRadius,
              border: gradient != null ? GradientBoxBorder(gradient: gradient!) : null),
          child: borderRadius != null
              ? ClipRRect(
                  borderRadius: borderRadius!,
                  clipBehavior: Clip.hardEdge,
                  child: buttonBody,
                )
              : ClipOval(
                  child: buttonBody,
                ),
        ),
      ),
    );
  }
}
