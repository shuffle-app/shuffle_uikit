import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SmallOrdinaryButton extends StatelessWidget implements ButtonFactory {
  final String text;
  final VoidCallback? onPressed;
  final bool uppercase;
  final bool? loading;
  final Color? color;
  final Color? backgroundColor;
  final ButtonFit? fit;
  final AutoSizeGroup? group;

  const SmallOrdinaryButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.loading,
    this.fit,
    this.group,
    this.uppercase = true,
    this.color,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final enabled = onPressed != null;
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
            style: textStyle?.copyWith(
                color: (color ?? Colors.white) == Colors.white ? (enabled ? Colors.black : Colors.grey) : Colors.white),
            textAlign: TextAlign.center,
          ).loadingWrap(loading ?? false)
        : Text(
            loading ?? false
                ? ''
                : uppercase
                    ? text.toUpperCase()
                    : text,
            style: textStyle?.copyWith(
                color: (color ?? Colors.white) == Colors.white ? (enabled ? Colors.black : Colors.grey) : Colors.white),
            textAlign: TextAlign.center,
          ).loadingWrap(loading ?? false);

    return Material(
      color: backgroundColor ?? Colors.white,
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
