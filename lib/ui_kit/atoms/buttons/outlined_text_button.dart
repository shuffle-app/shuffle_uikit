import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class OutlinedTextButton extends StatelessWidget implements ButtonFactory {
  final String text;
  final VoidCallback? onPressed;
  final bool? loading;
  final Color? borderColor;
  final bool isGradientEnabled;
  final Color? textColor;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;

  const OutlinedTextButton({
    super.key,
    required this.text,
    this.onPressed,
    this.loading,
    this.borderColor,
    this.textColor,
    this.isGradientEnabled = false,
    this.backgroundColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;

    final theme = context.uiKitTheme;
    final colorScheme = theme?.colorScheme;
    final textStyle = theme?.boldTextTheme.bodyUpperCase.copyWith(color: textColor);
    final textWidget = Text(
      text.toUpperCase(),
      style: textStyle,
    );

    return Material(
      clipBehavior: Clip.hardEdge,
      color: enabled ? Colors.white.withOpacity(0.01) : ColorsFoundation.darkNeutral300,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? (isGradientEnabled ? BorderRadiusFoundation.all12 : BorderRadiusFoundation.all24),
        side: !isGradientEnabled
            ? BorderSide(
                color: enabled ? borderColor ?? theme!.colorScheme.inversePrimary : theme!.colorScheme.darkNeutral500,
                width: 2.w,
              )
            : BorderSide.none,
      ),
      child: InkWell(
        onTap: enabled && !(loading ?? false) ? onPressed : null,
        borderRadius: isGradientEnabled ? BorderRadiusFoundation.all12 : BorderRadiusFoundation.all24,
        child: Ink(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: isGradientEnabled ? BorderRadiusFoundation.all12 : BorderRadiusFoundation.all24,
            border: isGradientEnabled
                ? GradientBoxBorder(
                    gradient: GradientFoundation.attentionCard,
                    width: 2.w,
                  )
                : null,
          ),
          child: loading ?? false
              ? SpacingFoundation.none
              : Center(
                  child: isGradientEnabled
                      ? GradientableWidget(
                          gradient: GradientFoundation.attentionCard,
                          child: textWidget.paddingSymmetric(
                            vertical: SpacingFoundation.verticalSpacing12,
                          ),
                        )
                      : textWidget.paddingSymmetric(
                          vertical: SpacingFoundation.verticalSpacing8,
                        ),
                ),
        ),
      ),
    ).loadingWrap(loading ?? false, color: colorScheme?.surface);
  }
}
