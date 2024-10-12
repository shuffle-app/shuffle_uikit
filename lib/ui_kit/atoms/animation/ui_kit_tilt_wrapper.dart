import 'package:flutter/material.dart';

/// [UiKitTiltWrapper] wraps given child in [AnimatedBuilder]
/// to animate X axis rotation
/// if [tiltNotifier] is not given it returns given child
class UiKitTiltWrapper extends StatelessWidget {
  final ValueNotifier<double>? tiltNotifier;
  final Widget child;

  const UiKitTiltWrapper({
    Key? key,
    this.tiltNotifier,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (tiltNotifier == null) {
      return child;
    }
    return AnimatedBuilder(
      animation: tiltNotifier!,
      builder: (context, child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(tiltNotifier!.value),
          child: child,
        );
      },
      child: child,
    );
  }
}
