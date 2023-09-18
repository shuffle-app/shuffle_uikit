import 'dart:math' as math;

import 'package:flutter/material.dart';

class RotatableWidget extends StatefulWidget {
  const RotatableWidget({
    Key? key,
    required this.child,
    this.startDelay,
    this.animDuration = const Duration(milliseconds: 1600),
    this.startAngle = 0,
    this.endAngle = math.pi * 360 / 180,
    this.applyReverseOnEnd = true,
    this.alignment = Alignment.centerLeft,
  }) : super(key: key);

  final Widget child;
  final Alignment alignment;
  final Duration? startDelay;
  final Duration animDuration;
  final double startAngle;
  final double endAngle;
  final bool applyReverseOnEnd;

  @override
  State<RotatableWidget> createState() => _RotatableWidgetState();
}

class _RotatableWidgetState extends State<RotatableWidget> with SingleTickerProviderStateMixin {
  late final controller = AnimationController(
    duration: widget.animDuration,
    vsync: this,
  );
  late final curvedAnimation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

  late final angle = Tween<double>(begin: widget.startAngle, end: widget.endAngle).animate(curvedAnimation);

  @override
  void initState() {
    super.initState();
    () async {
      await Future.delayed(widget.startDelay ?? Duration.zero);
      controller
        ..forward()
        ..addStatusListener(listenAnim);
    }();
  }

  //ignore: unused parameter
  void listenAnim(AnimationStatus status) {
    if (status == AnimationStatus.completed && widget.applyReverseOnEnd) {
      controller.reverse();
    } else if (status == AnimationStatus.dismissed) {
      Future.delayed(const Duration(seconds: 10)).then((value) => controller.forward());
    }
  }

  @override
  void dispose() {
    controller.removeStatusListener(listenAnim);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) {
        return Transform.rotate(
          angle: angle.value,
          alignment: widget.alignment,
          child: child,
        );
      },
      animation: controller,
      child: widget.child,
    );
  }
}
