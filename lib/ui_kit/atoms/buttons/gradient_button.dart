import 'package:flutter/material.dart';
import 'package:shuffle_uikit/ui_kit_external.dart';

class GradientButton extends StatelessWidget implements ButtonFactory {
  final VoidCallback? onPressed;
  final String text;

  const GradientButton({
    Key? key,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;
    TextStyle? textStyle = context.uiKitTheme?.boldTextTheme.bodyUpperCase.copyWith(color: Colors.black);
    return GestureDetector(
      onTap: enabled ? onPressed : null,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusFoundation.all24,
          gradient: enabled ? GradientFoundation.buttonGradient : null,
          color: enabled ? null : ColorsFoundation.darkNeutral300,
        ),
        child: Center(
          child: Text(
            text.toUpperCase(),
            style: textStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
