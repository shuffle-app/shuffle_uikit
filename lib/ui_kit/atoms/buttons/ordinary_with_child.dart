import 'package:flutter/material.dart';
import 'package:shuffle_uikit/ui_kit_external.dart';

class GeneralPurposeButtonWithIcon extends StatelessWidget implements ButtonFactory {
  final VoidCallback? onPressed;
  final Widget icon;
  final String text;

  const GeneralPurposeButtonWithIcon({
    Key? key,
    this.onPressed,
    required this.icon,
    required this.text,
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
