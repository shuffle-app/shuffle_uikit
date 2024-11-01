import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class AnimatedPullToShowHint extends StatefulWidget {
  const AnimatedPullToShowHint({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedPullToShowHint> createState() => _AnimatedPullToShowHintState();
}

class _AnimatedPullToShowHintState extends State<AnimatedPullToShowHint> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
      value: 0,
    )..addListener(_animationListener);
    _controller.forward();
  }

  void _animationListener() {
    if (_controller.status == AnimationStatus.completed) {
      _controller.reverse();
    } else if (_controller.status == AnimationStatus.dismissed) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_animationListener);
    _controller.dispose();
    super.dispose();
  }

  Size get ballSize => Size(0.15625.sw, 0.15625.sw);

  @override
  Widget build(BuildContext context) {
    return UiKitCardWrapper(
      borderRadius: BorderRadiusFoundation.max,
      gradient: GradientFoundation.defaultLinearGradient,
      height: ballSize.height,
      width: ballSize.width,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, (ballSize.height / 12) * sin(1 - _controller.value)),
            child: child,
          );
        },
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ImageWidget(
            height: ballSize.height / 2,
            width: ballSize.width * 0.75,
            iconData: ShuffleUiKitIcons.chevrondown,
            fit: BoxFit.cover,
            color: Colors.white.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}

enum AnimatedPullToShowState { showFirstHint, showSecondHint, showLastPhase }

class UiKitAnimatedPullToShowDelegate extends SliverPersistentHeaderDelegate {
  final List<Widget> children;
  final String noChildrenText;
  final double topPadding;
  final ValueNotifier<double> lastPhaseScaleNotifier;
  final bool showHints;

  UiKitAnimatedPullToShowDelegate({
    required this.topPadding,
    required this.children,
    required this.lastPhaseScaleNotifier,
    this.noChildrenText = '',
    this.showHints = true,
  });

  @override
  double get maxExtent => 0.175.sw + (SpacingFoundation.verticalSpacing16 * 2) + topPadding;

  @override
  double get minExtent => maxExtent * 0.325;

  @override
  bool shouldRebuild(UiKitAnimatedPullToShowDelegate oldDelegate) {
    return false;
  }

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final colorScheme = context.uiKitTheme?.colorScheme;
    final shrinkToMaxExtentRatio = shrinkOffset / maxExtent;

    return Column(
      children: [
        AnimatedBuilder(
            animation: lastPhaseScaleNotifier,
            builder: (context, child) {
              final scale = lastPhaseScaleNotifier.value;
              if (lastPhaseScaleNotifier.value == 0) return topPadding.heightBox;
              return Transform.scale(
                scale: scale,
                child: SizedBox(
                  height: (topPadding * scale),
                  width: 1.sw,
                  child: child,
                ),
              );
            },
            child: Center(
              child: GradientableWidget(
                gradient: GradientFoundation.badgeIcon,
                child: ImageWidget(
                  svgAsset: GraphicsFoundation.instance.svg.filmstrip,
                  color: Colors.white,
                  width: 0.1.sw,
                  height: 0.1.sw,
                  fit: BoxFit.cover,
                ),
              ),
            )),
        UiKitCardWrapper(
          borderRadius: BorderRadiusFoundation.zero,
          height: max(0, maxExtent - topPadding - shrinkOffset),
          width: 1.sw,
          color: colorScheme?.surface2,
          child: Stack(
            children: [
              if (showHints)
                AnimatedPositioned(
                  left: (1.sw / 2) - (0.15625.sw / 2),
                  top: shrinkToMaxExtentRatio < 0.05 ? (-0.15625.sw * 0.6) : -0.15625.sw,
                  duration: const Duration(milliseconds: 250),
                  child: const AnimatedPullToShowHint(),
                ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 250),
                bottom: shrinkToMaxExtentRatio < 0.25 ? 0 : SpacingFoundation.verticalSpacing2,
                left: shrinkToMaxExtentRatio < 0.25 ? null : (1.sw / 2) - (0.15625.sw / 2),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: shrinkToMaxExtentRatio < 0.25
                      ? SizedBox(
                          height: 0.15.sw + (SpacingFoundation.verticalSpacing16 * 2),
                          width: 1.sw,
                          child: ListView.separated(
                            clipBehavior: Clip.none,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            padding: EdgeInsets.all(EdgeInsetsFoundation.all16),
                            itemBuilder: (context, index) => children.elementAt(index),
                            separatorBuilder: (context, index) => SpacingFoundation.horizontalSpace16,
                            itemCount: children.length,
                          ),
                        )
                      : showHints
                          ? const AnimatedPullToShowHint()
                          : null,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
