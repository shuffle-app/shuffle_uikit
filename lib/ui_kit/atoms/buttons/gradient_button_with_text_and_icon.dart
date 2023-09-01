import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class GradientButtonWithTextAndIcon extends StatelessWidget implements ButtonFactory {
  final VoidCallback? onPressed;
  final String text;
  final Widget icon;
  final bool? loading;

  const GradientButtonWithTextAndIcon({
    Key? key,
    this.onPressed,
    this.loading,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;

    return Material(
      borderRadius: BorderRadiusFoundation.all24,
      child: InkWell(
        borderRadius: BorderRadiusFoundation.all24,
        onTap: enabled && !(loading ?? false) ? onPressed : null,
        child: Ink(
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusFoundation.all24,
            gradient: enabled ? GradientFoundation.buttonGradient : null,
            color: enabled ? null : ColorsFoundation.darkNeutral300,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (!(loading ?? false)) ...[
                Text(
                  text,
                  style: context.uiKitTheme?.boldTextTheme.bodyUpperCase.copyWith(color: Colors.black),
                ),
                SpacingFoundation.horizontalSpace8,
                icon,
              ],
            ],
          ),
        ),
      ),
    ).loadingWrap(loading ?? false);
  }
}
