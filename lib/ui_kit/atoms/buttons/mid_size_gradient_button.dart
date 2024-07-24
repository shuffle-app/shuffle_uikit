import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class MidSizeGradientButton extends StatelessWidget implements ButtonFactory {
  final VoidCallback? onPressed;
  final String text;
  final bool? loading;

  const MidSizeGradientButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;
    TextStyle? textStyle =
        context.uiKitTheme?.boldTextTheme.caption1UpperCase.copyWith(color: enabled ? Colors.black : Colors.grey);
    final colorScheme = context.uiKitTheme?.colorScheme;

    return Material(
      borderRadius: BorderRadiusFoundation.max,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        borderRadius: BorderRadiusFoundation.max,
        onTap: enabled && !(loading ?? false) ? onPressed : null,
        child: Ink(
          padding: EdgeInsets.symmetric(
            vertical: EdgeInsetsFoundation.vertical12,
            horizontal: EdgeInsetsFoundation.horizontal32,
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
          ).loadingWrap(loading ?? false, color: colorScheme?.surface),
        ),
      ),
    );
  }
}
