import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SwiperCardPage extends StatefulWidget {
  const SwiperCardPage({Key? key}) : super(key: key);

  @override
  State<SwiperCardPage> createState() => _SwiperCardPageState();
}

class _SwiperCardPageState extends State<SwiperCardPage> with TickerProviderStateMixin {
  late final dislikeController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1, milliseconds: 500),
    value: 0,
  );
  late final likeController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1, milliseconds: 500),
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
                size: Size(1.sw - 24, 1.sh / 1.6),
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
                      const UiKitTagWidget(
                        title: 'Club',
                        icon: ShuffleUiKitIcons.cocktail,
                      ),
                      UiKitTagWidget(
                        title: 'Club',
                        icon: ShuffleUiKitIcons.cocktail,
                        customSpace: SpacingFoundation.horizontalSpace8,
                        showSpacing: true,
                      ),
                      UiKitTagWidget(
                        title: 'Club',
                        icon: ShuffleUiKitIcons.cocktail,
                        customSpace: SpacingFoundation.horizontalSpace8,
                        showSpacing: true,
                      ),
                      UiKitTagWidget(
                        title: 'Club',
                        icon: ShuffleUiKitIcons.cocktail,
                        customSpace: SpacingFoundation.horizontalSpace8,
                        showSpacing: true,
                      ),
                      UiKitTagWidget(
                        title: 'Club',
                        icon: ShuffleUiKitIcons.cocktail,
                        customSpace: SpacingFoundation.horizontalSpace8,
                        showSpacing: true,
                      ),
                    ],
                  ),
                ),
                likeController: likeController,
                dislikeController: dislikeController,
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
                    iconInfo: BaseUiKitButtonIconData(
                      iconData: ShuffleUiKitIcons.heartbrokenfill,
                      color: context.uiKitTheme?.colorScheme.inversePrimary,
                    ),
                    onPressed: () {
                      dislikeController.forward(from: 0);
                    },
                  ),
                ),
                context.bouncingButton(
                  small: false,
                  blurred: true,
                  data: BaseUiKitButtonData(
                    iconInfo: BaseUiKitButtonIconData(
                      iconData: ShuffleUiKitIcons.staroutline,
                      color: context.uiKitTheme?.colorScheme.inversePrimary,
                    ),
                    onPressed: () {},
                  ),
                ),
                context.bouncingButton(
                  small: true,
                  blurred: true,
                  data: BaseUiKitButtonData(
                    iconInfo: BaseUiKitButtonIconData(
                      iconData: ShuffleUiKitIcons.heartfill,
                      color: context.uiKitTheme?.colorScheme.inversePrimary,
                    ),
                    onPressed: () {
                      likeController.forward(from: 0);
                    },
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
