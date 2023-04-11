import 'package:flutter/material.dart';
import 'package:shuffle_uikit/themes/ui_kit_theme_data.dart';

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
    return Builder(
      builder: (context) {
        final theme = Theme.of(context).extension<UiKitThemeData>();
        TextStyle? textStyle = theme?.boldTextTheme.bodyUpperCase;
        return ElevatedButton(
          style: theme?.ordinaryButtonStyle,
          onPressed: onPressed,
          child: Text(
            text.toUpperCase(),
            style: textStyle?.copyWith(color: Colors.black),
          ),
        );
      },
    );
  }
}
