import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SwiperCardPage extends StatefulWidget {
  const SwiperCardPage({Key? key}) : super(key: key);

  @override
  State<SwiperCardPage> createState() => _SwiperCardPageState();
}

class _SwiperCardPageState extends State<SwiperCardPage> with SingleTickerProviderStateMixin {
  late final lottieController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
    value: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Try Yourself',
              style: context.uiKitTheme?.boldTextTheme.title1,
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: UiKitCardSwiper(
                onSwipe: (_, __, ___) {
                  return true;
                },
                cards: List<BaseUiKitSwiperCard>.generate(
                  3,
                  (index) => UiKitSwiperCard(
                    onTap: () {
                      log('i am tapped!', name: 'UiKitSwiperCard');
                    },
                    title: 'Dance Again',
                    subtitle: 'Unique place for unique people',
                    imageLink: Assets.images.png.mockSwiperCard.path,
                    tags: [
                      UiKitTagWidget(
                        title: 'Club',
                        icon: Assets.images.svg.cocktail.path,
                      ),
                      UiKitTagWidget(
                        title: 'Club',
                        icon: Assets.images.svg.cocktail.path,
                        customSpace: SpacingFoundation.horizontalSpace8,
                        showSpacing: true,
                      ),
                      UiKitTagWidget(
                        title: 'Club',
                        icon: Assets.images.svg.cocktail.path,
                        customSpace: SpacingFoundation.horizontalSpace8,
                        showSpacing: true,
                      ),
                      UiKitTagWidget(
                        title: 'Club',
                        icon: Assets.images.svg.cocktail.path,
                        customSpace: SpacingFoundation.horizontalSpace8,
                        showSpacing: true,
                      ),
                      UiKitTagWidget(
                        title: 'Club',
                        icon: Assets.images.svg.cocktail.path,
                        customSpace: SpacingFoundation.horizontalSpace8,
                        showSpacing: true,
                      ),
                    ],
                  ),
                ),
                customLikeAnimation: AnimatedBuilder(
                  builder: (context, child) => HideWrapper(
                    shouldHide: false,
                    child: child ?? const SizedBox(),
                  ),
                  animation: lottieController,
                  child: ImageWidget(
                    svgAsset: GraphicsFoundation.instance.svg.heartBrokenFill,
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                customDislikeAnimation: AnimatedBuilder(
                  builder: (context, child) => HideWrapper(
                    shouldHide: lottieController.value == 0 || lottieController.value == 1,
                    child: child ?? const SizedBox(),
                  ),
                  animation: lottieController,
                  child: LottieAnimation(
                    lottiePath: GraphicsFoundation.instance.animations.lottie.animationBrokenHeart.path,
                    controller: lottieController,
                  ),
                ),
              ),
            ),
            SpacingFoundation.verticalSpace16,
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                context.bouncingButton(
                  small: true,
                  blurred: true,
                  data: BaseUiKitButtonData(
                    icon: ImageWidget(
                      svgAsset: GraphicsFoundation.instance.svg.heartBrokenFill,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      lottieController.forward(from: 0);
                    },
                  ),
                ),
                context.bouncingButton(
                  small: false,
                  blurred: true,
                  data: BaseUiKitButtonData(
                    icon: ImageWidget(
                      svgAsset: GraphicsFoundation.instance.svg.starOutline,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
                context.bouncingButton(
                  small: true,
                  blurred: true,
                  data: BaseUiKitButtonData(
                    icon: ImageWidget(
                      svgAsset: GraphicsFoundation.instance.svg.heartFill,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ).paddingAll(EdgeInsetsFoundation.all24),
      ),
    );
  }
}

class HideWrapper extends StatelessWidget {
  final bool shouldHide;
  final Widget child;

  const HideWrapper({
    Key? key,
    required this.shouldHide,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (shouldHide) return const SizedBox();
    return child;
  }
}
