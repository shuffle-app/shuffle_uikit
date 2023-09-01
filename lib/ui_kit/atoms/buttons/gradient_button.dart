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
      borderRadius: BorderRadiusFoundation.max,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        borderRadius: BorderRadiusFoundation.max,
        onTap: enabled && !(loading ?? false) ? onPressed : null,
        child: Ink(
          padding: EdgeInsets.symmetric(
            vertical: EdgeInsetsFoundation.vertical14,
            horizontal: EdgeInsetsFoundation.horizontal44,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusFoundation.max,
            gradient: enabled ? GradientFoundation.buttonGradientLinear : null,
            color: enabled ? null : ColorsFoundation.darkNeutral300,
          ),
          child: Text(
            (loading ?? false) ? '' : text.toUpperCase(),
            style: textStyle,
            textAlign: TextAlign.center,
          ).loadingWrap(loading ?? false),
        ),
      ),
    );
  }
}
