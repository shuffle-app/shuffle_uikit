import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class GeneralPurposeButtonWithIcon extends StatelessWidget implements ButtonFactory {
  final VoidCallback? onPressed;
  final Color? color;
  final double? height;
  final Widget icon;
  final String text;

  const GeneralPurposeButtonWithIcon({
    Key? key,
    this.onPressed,
    required this.icon,
    required this.text,
    this.color,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonStyle = context.uiKitTheme?.ordinaryButtonStyle;
    TextStyle? textStyle = context.uiKitTheme?.boldTextTheme.bodyUpperCase;
    return ElevatedButton(
      style: buttonStyle,
      onPressed: onPressed ?? () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
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
