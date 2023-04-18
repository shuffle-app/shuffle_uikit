import 'package:flutter/material.dart';
import 'package:shuffle_uikit/utils/extentions/context_theme_extension.dart';

class GeneralPurposeButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double? height;

  const GeneralPurposeButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    TextStyle? textStyle = theme?.boldTextTheme.bodyUpperCase;
    return ElevatedButton(
      style: theme?.ordinaryButtonStyle,
      onPressed: onPressed,
      child: Text(
        text.toUpperCase(),
        style: textStyle?.copyWith(color: Colors.black),
      ),
    );
  }
}
