import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class ArrowsAnimation extends StatefulWidget {
  final int itemCount;
  final Duration duration;

  const ArrowsAnimation({super.key, this.itemCount = 3, this.duration = const Duration(seconds: 2)});

  @override
  State<ArrowsAnimation> createState() => _ArrowsAnimationState();
}

class _ArrowsAnimationState extends State<ArrowsAnimation> with SingleTickerProviderStateMixin {
  late final controller = AnimationController.unbounded(
    duration: widget.duration,
    vsync: this,
  );

  @override
  void initState() {
    controller.repeat(min: -2.5, max: 2, period: const Duration(seconds: 1));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShimmerArrows(
      controller: controller,
      children: List.generate(
        widget.itemCount,
        (index) => GradientableWidget(
          gradient: GradientFoundation.badgeIcon,
          child: ImageWidget(
            svgAsset: GraphicsFoundation.instance.svg.chevronNoPadding,
            color: Colors.white,
            fit: BoxFit.fitWidth,
            width: 10.w,
          ),
        ),
      ),
    );
  }
}

class ShimmerArrows extends StatelessWidget {
  final AnimationController controller;
  final List<Widget> children;

  const ShimmerArrows({
    super.key,
    required this.controller,
    this.children = const [],
  });

  Gradient get gradient => LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: const [Colors.white10, Colors.white, Colors.white10],
        stops: const [0.0, 0.3, 1],
        transform: _SlideGradientTransform(controller.value),
      );

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return gradient.createShader(bounds);
          },
          child: child,
        );
      },
      child: Row(children: children),
    );
  }
}

class _SlideGradientTransform extends GradientTransform {
  const _SlideGradientTransform(this.percent);

  final double percent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) => Matrix4.translationValues(
        (bounds.height * percent),
        0,
        0,
      );
}
