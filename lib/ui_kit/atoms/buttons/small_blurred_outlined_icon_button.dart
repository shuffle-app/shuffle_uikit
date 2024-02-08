import 'package:flutter/material.dart';
import 'package:flutter_html_iframe/shims/dart_ui_real.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SmallBlurredOutlinedIconButton extends StatelessWidget implements ButtonFactory {
  final VoidCallback? onPressed;
  final Color? borderColor;
  final Color? color;
  final Widget? icon;
  final BaseUiKitButtonIconData? iconInfo;
  final bool? loading;
  final double blurValue;

  const SmallBlurredOutlinedIconButton({
    Key? key,
    this.onPressed,
    this.borderColor,
    this.color,
    this.iconInfo,
    required this.icon,
    this.loading,
    double? blurValue,
  })  : blurValue = blurValue ?? 18,
        assert(iconInfo != null || icon != null, 'Either iconInfo or icon must be provided'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final colorScheme = theme?.colorScheme;
    final isLightTheme = theme?.themeMode == ThemeMode.light;

    return Material(
      shape: CircleBorder(
        side: BorderSide(
          color: borderColor ?? (isLightTheme ? ColorsFoundation.neutral24 : ColorsFoundation.neutral8),
          width: 1,
        ),
      ),
      clipBehavior: Clip.hardEdge,
      color: color ?? Colors.black.withOpacity(0.1),
      child: InkWell(
        onTap: loading ?? false ? null : onPressed,
        borderRadius: BorderRadiusFoundation.max,
        child: Ink(
          child: ClipOval(
            child: BackdropFilter(
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
              ).loadingWrap(loading ?? false, color: colorScheme?.inverseSurface),
            ),
          ),
        ),
      ),
    );
  }
}
