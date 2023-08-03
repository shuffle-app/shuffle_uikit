import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class OrdinaryButton extends StatelessWidget implements ButtonFactory {
  final String text;
  final VoidCallback? onPressed;
  final ButtonFit? fit;
  final bool? loading;

  const OrdinaryButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.loading,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final textStyle = theme?.boldTextTheme.bodyUpperCase;
    final textWidget = Text(
      text.toUpperCase(),
      style: textStyle?.copyWith(color: Colors.black),
    );

    return ElevatedButton(
      style: theme?.ordinaryButtonStyle,
      onPressed: onPressed,
      child: fit == ButtonFit.fitWidth ? Center(child: textWidget) : textWidget,
    ).loadingWrap(loading ?? false);
  }
}
