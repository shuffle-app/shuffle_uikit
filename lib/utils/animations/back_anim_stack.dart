import 'package:flutter/material.dart';

class BackAnimStack extends StatelessWidget {
  const BackAnimStack({
    super.key,
    required this.child,
    this.backChild,
  });

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

//ignore: prefer-single-widget-per-file
class _FadeScaleAnim extends StatefulWidget {
  const _FadeScaleAnim({
    required this.child,
    this.startDelay,
  });

  final Widget child;
  final Duration? startDelay;

  @override
  State<_FadeScaleAnim> createState() => _FadeScaleAnimState();
}

class _FadeScaleAnimState extends State<_FadeScaleAnim>
    with SingleTickerProviderStateMixin {
  late final controller = AnimationController(
      duration: const Duration(milliseconds: 1600), vsync: this);
  late final curvedAnimation =
      CurvedAnimation(parent: controller, curve: Curves.easeIn);

  final double multiplier = 1.7;

  late final scaleX = Tween<double>(begin: 1, end: 1 + multiplier * 0.05769)
      .animate(curvedAnimation);
  late final scaleY = Tween<double>(begin: 1, end: 1 + multiplier * 0.21126)
      .animate(curvedAnimation);
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

  void listenAnim(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
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
