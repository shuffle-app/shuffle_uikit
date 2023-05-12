import 'dart:math' as math;

import 'package:flutter/material.dart';

class Animations {
  static slideAnimation(
    Animation<double> animation,
    _,
    Widget child,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        end: Offset.zero,
        begin: const Offset(0.0, 1.0),
      ).animate(animation),
      child: child,
    );
  }

  static Tween<T> createImplicitTween<T>(T val) {
    return Tween<T>(begin: val, end: val);
  }
}

class ImpScaleAnim extends StatelessWidget {
  const ImpScaleAnim({
    Key? key,
    required this.child,
    required this.scale,
  }) : super(key: key);

  final Widget child;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 600),
      scale: scale,
      curve: Curves.easeInOutBack,
      child: child,
    );
  }
}

class BackAnimStack extends StatelessWidget {
  const BackAnimStack({
    Key? key,
    required this.child,
    this.backChild,
  }) : super(key: key);

  final Widget child;
  final Widget? backChild;

  @override
  Widget build(BuildContext context) {
    final backChild = this.backChild ?? child;

    return Stack(
      children: [
        _FadeScaleAnim(child: backChild),
        _FadeScaleAnim(
          startDelay: const Duration(milliseconds: 700),
          child: backChild,
        ),
        child,
      ],
    );
  }
}

class _FadeScaleAnim extends StatefulWidget {
  const _FadeScaleAnim({
    Key? key,
    required this.child,
    this.startDelay,
  }) : super(key: key);

  final Widget child;
  final Duration? startDelay;

  @override
  State<_FadeScaleAnim> createState() => _FadeScaleAnimState();
}

class _FadeScaleAnimState extends State<_FadeScaleAnim> with SingleTickerProviderStateMixin {
  late final controller = AnimationController(duration: const Duration(milliseconds: 1600), vsync: this);
  late final curvedAnimation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

  final double multiplier = 1.7;

  late final scaleX = Tween<double>(begin: 1, end: 1 + multiplier * 0.05769).animate(curvedAnimation);
  late final scaleY = Tween<double>(begin: 1, end: 1 + multiplier * 0.21126).animate(curvedAnimation);
  late final opacity = Tween<double>(begin: 1, end: 0).animate(curvedAnimation);

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

  void listenAnim(_) {
    if (controller.isCompleted) {
      controller.repeat();
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
    return FadeTransition(
      opacity: opacity,
      child: AnimatedBuilder(
        builder: (context, child) {
          return Transform.scale(
            scaleX: scaleX.value,
            scaleY: scaleY.value,
            child: widget.child,
          );
        },
        animation: controller,
      ),
    );
  }
}

class RotatableWidget extends StatefulWidget {
  const RotatableWidget({
    Key? key,
    required this.child,
    this.startDelay,
    this.alignment = Alignment.centerLeft,
  }) : super(key: key);

  final Widget child;
  final Alignment alignment;
  final Duration? startDelay;

  @override
  State<RotatableWidget> createState() => _RotatableWidgetState();
}

class _RotatableWidgetState extends State<RotatableWidget> with SingleTickerProviderStateMixin {
  late final controller = AnimationController(
    duration: const Duration(milliseconds: 2600),
    vsync: this,
  );
  late final curvedAnimation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

  late final angle = Tween<double>(begin: 0, end: math.pi * 360 / 180).animate(curvedAnimation);

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
      Future.delayed(const Duration(seconds: 10)).then((value) => controller.repeat());
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
