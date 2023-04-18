import 'package:flutter/material.dart';
import 'package:shuffle_uikit/foundation/shuffle_ui_kit_foundation.dart';
import 'package:shuffle_uikit/utils/extentions/context_theme_extension.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final bool enabled;

  const GradientButton({
    Key? key,
    this.onPressed,
    this.enabled = true,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = context.uiKitTheme?.boldTextTheme.bodyUpperCase.copyWith(color: Colors.black);
    return Container(
      height: 48,
      padding: EdgeInsetsFoundation.all16,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusFoundation.all24,
        gradient: enabled ? GradientFoundation.buttonGradient : null,
        color: enabled ? null : ColorsFoundation.disabledColor,
      ),
      child: Text(
        text.toUpperCase(),
        style: textStyle,
      ),
    );
  }
}
