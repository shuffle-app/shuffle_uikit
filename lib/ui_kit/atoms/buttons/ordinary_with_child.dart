import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

/// [GeneralPurposeButtonWithChild] is a button that accepts a child widget.
/// when [onPressed] is not passed, it will be disabled and [overlayColor] will be used as a background color.
/// pass own [overlayColor] to override default color in case if you don't need [onPressed]
/// but still want some other color while [onPressed] is not passed.

class GeneralPurposeButtonWithChild extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? color;
  final double? height;
  final Widget child;
  final Color? overlayColor;

  const GeneralPurposeButtonWithChild({
    Key? key,
    this.onPressed,
    required this.child,
    this.color,
    this.height,
    this.overlayColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final buttonStyle = Theme.of(context).extension<UiKitThemeData>()?.ordinaryButtonStyle;
        return ElevatedButton(
          style: buttonStyle,
          onPressed: onPressed ?? () {},
          child: child,
        );
      },
    );
  }
}
