import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class GradientButton extends StatelessWidget implements ButtonFactory {
  final VoidCallback? onPressed;
  final String text;
  final bool? loading;

  const GradientButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.loading,
  }) : super(key: key);

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
          height: 48.sp,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusFoundation.all24,
            gradient: enabled ? GradientFoundation.buttonGradientLinear : null,
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
      ),
    ).loadingWrap(loading ?? false);
  }
}
