import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SmallOutlinedButton extends StatelessWidget implements ButtonFactory {
  final String text;
  final VoidCallback? onPressed;
  final Color? borderColor;
  final Color? textColor;
  final Color? backgroundColor;
  final ImageWidget? icon;
  final bool blurred;
  final bool? loading;
  final Gradient? gradient;
  final AutoSizeGroup? group;

  const SmallOutlinedButton({
    super.key,
    required this.text,
    this.onPressed,
    this.borderColor,
    this.backgroundColor,
    this.textColor,
    this.gradient,
    required this.blurred,
    this.icon,
    this.loading,
    this.group,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final colorScheme = theme?.colorScheme;
    final textStyle = theme?.boldTextTheme.caption1UpperCaseMedium.copyWith(
      color:
          onPressed == null ? colorScheme!.inversePrimary.withOpacity(0.5) : textColor ?? colorScheme!.inversePrimary,
    );
    double blurValue = 0;
    if (blurred) blurValue = 18;

    return Material(
      borderRadius: text.isEmpty ? null : BorderRadiusFoundation.max,
      shape: text.isEmpty ? const CircleBorder() : null,
      clipBehavior: Clip.hardEdge,
      color: backgroundColor ?? (text.isEmpty || blurred ? Colors.white.withOpacity(0.1) : Colors.transparent),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurValue, sigmaY: blurValue),
        child: InkWell(
          onTap: loading ?? false ? null : onPressed,
          borderRadius: BorderRadiusFoundation.max,
          child: Ink(
              padding: EdgeInsets.symmetric(
                vertical: EdgeInsetsFoundation.vertical4,
                horizontal: EdgeInsetsFoundation.horizontal16,
              ),
              decoration: BoxDecoration(
                borderRadius: text.isEmpty ? null : BorderRadiusFoundation.max,
                shape: text.isEmpty ? BoxShape.circle : BoxShape.rectangle,
                //TODO explore why border is behind blur filter
                border: gradient != null
                    ? GradientBoxBorder(
                        gradient: gradient!,
                        width: 2.w,
                      )
                    : Border.all(
                        color: onPressed == null
                            ? colorScheme!.inversePrimary.withOpacity(0.5)
                            : borderColor ?? colorScheme!.inversePrimary,
                        width: 2.w,
                        strokeAlign: BorderSide.strokeAlignInside,
                      ),
                color: text.isEmpty ? Colors.white.withOpacity(0.1) : null,
              ),
              child: text.isEmpty && icon != null
                  ? ClipOval(
                      child: icon!.paddingAll(EdgeInsetsFoundation.all8),
                    )
                  : GradientableWidget(
                      active: gradient != null,
                      gradient: gradient,
                      child: AutoSizeText(
                        text,
                        style: textStyle,
                        textAlign: TextAlign.center,
                        group: group,
                        maxLines: 2,
                        wrapWords: false,
                      ))),
        ),
      ),
    ).loadingWrap(loading ?? false, color: colorScheme?.surface);
  }
}
