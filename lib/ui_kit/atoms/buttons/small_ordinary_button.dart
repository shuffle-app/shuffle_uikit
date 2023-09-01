import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SmallOrdinaryButton extends StatelessWidget implements ButtonFactory {
  final String text;
  final VoidCallback? onPressed;
  final bool uppercase;
  final bool? loading;
  final Color? color;
  final ButtonFit? fit;

  const SmallOrdinaryButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.loading,
    this.fit,
    this.uppercase = true,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final textStyle = theme?.boldTextTheme.caption1Bold;
    final textWidget = Text(
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
            vertical: EdgeInsetsFoundation.vertical6,
          ),
          child: fit == ButtonFit.fitWidth ? Center(child: textWidget) : textWidget,
        ),
      ),
    );
  }
}
