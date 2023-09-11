import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SmallOutlinedButtonNoBlur extends StatelessWidget implements ButtonFactory {
  final String? text;
  final VoidCallback? onPressed;
  final Color? borderColor;
  final Color? textColor;
  final Widget? icon;
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
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = context.uiKitTheme?.boldTextTheme.caption1UpperCaseMedium.copyWith(
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
          padding: EdgeInsets.symmetric(
            vertical: EdgeInsetsFoundation.vertical4,
            horizontal: EdgeInsetsFoundation.horizontal16,
          ),
          decoration: BoxDecoration(
            borderRadius: textIsEmpty ? null : BorderRadiusFoundation.max,
            shape: textIsEmpty ? BoxShape.circle : BoxShape.rectangle,
            border: Border.all(
              color: borderColor ?? context.uiKitTheme!.colorScheme.inversePrimary,
              width: 2.w,
            ),
            color: textIsEmpty ? Colors.white.withOpacity(0.1) : null,
          ),
          child: textIsEmpty && icon != null
              ? ClipOval(
                  child: icon!.paddingAll(EdgeInsetsFoundation.all6),
                )
              : Text(
                  text ?? '',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ).loadingWrap(loading ?? false, color: Colors.white),
        ),
      ),
    );
  }
}
