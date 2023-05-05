import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class OrdinaryTextButton extends StatelessWidget implements ButtonFactory {
  final String text;
  final VoidCallback? onPressed;

  const OrdinaryTextButton({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = context.uiKitTheme?.textButtonStyle;
    return TextButton(
      style: style,
      onPressed: onPressed,
      child: Text(text.toUpperCase()),
    );
  }
}
