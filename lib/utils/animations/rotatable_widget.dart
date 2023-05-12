import 'package:flutter/material.dart';
import 'dart:math' as math;

class RotatableWidget extends StatefulWidget {
  const RotatableWidget({
    Key? key,
    required this.child,
    this.startDelay,
    this.startAngle = 0,
    this.endAngle = math.pi * 360 / 180,
    this.applyReverseOnEnd = false,
    this.alignment = Alignment.centerLeft,
  }) : super(key: key);

  final Widget child;
  final Alignment alignment;
  final Duration? startDelay;
  final double startAngle;
  final double endAngle;
  final bool applyReverseOnEnd;

  @override
  State<RotatableWidget> createState() => _RotatableWidgetState();
}

class _RotatableWidgetState extends State<RotatableWidget>
    with SingleTickerProviderStateMixin {
  late final controller = AnimationController(
    duration: const Duration(milliseconds: 1600),
    vsync: this,
  );
  late final curvedAnimation =
      CurvedAnimation(parent: controller, curve: Curves.easeIn);

  late final angle =
      Tween<double>(begin: widget.startAngle, end: widget.endAngle)
          .animate(curvedAnimation);

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
    if (status == AnimationStatus.completed) {
      controller.reverse();
    } else if (status == AnimationStatus.dismissed) {
      Future.delayed(const Duration(seconds: 10))
          .then((value) => controller.forward());
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
          child: widget.child,
        );
      },
      animation: controller,
    );
  }
}
