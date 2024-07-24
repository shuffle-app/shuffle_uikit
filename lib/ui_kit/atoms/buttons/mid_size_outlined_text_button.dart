import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class MidSizeOutlinedTextButton extends StatelessWidget implements ButtonFactory {
  final String text;
  final VoidCallback? onPressed;
  final bool? loading;
  final Color? borderColor;
  final bool isGradientEnabled;

  const MidSizeOutlinedTextButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.loading,
    this.borderColor,
    required this.isGradientEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;

    final theme = context.uiKitTheme;
    final colorScheme = theme?.colorScheme;
    final textStyle = theme?.boldTextTheme.body;
    final textWidget = Text(
      text.toUpperCase(),
      style: textStyle?.copyWith(
          color: enabled ? borderColor ?? theme!.colorScheme.inversePrimary : theme!.colorScheme.darkNeutral500),
    );

    return Material(
      clipBehavior: Clip.hardEdge,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: isGradientEnabled ? BorderRadiusFoundation.all12 : BorderRadiusFoundation.all24,
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
                            vertical: 10,
                            horizontal: SpacingFoundation.horizontalSpacing24,
                          ),
                        )
                      : textWidget.paddingSymmetric(vertical: 10),
                ),
        ),
      ),
    ).loadingWrap(loading ?? false, color: colorScheme?.surface);
  }
}
