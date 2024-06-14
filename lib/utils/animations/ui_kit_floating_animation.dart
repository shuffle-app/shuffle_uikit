import 'dart:math';

import 'package:flutter/material.dart';

class UiKitFloatingAnimation extends StatefulWidget {
  final Widget child;
  final bool applyY;
  final bool applyX;

  const UiKitFloatingAnimation({super.key, required this.child, this.applyX = true, this.applyY = true});

  @override
  State<UiKitFloatingAnimation> createState() => _UiKitFloatingAnimationState();
}

const _kMaxOffset = 18;

class _UiKitFloatingAnimationState extends State<UiKitFloatingAnimation>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late final AnimationController _controller;

  late final double coefficientX;
  late final double coefficientY;

  late final Duration duration;

  @override
  void initState() {
    super.initState();
    final rand = Random();
    duration = Duration(milliseconds: rand.nextInt(500) + 600);
    _controller = AnimationController(
      vsync: this,
      duration: duration,
    );
    WidgetsBinding.instance.addObserver(this);
    coefficientX = rand.nextInt(_kMaxOffset) * (rand.nextBool() ? -1 : 1) / 5;
    coefficientY = rand.nextInt(_kMaxOffset) * (rand.nextBool() ? -1 : 1) / 5;
    _controller.repeat(reverse: true, period: duration);
  }

  @override
  Future<bool> didPopRoute() {
    if (mounted) {
      _controller.resync(this);
      _controller.repeat(reverse: true, period: duration);
    }
    return super.didPopRoute();
  }

  @override
  Future<bool> didPushRouteInformation(RouteInformation routeInformation) {
    _controller.stop();
    return super.didPushRouteInformation(routeInformation);
  }

  @override
  void dispose() {
    _controller.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Transform.translate(
        offset: Offset(
            widget.applyX ? coefficientX * _controller.value : 0, widget.applyY ? coefficientY * _controller.value : 0),
        filterQuality: FilterQuality.low,
        child: child,
      ),
      child: widget.child,
    );
  }
}
