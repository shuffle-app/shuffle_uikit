import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SmallGradientButton extends StatelessWidget implements ButtonFactory {
  final VoidCallback? onPressed;
  final String text;
  final bool? loading;

  const SmallGradientButton({
    super.key,
    this.onPressed,
    this.loading,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;
    TextStyle? textStyle = context.uiKitTheme?.boldTextTheme.bodyUpperCase.copyWith(color: Colors.black);

    return Material(
      borderRadius: BorderRadiusFoundation.all24,
      child: InkWell(
        borderRadius: BorderRadiusFoundation.all24,
        onTap: enabled ? onPressed : null,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadiusFoundation.all24,
            gradient: enabled ? GradientFoundation.buttonGradientLinear : null,
            color: enabled ? null : ColorsFoundation.darkNeutral300,
          ),
          child: Text(
            text.toUpperCase(),
            style: textStyle,
            textAlign: TextAlign.center,
          ).paddingSymmetric(
            horizontal: EdgeInsetsFoundation.horizontal16,
            vertical: EdgeInsetsFoundation.vertical6,
          ),
        ),
      ),
    ).loadingWrap(loading ?? false);
  }
}
