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
    const UiKitMockedAudioMessagesAnimation(),
    const GetBonusAnimation(),
    const AddReviewAnimation()
  ];

  int featureIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 3000));
  }

  void animationStateListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      if (featureIndex < _features.length - 1) {
        setState(() {
          crossFadeState = CrossFadeState.showSecond;
        });
        _controller.forward(from: 0);
        Future.delayed(const Duration(milliseconds: 1000), () {
          setState(() {
            featureIndex++;
            crossFadeState = CrossFadeState.showFirst;
          });
        });
      } else {
        setState(() {
          crossFadeState = CrossFadeState.showSecond;
        });
      }
    }
  }

  @override
  void dispose() {
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
            AnimatedCrossFade(
                firstChild: _features[featureIndex],
                secondChild: _features[featureIndex + 1],
                crossFadeState: crossFadeState,
                reverseDuration: Duration.zero,
                duration: const Duration(milliseconds: 500)),
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
