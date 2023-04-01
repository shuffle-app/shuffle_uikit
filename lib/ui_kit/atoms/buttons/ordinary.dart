import 'package:flutter/material.dart';
import 'package:shuffle_uikit/foundation/foundation.dart';

class GeneralPurposeButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final double? height;

  const GeneralPurposeButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(
          Size.fromHeight(height ?? 48),
        ),
        backgroundColor: MaterialStateProperty.all(
          color ?? Colors.white24,
        ),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: UiKitBorderRadius.all24,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}
