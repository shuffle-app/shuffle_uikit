import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class GradientButton extends StatelessWidget implements ButtonFactory {
  final VoidCallback? onPressed;
  final String text;
  final bool? loading;
  final ButtonFit? fit;

  const GradientButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.loading,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;
    final colorScheme = context.uiKitTheme?.colorScheme;
    TextStyle? textStyle = context.uiKitTheme?.boldTextTheme.bodyUpperCase.copyWith(color: enabled ? Colors.black : Colors.grey);
    final textWidget = Text(
      (loading ?? false) ? '' : text.toUpperCase(),
      style: textStyle,
      textAlign: TextAlign.center,
    ).loadingWrap(loading ?? false, color: colorScheme?.inverseSurface);

    return Material(
      borderRadius: kIsWeb ? BorderRadiusFoundation.all10 : BorderRadiusFoundation.max,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        borderRadius: kIsWeb ? BorderRadiusFoundation.all10 : BorderRadiusFoundation.max,
        onTap: enabled && !(loading ?? false) ? onPressed : null,
        child: Ink(
          width: fit == ButtonFit.fitWidth ? double.infinity : null,
          padding: EdgeInsets.symmetric(
            vertical: EdgeInsetsFoundation.vertical14,
            horizontal: fit == ButtonFit.hugContent ? EdgeInsetsFoundation.horizontal20 : EdgeInsetsFoundation.horizontal44,
          ),
          decoration: BoxDecoration(
            borderRadius: kIsWeb ? BorderRadiusFoundation.all10 : BorderRadiusFoundation.max,
            gradient: enabled ? GradientFoundation.buttonGradientLinear : null,
            color: enabled ? null : ColorsFoundation.darkNeutral300,
          ),
          child: fit == ButtonFit.fitWidth ? Center(child: textWidget) : textWidget,
        ),
      ),
    );
  }
}
