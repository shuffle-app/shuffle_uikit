import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class OrdinaryTextButton extends StatelessWidget implements ButtonFactory {
  final String text;
  final VoidCallback? onPressed;
  final Widget? icon;

  const OrdinaryTextButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final style = context.uiKitTheme?.textButtonStyle;

    return TextButton(
      // style: style,
      onPressed: onPressed,
      child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [if (icon != null) ...[icon!,SpacingFoundation.horizontalSpace8], Text(text.toUpperCase())]),
    );
  }
}
