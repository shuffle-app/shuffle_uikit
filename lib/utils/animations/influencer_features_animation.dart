import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class InfluencerFeaturesAnimation extends StatefulWidget {
  const InfluencerFeaturesAnimation({super.key});

  @override
  State<InfluencerFeaturesAnimation> createState() => _InfluencerFeaturesAnimationState();
}

class _InfluencerFeaturesAnimationState extends State<InfluencerFeaturesAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  CrossFadeState crossFadeState = CrossFadeState.showFirst;

  final List<Widget> _features = [
    const ProfileCardAnimated(),
    const UiKitInfluencerAudioMessagesDemo(),
    UiKitHorizontalPicturesCarousel(
      autoPlay: true,
      autoPlayDuration: const Duration(seconds: 1),
      pictureLinks: [
        GraphicsFoundation.instance.png.mockAdBanner1.path,
        GraphicsFoundation.instance.png.mockAdBanner2.path,
        GraphicsFoundation.instance.png.mockAdBanner3.path,
        GraphicsFoundation.instance.png.mockAdBanner4.path,
        GraphicsFoundation.instance.png.mockAdBanner5.path,
        GraphicsFoundation.instance.png.place.path,
      ],
      carouselSize: Size(1.sw - SpacingFoundation.verticalSpacing32, 0.3.sh),
    ),
    const GetBonusAnimation(),
    const AddReviewAnimation()
  ];

  int featureIndex = 0;

  int get totalFeatureCount => _features.length;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 3000));
    _controller.addStatusListener(animationStateListener);
    _controller.forward();
  }

  void animationStateListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      log('animation completed');
      // if (featureIndex < _features.length - 1) {
      setState(() {
        featureIndex++;
        // crossFadeState = CrossFadeState.showSecond;
      });
      _controller.forward(from: 0);
      // Future.delayed(const Duration(milliseconds: 1000), () {
      //   log('switching to next feature');
      //   setState(() {
      //     featureIndex++;
      //     crossFadeState = CrossFadeState.showFirst;
      //   });
      // });
      // } else {
      //   setState(() {
      //     crossFadeState = CrossFadeState.showSecond;
      //   });
      // }
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

    final regularTextTheme = theme?.regularTextTheme;

    return UiKitCardWrapper(
        height: 0.5.sh,
        padding: EdgeInsets.all(SpacingFoundation.verticalSpacing16),
        gradient: theme?.themeMode == ThemeMode.light
            ? GradientFoundation.lightShunyGreyGradient
            : GradientFoundation.shunyGreyGradient,
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GradientableWidget(
                  gradient: GradientFoundation.starLinearGradient,
                  child: ImageWidget(
                    iconData: ShuffleUiKitIcons.gradientStar,
                    color: Colors.white,
                    width: 0.0625.sw,
                    height: 0.0625.sw,
                    fit: BoxFit.cover,
                  ),
                ),
                SpacingFoundation.horizontalSpace8,
                Expanded(
                  child: Text(
                    'Ability to become an influencer',
                    style: regularTextTheme?.body,
                  ),
                ),
              ],
            ),
            SpacingFoundation.verticalSpace16,
            AnimatedSwitcher(
                reverseDuration: Duration.zero,
                duration: const Duration(milliseconds: 500),
                child: _features[featureIndex % totalFeatureCount]),
            SpacingFoundation.verticalSpace16,
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GradientableWidget(
                  gradient: GradientFoundation.starLinearGradient,
                  child: ImageWidget(
                    iconData: ShuffleUiKitIcons.gradientStar,
                    color: Colors.white,
                    width: 0.0625.sw,
                    height: 0.0625.sw,
                    fit: BoxFit.cover,
                  ),
                ),
                SpacingFoundation.horizontalSpace8,
                Expanded(
                  child: Text(
                    //TODO text for animation
                    '',
                    style: regularTextTheme?.body,
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
