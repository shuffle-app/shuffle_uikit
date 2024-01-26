import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitLongTapHintAnimation extends StatefulWidget {
  final Duration? duration;

  const UiKitLongTapHintAnimation({super.key, this.duration});

  @override
  State<UiKitLongTapHintAnimation> createState() => _UiKitLongTapHintAnimationState();
}

class _UiKitLongTapHintAnimationState extends State<UiKitLongTapHintAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  static const animDur = Duration(milliseconds: 1700);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      upperBound: 5,
      duration: widget.duration ?? animDur,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final theme = context.uiKitTheme;

    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final backCircleSize = _controller.value <= 2.5 ? _controller.value / 4 : _controller.value / 2.7;
          final backCircleOpacity = 5 - _controller.value;
          final frontCircleSize = _controller.value <= 2.5 ? _controller.value : 5 - _controller.value;

          return Stack(alignment: Alignment.center, children: <Widget>[
            DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(backCircleOpacity / 5),
              ),
              child: ClipOval(
                child: BackdropFilter(
                    filter:
                        ImageFilter.blur(sigmaX: 10 - _controller.value * 1.5, sigmaY: 10 - _controller.value * 1.5),
                    child: SizedBox(
                      height: 30.w * backCircleSize.w,
                      width: 30.w * backCircleSize.w,
                    )),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.3),
              ),
              child: ClipOval(
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: SizedBox(
                      height: 30.w + frontCircleSize.w * 2.2,
                      width: 30.w + frontCircleSize.w * 2.2,
                    )),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.7),
              ),
              child: ClipOval(
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: SizedBox(
                      height: 20.w + frontCircleSize.w * 0.8,
                      width: 20.w + frontCircleSize.w * 0.8,
                    )),
              ),
            ),
            Transform.scale(
                scale: _controller.value <= 1
                    ? 1 - _controller.value / 5
                    : _controller.value >= 4
                        ? _controller.value / 5
                        : 0.8,
                alignment: Alignment.topCenter,
                child: ImageWidget(
                  svgAsset: GraphicsFoundation.instance.svg.clockCursor,
                  color: Colors.white,
                  width: 30.w,
                  height: 30.w,
                  fit: BoxFit.contain,
                )).paddingOnly(left: 10.w, top: 30.w)
          ]);
        });
  }
}
