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
    TextStyle? textStyle = context.uiKitTheme?.boldTextTheme.caption1UpperCase.copyWith(color: Colors.black);

    return Material(
      borderRadius: BorderRadiusFoundation.max,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        borderRadius: BorderRadiusFoundation.max,
        onTap: enabled && !(loading ?? false) ? onPressed : null,
        child: Ink(
          padding: EdgeInsets.symmetric(
            vertical: EdgeInsetsFoundation.vertical6,
            horizontal: EdgeInsetsFoundation.horizontal16,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusFoundation.max,
            gradient: enabled ? GradientFoundation.buttonGradientLinear : null,
            color: enabled ? null : ColorsFoundation.darkNeutral300,
          ),
          child: Text(
            text.toUpperCase(),
            style: textStyle,
            textAlign: TextAlign.center,
          ).loadingWrap(loading ?? false),
        ),
      ),
    );
  }
}
