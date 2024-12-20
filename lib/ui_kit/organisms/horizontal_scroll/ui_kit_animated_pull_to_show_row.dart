import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

import '../../content_wrappers/ui_kit_border_wrapper.dart';

class AnimatedPullToShowHint extends StatefulWidget {
  final bool showGradient;

  const AnimatedPullToShowHint({
    super.key,
    this.showGradient = true,
  });

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
    )
      ..addListener(_animationListener);
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
      gradient: widget.showGradient ? GradientFoundation.defaultLinearGradient : null,
      color: widget.showGradient ? null : Colors.transparent,
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
          child: GradientableWidget(
              active: !widget.showGradient,
              gradient: GradientFoundation.defaultLinearGradient,
              child: ImageWidget(
                height: ballSize.height / 2,
                width: ballSize.width * 0.75,
                iconData: ShuffleUiKitIcons.chevrondown,
                fit: BoxFit.cover,
                color: Colors.white.withOpacity(0.5),
              )),
        ),
      ),
    );
  }
}

enum AnimatedPullToShowState { showFirstHint, showSecondHint, showLastPhase }

class UiKitAnimatedPullToShowDelegate extends SliverPersistentHeaderDelegate {
  final List<Widget> children;
  final double topPadding;
  final ValueNotifier<double> lastPhaseScaleNotifier;
  final bool hide;

  UiKitAnimatedPullToShowDelegate({
    required this.topPadding,
    required this.children,
    required this.lastPhaseScaleNotifier,
    this.hide = false,
  });

  @override
  // double get maxExtent =>  topPadding;
  double get maxExtent => (hide ? 0 : (0.175 * 380) + (SpacingFoundation.verticalSpacing16 * 2)) + topPadding;

  @override
  double get minExtent => maxExtent * 0.325;

