import 'package:flutter/material.dart';

/// [UiKitTiltWrapper] wraps given child in [AnimatedBuilder]
/// to animate X axis rotation
/// if [tiltNotifier] is not given it returns given child
class UiKitTiltWrapper extends StatefulWidget {
  final ValueNotifier<double>? tiltNotifier;
  final Widget child;

  const UiKitTiltWrapper({super.key, this.tiltNotifier, required this.child});

  @override
  State<UiKitTiltWrapper> createState() => _UiKitTiltWrapperState();
}

class _UiKitTiltWrapperState extends State<UiKitTiltWrapper> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 250), upperBound: 2.0, lowerBound: -1);
    widget.tiltNotifier?.addListener(tiltListener);
    // _controller.addStatusListener(statusListener);
    _controller.animateTo(0.0,duration: Duration.zero);
  }

  // statusListener(AnimationStatus status) {
  //  if(status == AnimationStatus.completed) {
  //    _controller.animateTo(0.0, duration: const Duration(milliseconds: 250));
  //  }
  // }

  tiltListener() {
    debugPrint('Tilt value: ${widget.tiltNotifier!.value}');
    _controller.animateTo(widget.tiltNotifier!.value, duration: const Duration(milliseconds: 250));
  }

  @override
  void dispose() {
    widget.tiltNotifier?.removeListener(tiltListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(_controller.value),
        child: child,
      ),
      child: widget.child,
    );
  }
}
