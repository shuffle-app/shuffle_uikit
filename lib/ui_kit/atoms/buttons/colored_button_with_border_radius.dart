import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class ColoredButtonWithBorderRadius extends StatelessWidget
    implements ButtonFactory {
  final VoidCallback? onPressed;
  final String? text;
  final bool? loading;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Color? textColor;
  final ButtonFit? fit;
  final AutoSizeGroup? autoSizeGroup;

  const ColoredButtonWithBorderRadius({
    super.key,
    this.onPressed,
    required this.text,
    this.loading,
    this.fit,
    this.autoSizeGroup,
    this.borderRadius,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;
    final colorScheme = context.uiKitTheme?.colorScheme;
    TextStyle? textStyle = context.uiKitTheme?.boldTextTheme.bodyUpperCase
        .copyWith(
            color:
                enabled ? (textColor ?? colorScheme?.surface1) : Colors.grey);
    final textWidget = (autoSizeGroup != null
            ? AutoSizeText(
                (loading ?? false) ? '' : (text ?? '').toUpperCase(),
                style: textStyle,
                textAlign: TextAlign.center,
                group: autoSizeGroup,
                maxLines: 1,
              )
            : Text(
                (loading ?? false) ? '' : (text ?? '').toUpperCase(),
                style: textStyle,
                textAlign: TextAlign.center,
              ))
        .loadingWrap(loading ?? false, color: colorScheme?.surface);

    return Material(
      borderRadius: borderRadius ?? BorderRadiusFoundation.all12,
      clipBehavior: Clip.hardEdge,
      color: Colors.transparent,
      child: InkWell(
        borderRadius: borderRadius ?? BorderRadiusFoundation.all12,
        onTap: enabled && !(loading ?? false) ? onPressed : null,
        child: Ink(
          width: fit == ButtonFit.fitWidth ? double.infinity : null,
          padding: EdgeInsets.symmetric(
            vertical: EdgeInsetsFoundation.vertical14,
            horizontal: fit == ButtonFit.hugContent
                ? EdgeInsetsFoundation.horizontal20
                : EdgeInsetsFoundation.horizontal44,
          ),
          decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadiusFoundation.all12,
            color: (enabled && backgroundColor != null)
                ? backgroundColor
                : ColorsFoundation.info,
          ),
          child: fit == ButtonFit.fitWidth
              ? Center(child: textWidget)
              : textWidget,
        ),
      ),
    );
  }
}
