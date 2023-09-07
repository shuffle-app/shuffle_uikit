import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SmallOrdinaryButton extends StatelessWidget implements ButtonFactory {
  final String text;
  final VoidCallback? onPressed;
  final bool uppercase;
  final bool? loading;
  final Color? color;
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final textStyle = theme?.boldTextTheme.caption1Bold;
    final textWidget =
    group!=null ?
    AutoSizeText(
      loading ?? false
          ? ''
          : uppercase
          ? text.toUpperCase()
          : text,
      maxLines: 1,
      style: textStyle?.copyWith(color: (color ?? Colors.white) == Colors.white ? Colors.black : Colors.white),
      textAlign: TextAlign.center,
    ).loadingWrap(loading ?? false)
    :
    Text(
      loading ?? false
          ? ''
          : uppercase
              ? text.toUpperCase()
              : text,
      style: textStyle?.copyWith(color: (color ?? Colors.white) == Colors.white ? Colors.black : Colors.white),
      textAlign: TextAlign.center,
    ).loadingWrap(loading ?? false);

    return Material(
      color: Colors.white,
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadiusFoundation.max,
      child: InkWell(
        onTap: loading ?? false ? null : onPressed,
        child: Ink(
          padding: EdgeInsets.symmetric(
            horizontal: EdgeInsetsFoundation.horizontal16,
            vertical: EdgeInsetsFoundation.vertical4,
          ),
          child: fit == ButtonFit.fitWidth ? Center(child: textWidget) : textWidget,
        ),
      ),
    );
  }
}
