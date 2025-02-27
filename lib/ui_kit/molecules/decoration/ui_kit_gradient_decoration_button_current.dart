import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitGradientedDecoratedButtonCurrent extends StatelessWidget {
  final String? iconPath;
  final IconData? iconData;
  final double audioLevel;
  final VoidCallback? onPressed;

  const UiKitGradientedDecoratedButtonCurrent({
    super.key,
    this.iconPath,
    this.iconData,
    this.audioLevel = 0.0,
    this.onPressed,
  }) : assert(iconPath == null || iconData == null, 'Only one of iconPath or iconData must be provided');

  @override
  Widget build(BuildContext context) {
    final scaleFactor = (audioLevel < 0 ? 0 : audioLevel) * 0.1;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 0.7.sw,
        height: 0.7.sw,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Stack(
          children: [
            if (scaleFactor != 0 && scaleFactor != 4) ...[
              _AnimatedCircleLayer(
                scale: scaleFactor * 0.4,
                color: ColorsFoundation.orange.withValues(alpha: 0.15),
                padding: EdgeInsetsFoundation.all32,
              ),
              _AnimatedCircleLayer(
                scale: scaleFactor * 0.3,
                color: ColorsFoundation.yellow.withValues(alpha: 0.1),
                padding: EdgeInsetsFoundation.all32,
              ),
              _AnimatedCircleLayer(
                scale: scaleFactor * 0.2,
                color: ColorsFoundation.pink.withValues(alpha: 0.05),
                padding: EdgeInsetsFoundation.all32 * 2,
              ),
            ],
            Center(
              child: Container(
                  decoration: const BoxDecoration(
                    border: GradientFoundation.gradientBorder,
                    shape: BoxShape.circle,
                    color: ColorsFoundation.surface5,
                  ),
                  child: Opacity(
                    opacity: 0.25,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: GradientFoundation.defaultRadialGradient,
                        shape: BoxShape.circle,
                      ),
                      child: SizedBox(width: 40.w, height: 40.w).paddingAll(EdgeInsetsFoundation.all4),
                    ).paddingAll(EdgeInsetsFoundation.all8),
                  )),
            ),
            Center(
              child: GradientableWidget(
                gradient: GradientFoundation.defaultRadialGradient,
                child: ImageWidget(
                  link: iconPath,
                  iconData: iconData,
                  fit: BoxFit.cover,
                  color: Colors.white,
                  width: 40.w,
                  height: 40.w,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AnimatedCircleLayer extends StatelessWidget {
  final double scale;
  final Color color;
  final double padding;

  const _AnimatedCircleLayer({
    required this.scale,
    required this.color,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0.0, end: scale),
        duration: const Duration(milliseconds: 100),
        builder: (context, value, child) {
          return Transform.scale(
            scale: value,
            child: Container(decoration: BoxDecoration(color: color, shape: BoxShape.circle)).paddingAll(padding),
          );
        },
      ),
    );
  }
}
