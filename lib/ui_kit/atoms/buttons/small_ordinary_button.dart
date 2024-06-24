import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SmallOrdinaryButton extends StatelessWidget implements ButtonFactory {
  final String text;
  final VoidCallback? onPressed;
  final bool uppercase;
  final bool? loading;
  final ButtonFit? fit;
  final AutoSizeGroup? group;
  final Color? backgroundColor;
  final Color? textColor;

  const SmallOrdinaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.loading,
    this.fit,
    this.group,
    this.uppercase = true,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final enabled = onPressed != null;
    final colorScheme = theme?.colorScheme;
    final textStyle = theme?.boldTextTheme.caption1UpperCaseMedium;
    final textWidget = group != null
        ? AutoSizeText(
            loading ?? false
                ? ''
                : uppercase
                    ? text.toUpperCase()
                    : text,
            maxLines: 1,
            group: group,
            style: textStyle?.copyWith(color: enabled ? textColor ?? theme?.colorScheme.surface : Colors.grey),
            textAlign: TextAlign.center,
          ).loadingWrap(loading ?? false, color: colorScheme?.surface)
        : Text(
            loading ?? false
                ? ''
                : uppercase
                    ? text.toUpperCase()
                    : text,
            style: textStyle?.copyWith(color: enabled ? textColor ?? theme?.colorScheme.surface : Colors.grey),
            textAlign: TextAlign.center,
          ).loadingWrap(loading ?? false, color: colorScheme?.surface);

    return Material(
      color: enabled ? backgroundColor ?? theme?.colorScheme.inverseSurface : ColorsFoundation.darkNeutral300,
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadiusFoundation.max,
      child: InkWell(
        onTap: loading ?? false ? null : onPressed,
        child: Ink(
          padding: EdgeInsets.symmetric(
            horizontal: EdgeInsetsFoundation.horizontal16,
            vertical: EdgeInsetsFoundation.vertical6,
          ),
          child: fit == ButtonFit.fitWidth ? Center(child: textWidget) : textWidget,
        ),
      ),
    );
  }
}
