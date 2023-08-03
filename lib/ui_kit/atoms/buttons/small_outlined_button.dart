import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SmallOutlinedButton extends StatelessWidget implements ButtonFactory {
  final String text;
  final VoidCallback? onPressed;
  final Color? borderColor;
  final Color? textColor;
  final ImageWidget? icon;
  final bool blurred;
  final bool? loading;

  const SmallOutlinedButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.borderColor,
    this.textColor,
    required this.blurred,
    this.icon,
    this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = context.uiKitTheme?.boldTextTheme.caption1UpperCaseMedium.copyWith(color: textColor);
    double blurValue = 0;
    if (blurred) blurValue = 18;

    return Material(
      borderRadius: text.isEmpty ? null : BorderRadiusFoundation.max,
      shape: text.isEmpty ? const CircleBorder() : null,
      clipBehavior: Clip.hardEdge,
      color: text.isEmpty ? Colors.white.withOpacity(0.1) : Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadiusFoundation.max,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: text.isEmpty ? null : BorderRadiusFoundation.max,
            shape: text.isEmpty ? BoxShape.circle : BoxShape.rectangle,
            border: Border.all(
              color: borderColor ?? Colors.white,
              width: 2.w,
            ),
            color: text.isEmpty ? Colors.white.withOpacity(0.1) : null,
          ),
          child: loading ?? false
              ? const AdaptiveLoader()
              : text.isEmpty && icon != null
                  ? ClipOval(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: blurValue, sigmaY: blurValue),
                        child: icon!.paddingAll(EdgeInsetsFoundation.all8),
                      ),
                    )
                  : Center(
                      child: Text(
                        text,
                        style: textStyle,
                      ).paddingSymmetric(
                        vertical: EdgeInsetsFoundation.vertical4,
                        horizontal: EdgeInsetsFoundation.horizontal16,
                      ),
                    ),
        ),
      ),
    );
  }
}
