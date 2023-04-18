import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/utils/extentions/context_theme_extension.dart';

/// [GeneralPurposeButtonWithIcon] is a button that accepts a child widget.
/// when [onPressed] is not passed, it will be disabled and [overlayColor] will be used as a background color.
/// pass own [overlayColor] to override default color in case if you don't need [onPressed]
/// but still want some other color while [onPressed] is not passed.

class GeneralPurposeButtonWithIcon extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? color;
  final double? height;
  final Widget icon;
  final String text;
  final Color? overlayColor;

  const GeneralPurposeButtonWithIcon({
    Key? key,
    this.onPressed,
    required this.icon,
    required this.text,
    this.color,
    this.height,
    this.overlayColor,
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
