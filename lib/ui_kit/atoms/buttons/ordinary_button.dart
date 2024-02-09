import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class OrdinaryButton extends StatelessWidget implements ButtonFactory {
  final String text;
  final VoidCallback? onPressed;
  final ButtonFit? fit;
  final bool? loading;
  final Color? backgroundColor;
  final Color? textColor;

  const OrdinaryButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.loading,
    this.fit,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final enabled = onPressed != null;
    final textStyle = theme?.boldTextTheme.bodyUpperCase;
    final colorScheme = theme?.colorScheme;
    final textWidget = Text(
      (loading ?? false) ? '' : text.toUpperCase(),
      style: textStyle?.copyWith(color: enabled ? textColor ?? theme?.colorScheme.primary : ColorsFoundation.mutedText),
      textAlign: TextAlign.center,
    ).loadingWrap(loading ?? false, color: colorScheme?.surface);

    return Material(
      color: enabled ? backgroundColor ?? theme?.colorScheme.inversePrimary : ColorsFoundation.darkNeutral300,
      borderRadius: BorderRadiusFoundation.max,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: loading ?? false ? null : onPressed,
        child: Ink(
          padding: EdgeInsets.symmetric(
            vertical: EdgeInsetsFoundation.vertical16,
            horizontal: EdgeInsetsFoundation.horizontal44,
          ),
          child: fit == ButtonFit.fitWidth ? Center(child: textWidget) : textWidget,
        ),
      ),
    );
  }
}
