import 'package:flutter/material.dart';
import 'package:shuffle_uikit/themes/ui_kit_theme_data.dart';

class GeneralPurposeButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? height;

  const GeneralPurposeButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final uiKitStyle = Theme.of(context).extension<UiKitThemeData>();
        return ElevatedButton(
          style: uiKitStyle?.ordinaryButtonStyle,
          onPressed: onPressed,
          child: Text(
            text,
            style: uiKitStyle?.boldTextTheme.bodyUpperCase.copyWith(color: Colors.black),
          ),
        );
      },
    );
  }
}
