import 'package:flutter/material.dart';
import 'package:shuffle_uikit/utils/extentions/context_theme_extension.dart';
import 'package:shuffle_uikit/utils/widgets_factory/widgets_factory.dart';

class SmallGeneralPurposeButton extends StatelessWidget implements ButtonFactory {
  final String text;
  final VoidCallback? onPressed;

  const SmallGeneralPurposeButton({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final textStyle = theme?.boldTextTheme.caption1Bold;
    return ElevatedButton(
      style: theme?.smallOrdinaryButtonStyle,
      onPressed: onPressed,
      child: Text(
        text.toUpperCase(),
        style: textStyle?.copyWith(color: Colors.black),
      ),
    );
  }
}
