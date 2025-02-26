import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SmallGradientButton extends StatelessWidget implements ButtonFactory {
  final VoidCallback? onPressed;
  final String text;
  final bool? loading;
  final AutoSizeGroup? group;
  final ButtonFit? fit;

  const SmallGradientButton({
    super.key,
    this.onPressed,
    this.loading,
    required this.text,
    this.group,
    this.fit
  });

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
          width: fit == ButtonFit.fitWidth ? double.infinity : null,
          padding: EdgeInsets.symmetric(
            vertical: EdgeInsetsFoundation.vertical6,
            horizontal: EdgeInsetsFoundation.horizontal16,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusFoundation.max,
            gradient: enabled ? GradientFoundation.buttonGradientLinear : null,
            color: enabled ? null : ColorsFoundation.darkNeutral300,
          ),
          child: AutoSizeText(
            group: group,
            text.toUpperCase(),
            style: textStyle,
            textAlign: TextAlign.center,
            maxLines: 1,
          ).loadingWrap(loading ?? false, color: colorScheme?.surface),
        ),
      ),
    );
  }
}