  @override
  bool shouldRebuild(UiKitAnimatedPullToShowDelegate oldDelegate) {
    return true;
  }

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final colorScheme = context.uiKitTheme?.colorScheme;
    final shrinkToMaxExtentRatio = shrinkOffset / maxExtent;
    const extentToShowListOfChildren = 0.4;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedBuilder(
            animation: lastPhaseScaleNotifier,
            builder: (context, child) {
              final scale = lastPhaseScaleNotifier.value;
              if (lastPhaseScaleNotifier.value == 0) return topPadding.heightBox;
              return AnimatedScale(
                scale: scale,
                duration: const Duration(milliseconds: 50),
                child: SizedBox(
                  height: (topPadding * (max(scale, 1))),
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
          height: max(0, maxExtent - topPadding - shrinkOffset - SpacingFoundation.verticalSpacing16),
          width: 1.sw,
          alignment: Alignment.topCenter,
          color: colorScheme?.surface2,
          child: Stack(
            alignment: Alignment.topCenter,
            fit: StackFit.expand,
            children: [
              // if (true)
              //   AnimatedPositioned(
              //     left: (1.sw / 2) - (0.15625.sw / 2),
              //     top: shrinkToMaxExtentRatio < 0.05 ? (-0.15625.sw * 0.6) : -0.15625.sw,
              //     duration: const Duration(milliseconds: 250),
              //     child: const AnimatedPullToShowHint(),
              //   ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 50),
                bottom: shrinkToMaxExtentRatio * SpacingFoundation.verticalSpacing2,
                // bottom: shrinkToMaxExtentRatio < 0.25 ? 0 : SpacingFoundation.verticalSpacing2,
                // bottom: 0,
                top: shrinkToMaxExtentRatio < extentToShowListOfChildren
                    ? SpacingFoundation.verticalSpacing16 * (1 - shrinkToMaxExtentRatio * 6)
                    : null,
                // left: shrinkToMaxExtentRatio * 1.sw/2,
                // left: shrinkToMaxExtentRatio < 0.25 ? null : (1.sw / 2) - (0.15625.sw / 2),
                child: AnimatedSize(
                  duration: const Duration(milliseconds: 350),
                  alignment: shrinkToMaxExtentRatio < extentToShowListOfChildren ? Alignment.topLeft : Alignment.center,
                  child: shrinkToMaxExtentRatio < extentToShowListOfChildren
                      ? AnimatedScale(
                      scale: 1 - shrinkToMaxExtentRatio,
                      duration: const Duration(milliseconds: 50),
                      child: SizedBox(
                        height: 0.15.sw + SpacingFoundation.verticalSpacing16 / 2,
                        width: 1.sw,
                        child: ListView.separated(
                          clipBehavior: Clip.none,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(horizontal: EdgeInsetsFoundation.vertical16),
                          itemBuilder: (context, index) => children.elementAt(index),
                          separatorBuilder: (context, index) => SpacingFoundation.horizontalSpace16,
                          itemCount: children.length,
                        ),
                      ))
                      : const SizedBox.shrink(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class UiKitPullToShowWidgetBar extends StatefulWidget {
  final List<Widget> children;
  final double topPadding;
  final ValueNotifier<double> lastPhaseScaleNotifier;
  final ValueNotifier<double> secondPhaseScaleNotifier;
  final bool showHints;
  final bool expandHint;
  final AnimatedPullToShowState state;

  const UiKitPullToShowWidgetBar({super.key,
    required this.children,
    required this.topPadding,
    required this.lastPhaseScaleNotifier,
    required this.secondPhaseScaleNotifier,
    this.showHints = true,
    this.state = AnimatedPullToShowState.showFirstHint,
    this.expandHint = true});

  @override
  State<UiKitPullToShowWidgetBar> createState() => _UiKitPullToShowWidgetBarState();
}

class _UiKitPullToShowWidgetBarState extends State<UiKitPullToShowWidgetBar> {
  AnimatedPullToShowState phase = AnimatedPullToShowState.showFirstHint;

  @override
  void initState() {
    super.initState();
    widget.secondPhaseScaleNotifier.addListener(_firstPhaseScaleNotifier);
  }

  _firstPhaseScaleNotifier() {
    if (phase == AnimatedPullToShowState.showLastPhase) {
      return;
    } else if (phase == AnimatedPullToShowState.showSecondHint) {
      setState(() {});
      if (widget.secondPhaseScaleNotifier.value > 68) {
        setState(() {
          phase = AnimatedPullToShowState.showLastPhase;
        });
      }
    }
  }

  @override
  void didUpdateWidget(covariant UiKitPullToShowWidgetBar oldWidget) {
    setState(() {
      // if(oldWidget.state)

      phase = widget.state;
    });
    super.didUpdateWidget(oldWidget);
  }

  double get maxExtent => 0.175.sw + (SpacingFoundation.verticalSpacing16 * 2) + widget.topPadding;

  double get minExtent => maxExtent * 0.325;

  @override
  void dispose() {
    widget.secondPhaseScaleNotifier.removeListener(_firstPhaseScaleNotifier);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('building phase $phase');
    final colorScheme = context.uiKitTheme?.colorScheme;
    final shrinkOffset =
    phase == AnimatedPullToShowState.showLastPhase ? 0 : maxExtent / 2 - widget.secondPhaseScaleNotifier.value;
    debugPrint('shrinkOffset is $shrinkOffset');
    final shrinkToMaxExtentRatio = shrinkOffset / maxExtent;
    final extentToShowListOfChildren = widget.expandHint ? 0.25 : 0.4;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (phase == AnimatedPullToShowState.showLastPhase)
          AnimatedBuilder(
              animation: widget.lastPhaseScaleNotifier,
              builder: (context, child) {
                final scale = widget.lastPhaseScaleNotifier.value;
                if (widget.lastPhaseScaleNotifier.value == 0) return widget.topPadding.heightBox;
                return AnimatedScale(
                  scale: scale,
                  duration: const Duration(milliseconds: 50),
                  child: SizedBox(
                    height: (widget.topPadding * scale),
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
              ))
        else
          widget.topPadding.heightBox,
        if (phase != AnimatedPullToShowState.showFirstHint)
          AnimatedSize(
              duration: const Duration(milliseconds: 50),
              child: UiKitCardWrapper(
                borderRadius: BorderRadiusFoundation.zero,
                height: max(0, maxExtent - widget.topPadding - shrinkOffset - SpacingFoundation.verticalSpacing16),
                width: 1.sw,
                alignment: Alignment.topCenter,
                color: colorScheme?.surface2,
                child: Stack(
                  alignment: Alignment.topCenter,
                  fit: StackFit.expand,
                  children: [
                    if (widget.showHints)
                      AnimatedPositioned(
                        left: (1.sw / 2) - (0.15625.sw / 2),
                        top: shrinkToMaxExtentRatio < 0.05 ? (-0.15625.sw * 0.6) : -0.15625.sw,
                        duration: const Duration(milliseconds: 250),
                        child: const AnimatedPullToShowHint(),
                      ),
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 50),
                      bottom: shrinkToMaxExtentRatio * SpacingFoundation.verticalSpacing2,
                      // bottom: shrinkToMaxExtentRatio < 0.25 ? 0 : SpacingFoundation.verticalSpacing2,
                      // bottom: 0,
                      top: shrinkToMaxExtentRatio < extentToShowListOfChildren
                          ? SpacingFoundation.verticalSpacing16 * (1 - shrinkToMaxExtentRatio * 6)
                          : null,
                      // left: shrinkToMaxExtentRatio * 1.sw/2,
                      // left: shrinkToMaxExtentRatio < 0.25 ? null : (1.sw / 2) - (0.15625.sw / 2),
                      child: AnimatedSize(
                        duration: const Duration(milliseconds: 350),
                        alignment:
                        shrinkToMaxExtentRatio < extentToShowListOfChildren ? Alignment.topLeft : Alignment.center,
                        child: shrinkToMaxExtentRatio < extentToShowListOfChildren
                            ? AnimatedScale(
                            scale: 1 - shrinkToMaxExtentRatio,
                            duration: const Duration(milliseconds: 50),
                            child: SizedBox(
                              height: 0.15.sw + SpacingFoundation.verticalSpacing16 / 2,
                              width: 1.sw,
                              child: ListView.separated(
                                clipBehavior: Clip.none,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                padding: EdgeInsets.symmetric(horizontal: EdgeInsetsFoundation.vertical16),
                                itemBuilder: (context, index) => widget.children.elementAt(index),
                                separatorBuilder: (context, index) => SpacingFoundation.horizontalSpace16,
                                itemCount: widget.children.length,
                              ),
                            ))
                            : widget.showHints
                            ? const AnimatedPullToShowHint()
                            : const SizedBox.shrink(),
                      ),
                    ),
                  ],
                ),
              )),
      ],
    );
  }
}

class UiKitAnimatedPullToShowHint extends StatefulWidget {
  final double topPadding;
  final ValueNotifier<double> scaleNotifier;

  const UiKitAnimatedPullToShowHint({super.key, required this.topPadding, required this.scaleNotifier});

  @override
  State<UiKitAnimatedPullToShowHint> createState() => _UiKitAnimatedPullToShowHintState();
}

class _UiKitAnimatedPullToShowHintState extends State<UiKitAnimatedPullToShowHint> {
  bool showFinalState = false;

  @override
  void initState() {
    widget.scaleNotifier.addListener(_scaleNotifier);
    super.initState();
  }

  _scaleNotifier() {
    if (!mounted) return;

    if (widget.scaleNotifier.value >= 2.1) {
      setState(() {
        showFinalState = true;
      });
    }
  }

  @override
  void dispose() {
    widget.scaleNotifier.removeListener(_scaleNotifier);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final colorScheme = theme?.colorScheme;
    return AnimatedSize(
        duration: const Duration(milliseconds: 50),
        reverseDuration: const Duration(milliseconds: 50),
        curve: Curves.bounceInOut,
        alignment: Alignment.topCenter,
        child: Stack(fit: StackFit.loose, alignment: Alignment.center, clipBehavior: Clip.none, children: [
          widget.topPadding.heightBox,
          AnimatedBuilder(
              animation: widget.scaleNotifier,
              builder: (context, child) {
                final scale = widget.scaleNotifier.value;
                return AnimatedCrossFade(
                    duration: const Duration(milliseconds: 500),
                    crossFadeState: showFinalState ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                    firstChild: UiKitCardWrapper(
                        gradient: GradientFoundation.defaultLinearGradient,
                        borderRadius: BorderRadiusFoundation.max,
                        width: min(scale * .1.sw, .1.sw),
                        height: scale * .089.sw,
                        clipBehavior: Clip.hardEdge,
                        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                        alignment: Alignment.bottomCenter,
                        child: Icon(
                          Icons.arrow_downward_rounded,
                          color: colorScheme?.inversePrimary,
                          size: min(scale * .05.sw, .05.sw),
                        )),
                    secondChild: UiKitBorderWrapper(
                      borderRadius: BorderRadiusFoundation.max,
                      width: min(scale * .1.sw, .1.sw),
                      height: scale * .089.sw,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: GradientableWidget(
                              gradient: GradientFoundation.defaultLinearGradient,
                              child: Icon(
                                Icons.check_circle_outline_rounded,
                                color: Colors.white,
                                size: min(scale * .05.sw, .05.sw),
                              ).paddingSymmetric(horizontal: 4.w, vertical: 2.h))),
                    ));
              })
        ]));
  }}
