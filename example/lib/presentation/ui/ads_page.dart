import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class AdsPage extends StatelessWidget {
  const AdsPage({Key? key}) : super(key: key);

  double get largeBannerHeight => (1.sw - EdgeInsetsFoundation.horizontal32) * 1.17;

  double get mediumBannerHeight => 0.75.sw * 0.7583;

  double get smallBannerHeight => (1.sw - SpacingFoundation.verticalSpacing32) * 0.3263;

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: MediaQuery.viewPaddingOf(context).top),
            SpacingFoundation.verticalSpace24,
            Text(
              'Ad Banners',
              style: boldTextTheme?.title1,
              textAlign: TextAlign.center,
            ),
            SpacingFoundation.verticalSpace24,
            SizedBox(
              height: largeBannerHeight + SpacingFoundation.verticalSpacing16,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: EdgeInsetsFoundation.horizontal16),
                scrollDirection: Axis.horizontal,
                children: [
                  LargeTextAdBanner1(),
                  SpacingFoundation.horizontalSpace16,
                  LargeTextAdBanner2(),
                  SpacingFoundation.horizontalSpace16,
                  LargeTextAdBanner3(),
                  SpacingFoundation.horizontalSpace16,
                  LargeTextAdBanner4(),
                  SpacingFoundation.horizontalSpace16,
                  context.advertisementImageBanner(
                    data: BaseUiKitAdvertisementImageBannerData(
                      availableWidth: 1.sw - EdgeInsetsFoundation.horizontal32,
                      customHeight: largeBannerHeight,
                      imageLink: GraphicsFoundation.instance.png.mockAdBanner1.path,
                      title: 'Dubai',
                      size: AdvertisementBannerSize.large,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace16,
                  context.advertisementImageBanner(
                    data: BaseUiKitAdvertisementImageBannerData(
                      availableWidth: 1.sw - EdgeInsetsFoundation.horizontal32,
                      customHeight: largeBannerHeight,
                      imageLink: GraphicsFoundation.instance.png.mockAdBanner2.path,
                      title: 'Dubai',
                      size: AdvertisementBannerSize.large,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace16,
                  context.advertisementImageBanner(
                    data: BaseUiKitAdvertisementImageBannerData(
                      availableWidth: 1.sw - EdgeInsetsFoundation.horizontal32,
                      customHeight: largeBannerHeight,
                      imageLink: GraphicsFoundation.instance.png.mockAdBanner3.path,
                      title: 'Dubai',
                      size: AdvertisementBannerSize.large,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace16,
                  context.advertisementImageBanner(
                    data: BaseUiKitAdvertisementImageBannerData(
                      availableWidth: 1.sw - EdgeInsetsFoundation.horizontal32,
                      customHeight: largeBannerHeight,
                      imageLink: GraphicsFoundation.instance.png.mockAdBanner4.path,
                      title: 'Dubai',
                      size: AdvertisementBannerSize.large,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace16,
                  context.advertisementImageBanner(
                    data: BaseUiKitAdvertisementImageBannerData(
                      availableWidth: 1.sw - EdgeInsetsFoundation.horizontal32,
                      customHeight: largeBannerHeight,
                      imageLink: GraphicsFoundation.instance.png.mockAdBanner5.path,
                      title: 'Dubai',
                      size: AdvertisementBannerSize.large,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace16,
                  context.advertisementImageBanner(
                    data: BaseUiKitAdvertisementImageBannerData(
                      availableWidth: 1.sw - EdgeInsetsFoundation.horizontal32,
                      customHeight: largeBannerHeight,
                      imageLink: GraphicsFoundation.instance.png.mockAdBanner6.path,
                      title: 'Dubai',
                      size: AdvertisementBannerSize.large,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace16,
                  context.advertisementImageBanner(
                    data: BaseUiKitAdvertisementImageBannerData(
                      availableWidth: 1.sw - EdgeInsetsFoundation.horizontal32,
                      customHeight: largeBannerHeight,
                      imageLink: GraphicsFoundation.instance.png.mockAdBanner7.path,
                      title: 'Dubai',
                      size: AdvertisementBannerSize.large,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace16,
                  context.advertisementImageBanner(
                    data: BaseUiKitAdvertisementImageBannerData(
                      availableWidth: 1.sw - EdgeInsetsFoundation.horizontal32,
                      customHeight: largeBannerHeight,
                      imageLink: GraphicsFoundation.instance.png.mockAdBanner8.path,
                      title: 'Dubai',
                      size: AdvertisementBannerSize.large,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace16,
                  context.advertisementImageBanner(
                    data: BaseUiKitAdvertisementImageBannerData(
                      availableWidth: 1.sw - EdgeInsetsFoundation.horizontal32,
                      customHeight: largeBannerHeight,
                      imageLink: GraphicsFoundation.instance.png.mockAdBanner9.path,
                      title: 'Dubai',
                      size: AdvertisementBannerSize.large,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace16,
                  context.advertisementImageBanner(
                    data: BaseUiKitAdvertisementImageBannerData(
                      availableWidth: 1.sw - EdgeInsetsFoundation.horizontal32,
                      customHeight: largeBannerHeight,
                      imageLink: GraphicsFoundation.instance.png.mockAdBanner25.path,
                      title: 'Dubai',
                      size: AdvertisementBannerSize.large,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace16,
                  context.advertisementImageBanner(
                    data: BaseUiKitAdvertisementImageBannerData(
                      availableWidth: 1.sw - EdgeInsetsFoundation.horizontal32,
                      customHeight: largeBannerHeight,
                      imageLink: GraphicsFoundation.instance.png.mockAdBanner13.path,
                      title: 'Dubai',
                      size: AdvertisementBannerSize.large,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace16,
                  context.advertisementImageBanner(
                    data: BaseUiKitAdvertisementImageBannerData(
                      availableWidth: 1.sw - EdgeInsetsFoundation.horizontal32,
                      customHeight: largeBannerHeight,
                      imageLink: GraphicsFoundation.instance.png.mockAdBanner14.path,
                      title: 'Dubai',
                      size: AdvertisementBannerSize.large,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace16,
                  context.advertisementImageBanner(
                    data: BaseUiKitAdvertisementImageBannerData(
                      availableWidth: 1.sw - EdgeInsetsFoundation.horizontal32,
                      customHeight: largeBannerHeight,
                      imageLink: GraphicsFoundation.instance.png.mockAdBanner15.path,
                      title: 'Dubai',
                      size: AdvertisementBannerSize.large,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace16,
                  context.advertisementImageBanner(
                    data: BaseUiKitAdvertisementImageBannerData(
                      availableWidth: 1.sw - EdgeInsetsFoundation.horizontal32,
                      customHeight: largeBannerHeight,
                      imageLink: GraphicsFoundation.instance.png.mockAdBanner16.path,
                      title: 'Dubai',
                      size: AdvertisementBannerSize.large,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace16,
                ],
              ),
            ),
            SpacingFoundation.verticalSpace24,
            SizedBox(
              height: mediumBannerHeight + SpacingFoundation.verticalSpacing16,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: EdgeInsetsFoundation.horizontal16),
                scrollDirection: Axis.horizontal,
                children: [
                  const MediumTextAdBanner1(),
                  SpacingFoundation.horizontalSpace16,
                  const MediumTextAdBanner2(),
                  SpacingFoundation.horizontalSpace16,
                  const MediumTextAdBanner3(),
                  SpacingFoundation.horizontalSpace16,
                  const MediumTextAdBanner4(),
                  SpacingFoundation.horizontalSpace16,
                  context.advertisementImageBanner(
                    data: BaseUiKitAdvertisementImageBannerData(
                      availableWidth: 0.75.sw,
                      customHeight: mediumBannerHeight,
                      imageLink: GraphicsFoundation.instance.png.mockAdBanner1.path,
                      title: 'Dubai',
                      size: AdvertisementBannerSize.medium,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace16,
                  context.advertisementImageBanner(
                    data: BaseUiKitAdvertisementImageBannerData(
                      availableWidth: 0.75.sw,
                      customHeight: mediumBannerHeight,
                      imageLink: GraphicsFoundation.instance.png.mockAdBanner2.path,
                      title: 'Dubai',
                      size: AdvertisementBannerSize.medium,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace16,
                  context.advertisementImageBanner(
                    data: BaseUiKitAdvertisementImageBannerData(
                      availableWidth: 0.75.sw,
                      customHeight: mediumBannerHeight,
                      imageLink: GraphicsFoundation.instance.png.mockAdBanner3.path,
                      title: 'Dubai',
                      size: AdvertisementBannerSize.medium,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace16,
                  context.advertisementImageBanner(
                    data: BaseUiKitAdvertisementImageBannerData(
                      availableWidth: 0.75.sw,
                      customHeight: mediumBannerHeight,
                      imageLink: GraphicsFoundation.instance.png.mockAdBanner4.path,
                      title: 'Dubai',
                      size: AdvertisementBannerSize.medium,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace16,
                  context.advertisementImageBanner(
                    data: BaseUiKitAdvertisementImageBannerData(
                      availableWidth: 0.75.sw,
                      customHeight: mediumBannerHeight,
                      imageLink: GraphicsFoundation.instance.png.mockAdBanner5.path,
                      title: 'Dubai',
                      size: AdvertisementBannerSize.medium,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace16,
                  context.advertisementImageBanner(
                    data: BaseUiKitAdvertisementImageBannerData(
                      availableWidth: 0.75.sw,
                      customHeight: mediumBannerHeight,
                      imageLink: GraphicsFoundation.instance.png.mockAdBanner24.path,
                      title: 'Dubai',
                      size: AdvertisementBannerSize.medium,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace16,
                  context.advertisementImageBanner(
                    data: BaseUiKitAdvertisementImageBannerData(
                      availableWidth: 0.75.sw,
                      customHeight: mediumBannerHeight,
                      imageLink: GraphicsFoundation.instance.png.mockAdBanner8.path,
                      title: 'Dubai',
                      size: AdvertisementBannerSize.medium,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace16,
                  context.advertisementImageBanner(
                    data: BaseUiKitAdvertisementImageBannerData(
                      availableWidth: 0.75.sw,
                      customHeight: mediumBannerHeight,
                      imageLink: GraphicsFoundation.instance.png.mockAdBanner9.path,
                      title: 'Dubai',
                      size: AdvertisementBannerSize.medium,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace16,
                  context.advertisementImageBanner(
                    data: BaseUiKitAdvertisementImageBannerData(
                      availableWidth: 0.75.sw,
                      customHeight: mediumBannerHeight,
                      imageLink: GraphicsFoundation.instance.png.mockAdBanner10.path,
                      title: 'Dubai',
                      size: AdvertisementBannerSize.medium,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace16,
                  context.advertisementImageBanner(
                    data: BaseUiKitAdvertisementImageBannerData(
                      availableWidth: 0.75.sw,
                      customHeight: mediumBannerHeight,
                      imageLink: GraphicsFoundation.instance.png.mockAdBanner26.path,
                      title: 'Dubai',
                      size: AdvertisementBannerSize.medium,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace16,
                  context.advertisementImageBanner(
                    data: BaseUiKitAdvertisementImageBannerData(
                      availableWidth: 0.75.sw,
                      customHeight: mediumBannerHeight,
                      imageLink: GraphicsFoundation.instance.png.mockAdBanner28.path,
                      title: 'Dubai',
                      size: AdvertisementBannerSize.medium,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace16,
                  context.advertisementImageBanner(
                    data: BaseUiKitAdvertisementImageBannerData(
                      availableWidth: 0.75.sw,
                      customHeight: mediumBannerHeight,
                      imageLink: GraphicsFoundation.instance.png.mockAdBanner15.path,
                      title: 'Dubai',
                      size: AdvertisementBannerSize.medium,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace16,
                  context.advertisementImageBanner(
                    data: BaseUiKitAdvertisementImageBannerData(
                      availableWidth: 0.75.sw,
                      customHeight: mediumBannerHeight,
                      imageLink: GraphicsFoundation.instance.png.mockAdBanner16.path,
                      title: 'Dubai',
                      size: AdvertisementBannerSize.medium,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace16,
                ],
              ),
            ),
            SpacingFoundation.verticalSpace24,
            SizedBox(
              height: smallBannerHeight + SpacingFoundation.verticalSpacing16,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: EdgeInsetsFoundation.horizontal16),
                scrollDirection: Axis.horizontal,
                children: [
                  const SmallTextAdBanner1(),
                  SpacingFoundation.horizontalSpace16,
                  const SmallTextAdBanner2(),
                  SpacingFoundation.horizontalSpace16,
                  const SmallTextAdBanner3(),
                  SpacingFoundation.horizontalSpace16,
                  const SmallTextAdBanner4(),
                  SpacingFoundation.horizontalSpace16,
                  const SmallTextAdBanner5(),
                  SpacingFoundation.horizontalSpace16,
                  context.advertisementImageBanner(
                    data: BaseUiKitAdvertisementImageBannerData(
                      availableWidth: 1.sw - SpacingFoundation.verticalSpacing32,
                      customHeight: smallBannerHeight,
                      imageLink: GraphicsFoundation.instance.png.mockAdBanner21.path,
                      title: 'Dubai',
                      size: AdvertisementBannerSize.small,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace16,
                  context.advertisementImageBanner(
                    data: BaseUiKitAdvertisementImageBannerData(
                      availableWidth: 1.sw - SpacingFoundation.verticalSpacing32,
                      customHeight: smallBannerHeight,
                      imageLink: GraphicsFoundation.instance.png.mockAdBanner20.path,
                      title: 'Dubai',
                      size: AdvertisementBannerSize.small,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace16,
                  context.advertisementImageBanner(
                    data: BaseUiKitAdvertisementImageBannerData(
                      availableWidth: 1.sw - SpacingFoundation.verticalSpacing32,
                      customHeight: smallBannerHeight,
                      imageLink: GraphicsFoundation.instance.png.mockAdBanner19.path,
                      title: 'Dubai',
                      size: AdvertisementBannerSize.small,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace16,
                  context.advertisementImageBanner(
                    data: BaseUiKitAdvertisementImageBannerData(
                      availableWidth: 1.sw - SpacingFoundation.verticalSpacing32,
                      customHeight: smallBannerHeight,
                      imageLink: GraphicsFoundation.instance.png.mockAdBanner30.path,
                      title: 'Dubai',
                      size: AdvertisementBannerSize.small,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace16,
                  context.advertisementImageBanner(
                    data: BaseUiKitAdvertisementImageBannerData(
                      availableWidth: 1.sw - SpacingFoundation.verticalSpacing32,
                      customHeight: smallBannerHeight,
                      imageLink: GraphicsFoundation.instance.png.mockAdBanner31.path,
                      title: 'Dubai',
                      size: AdvertisementBannerSize.small,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace16,
                  context.advertisementImageBanner(
                    data: BaseUiKitAdvertisementImageBannerData(
                      availableWidth: 1.sw - SpacingFoundation.verticalSpacing32,
                      customHeight: smallBannerHeight,
                      imageLink: GraphicsFoundation.instance.png.mockAdBanner18.path,
                      title: 'Dubai',
                      size: AdvertisementBannerSize.small,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace16,
                  context.advertisementImageBanner(
                    data: BaseUiKitAdvertisementImageBannerData(
                      availableWidth: 1.sw - SpacingFoundation.verticalSpacing32,
                      customHeight: smallBannerHeight,
                      imageLink: GraphicsFoundation.instance.png.mockAdBanner29.path,
                      title: 'Dubai',
                      size: AdvertisementBannerSize.small,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace16,
                  context.advertisementImageBanner(
                    data: BaseUiKitAdvertisementImageBannerData(
                      availableWidth: 1.sw - SpacingFoundation.verticalSpacing32,
                      customHeight: smallBannerHeight,
                      imageLink: GraphicsFoundation.instance.png.mockAdBanner12.path,
                      title: 'Dubai',
                      size: AdvertisementBannerSize.small,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace16,
                  context.advertisementImageBanner(
                    data: BaseUiKitAdvertisementImageBannerData(
                      availableWidth: 1.sw - SpacingFoundation.verticalSpacing32,
                      customHeight: smallBannerHeight,
                      imageLink: GraphicsFoundation.instance.png.mockAdBanner17.path,
                      title: 'Dubai',
                      size: AdvertisementBannerSize.small,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace16,
                  context.advertisementImageBanner(
                    data: BaseUiKitAdvertisementImageBannerData(
                      availableWidth: 1.sw - SpacingFoundation.verticalSpacing32,
                      customHeight: smallBannerHeight,
                      imageLink: GraphicsFoundation.instance.png.mockAdBanner27.path,
                      title: 'Dubai',
                      size: AdvertisementBannerSize.small,
                    ),
                  ),
                ],
              ),
            ),
            SpacingFoundation.verticalSpace24,
            SpacingFoundation.verticalSpace24,
          ],
        ),
      ),
    );
  }
}
