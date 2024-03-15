import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class AddReviewAnimation extends StatefulWidget {
  final int maxReviewsCount;
  final Duration duration;

  const AddReviewAnimation({super.key, this.maxReviewsCount = 3, this.duration = const Duration(milliseconds: 750)});

  @override
  State<AddReviewAnimation> createState() => _AddReviewAnimationState();
}

class _AddReviewAnimationState extends State<AddReviewAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int reviewsCount = 1;

  final List rasterAvatars = [GraphicsFoundation.instance.png.mockAvatar];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _controller.addStatusListener(animationStateListener);
    _controller.forward();
  }

  animationStateListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      if (reviewsCount >= widget.maxReviewsCount) return;
      setState(() {
        reviewsCount++;
      });
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.removeStatusListener(animationStateListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final size = 23.w;
    final hosizontalPadding = 13.w;

    return DecoratedBox(
      decoration: BoxDecoration(borderRadius: BorderRadiusFoundation.all24, color: UiKitColors.beigeBackground),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          for (int i = 0; i < reviewsCount; i++)
            ClipOval(
              child: ImageWidget(
                rasterAsset: rasterAvatars[i % rasterAvatars.length],
                width: size,
                height: size,
                fit: BoxFit.cover,
              ),
            ).paddingAll(4.sp).paddingOnly(left: i * hosizontalPadding, right: i + 1 == reviewsCount ? 40.h : 0),
          AnimatedPositionedDirectional(
              curve: Curves.fastOutSlowIn,
              start: hosizontalPadding * reviewsCount * 1.15,
              duration: const Duration(milliseconds: 500),
              child: DecoratedBox(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadiusFoundation.all24, color: UiKitColors.beigeBackground),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(borderRadius: BorderRadiusFoundation.max, color: Colors.white),
                        child: SizedBox(
                            width: size,
                            height: size,
                            child: Center(
                                child: AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 500),
                                    child: Text(
                                      '+$reviewsCount',
                                      style:
                                          theme?.regularTextTheme.caption4.copyWith(color: UiKitColors.darkNeutral700),
                                    )))),
                      ),
                      SpacingFoundation.horizontalSpace2,
                      GradientableWidget(
                          gradient: GradientFoundation.defaultLinearGradient,
                          child: Text(
                            'respect'.toUpperCase(),
                            style: theme?.regularTextTheme.caption4Regular.copyWith(color: Colors.white),
                          )),
                    ],
                  ).paddingLTRB(0, 4.sp, 4.sp, 4.sp)))
        ],
      ),
    );
  }
}
