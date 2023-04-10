import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class OrdinaryButtonWithChild extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? color;
  final double? height;
  final Widget child;

  const OrdinaryButtonWithChild({
    Key? key,
    required this.onPressed,
    required this.child,
    this.color,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final buttonStyle = Theme.of(context).extension<UiKitThemeData>()?.ordinaryButtonStyle;
        return ElevatedButton(
          style: buttonStyle,
          onPressed: onPressed,
          child: child,
        );
      },
    );
  }
}
