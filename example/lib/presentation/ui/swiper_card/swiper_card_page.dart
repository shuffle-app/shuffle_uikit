import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SwiperCardPage extends StatelessWidget {
  const SwiperCardPage({Key? key}) : super(key: key);

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
                  10,
                  (index) => UiKitSwiperCard(
                    title: 'Dance Again',
                    subtitle: 'Unique place for unique people',
                    imageLink: 'Assets.images.png.mockSwiperCard.path',
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
              ),
            ),
            SpacingFoundation.verticalSpace16,
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                context.smallButton(
                  blurred: true,
                  icon: ImageWidget(
                    svgAsset: GraphicsFoundation.instance.svg.heartBrokenFill,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                context.button(
                  blurred: true,
                  icon: ImageWidget(
                    svgAsset: GraphicsFoundation.instance.svg.starOutline,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                context.smallButton(
                  blurred: true,
                  icon: ImageWidget(
                    svgAsset: GraphicsFoundation.instance.svg.heartFill,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ).paddingAll(EdgeInsetsFoundation.all24),
      ),
    );
  }
}
