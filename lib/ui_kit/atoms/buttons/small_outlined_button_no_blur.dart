import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SmallOutlinedButtonNoBlur extends StatelessWidget implements ButtonFactory {
  final String? text;
  final VoidCallback? onPressed;
  final Color? borderColor;
  final Color? textColor;
  final Widget? icon;
  final BaseUiKitButtonIconData? iconInfo;
  final bool? loading;
  final ButtonFit? fit;

  bool get textIsEmpty => text?.isEmpty ?? true;

  const SmallOutlinedButtonNoBlur({
    super.key,
    this.text,
    this.onPressed,
    this.borderColor,
    this.textColor,
    this.icon,
    this.loading,
    this.fit,
    this.iconInfo,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final colorScheme = theme?.colorScheme;
    final textStyle = theme?.boldTextTheme.caption1UpperCaseMedium.copyWith(
      color: textColor,
    );

    return Material(
      borderRadius: textIsEmpty ? null : BorderRadiusFoundation.max,
      shape: textIsEmpty ? const CircleBorder() : null,
      clipBehavior: Clip.hardEdge,
      color: Colors.transparent,
      child: InkWell(
        onTap: loading ?? false ? null : onPressed,
        borderRadius: BorderRadiusFoundation.max,
        child: Ink(
          padding: EdgeInsets.all(EdgeInsetsFoundation.all12),
          decoration: BoxDecoration(
            borderRadius: textIsEmpty ? null : BorderRadiusFoundation.max,
            shape: textIsEmpty ? BoxShape.circle : BoxShape.rectangle,
            border: Border.all(
              color: borderColor ?? context.uiKitTheme!.colorScheme.inversePrimary,
              width: 2.w,
            ),
            color: textIsEmpty ? Colors.white.withOpacity(0.1) : null,
          ),
          child: textIsEmpty && (icon != null || iconInfo != null)
              ? ClipOval(
                  child: icon ??
                      ImageWidget(
                        iconData: iconInfo?.iconData,
                        link: iconInfo?.iconPath,
                        height: iconInfo?.size,
                        fit: BoxFit.fitHeight,
                        color: iconInfo?.color ?? theme?.colorScheme.inversePrimary,
                      ),
                )
              : Text(
                  text ?? '',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ).loadingWrap(loading ?? false, color: colorScheme?.surface),
        ),
      ),
    );
  }
}
