import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SmallButtonWithTextAndIcon extends StatelessWidget implements ButtonFactory {
  final String text;
  final Widget icon;
  final VoidCallback? onPressed;
  final bool uppercase;
  final bool? loading;
  final Color? color;
  final Color? backgroundColor;
  final ButtonFit? fit;
  final AutoSizeGroup? group;

  const SmallButtonWithTextAndIcon({
    Key? key,
    required this.text,
    required this.icon,
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
    final textStyle = theme?.boldTextTheme.caption1UpperCaseMedium;
    final textWidget = group != null
        ? AutoSizeText(
            loading ?? false
                ? ''
                : uppercase
                    ? text.toUpperCase()
                    : text,
            maxLines: 1,
            style: textStyle?.copyWith(color: (color ?? Colors.white) == Colors.white ? Colors.black : Colors.white),
            textAlign: TextAlign.center,
          )
        : Text(
            loading ?? false
                ? ''
                : uppercase
                    ? text.toUpperCase()
                    : text,
            style: textStyle?.copyWith(color: (color ?? Colors.white) == Colors.white ? Colors.black : Colors.white),
            textAlign: TextAlign.center,
          );

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
          child: Row(
            mainAxisSize: fit == ButtonFit.fitWidth ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: fit == ButtonFit.fitWidth ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: [
              textWidget,
              SpacingFoundation.horizontalSpace4,
              icon,
            ],
          ).loadingWrap(loading ?? false),
        ),
      ),
    );
  }
}
