import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class OrdinaryButtonWithIcon extends StatelessWidget implements ButtonFactory {
  final VoidCallback? onPressed;
  final Widget icon;
  final String text;
  final bool? loading;

  const OrdinaryButtonWithIcon({
    Key? key,
    this.onPressed,
    this.loading,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonStyle = context.uiKitTheme?.ordinaryButtonStyle;
    TextStyle? textStyle = context.uiKitTheme?.boldTextTheme.bodyUpperCase;
    final inLoading = loading ?? false;

    return ElevatedButton(
      style: buttonStyle,
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: inLoading
            ? [const AdaptiveLoader()]
            : [
                Text(
                  text.toUpperCase(),
                  style: textStyle?.copyWith(color: Colors.black),
                ),
                SpacingFoundation.horizontalSpace8,
                icon,
              ],
      ),
    );
  }
}
