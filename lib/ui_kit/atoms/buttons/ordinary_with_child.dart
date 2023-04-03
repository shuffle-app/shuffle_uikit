import 'package:flutter/material.dart';
import 'package:shuffle_uikit/foundation/ui_kit_border_radius.dart';

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
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(
          Size.fromHeight(height ?? 48),
        ),
        backgroundColor: MaterialStateProperty.all(
          color ?? Colors.white24,
        ),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadiusFoundation.all24,
          ),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
