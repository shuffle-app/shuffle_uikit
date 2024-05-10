import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class AdsPage extends StatelessWidget {
  const AdsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          context.advertisementImageBanner(
            data: BaseUiKitAdvertisementImageBannerData(
              availableWidth: 1.sw - EdgeInsetsFoundation.horizontal32,
              imageLink: GraphicsFoundation.instance.png.mockAdBanner.path,
              title: 'Dubai',
              size: AdvertisementBannerSize.large,
            ),
          ),
          SpacingFoundation.verticalSpace24,
          context.advertisementImageBanner(
            data: BaseUiKitAdvertisementImageBannerData(
              availableWidth: 1.sw - EdgeInsetsFoundation.horizontal32,
              imageLink: GraphicsFoundation.instance.png.mockAdBanner1.path,
              title: 'Dubai',
              size: AdvertisementBannerSize.large,
            ),
          ),
          SpacingFoundation.verticalSpace24,
          context.advertisementImageBanner(
            data: BaseUiKitAdvertisementImageBannerData(
              availableWidth: 1.sw - EdgeInsetsFoundation.horizontal32,
              imageLink: GraphicsFoundation.instance.png.mockAdBanner2.path,
              title: 'Dubai',
              size: AdvertisementBannerSize.large,
            ),
          ),
          SpacingFoundation.verticalSpace24,
          context.advertisementImageBanner(
            data: BaseUiKitAdvertisementImageBannerData(
              availableWidth: 1.sw - EdgeInsetsFoundation.horizontal32,
              imageLink: GraphicsFoundation.instance.png.mockAdBanner3.path,
              title: 'Dubai',
              size: AdvertisementBannerSize.large,
            ),
          ),
          SpacingFoundation.verticalSpace24,
          context.advertisementImageBanner(
            data: BaseUiKitAdvertisementImageBannerData(
              availableWidth: 1.sw - EdgeInsetsFoundation.horizontal32,
              imageLink: GraphicsFoundation.instance.png.mockAdBanner4.path,
              title: 'Dubai',
              size: AdvertisementBannerSize.large,
            ),
          ),
          SpacingFoundation.verticalSpace24,
          context.advertisementImageBanner(
            data: BaseUiKitAdvertisementImageBannerData(
              availableWidth: 1.sw - EdgeInsetsFoundation.horizontal32,
              imageLink: GraphicsFoundation.instance.png.mockAdBanner5.path,
              title: 'Dubai',
              size: AdvertisementBannerSize.large,
            ),
          ),
          SpacingFoundation.verticalSpace24,
          context.advertisementImageBanner(
            data: BaseUiKitAdvertisementImageBannerData(
              availableWidth: 1.sw - EdgeInsetsFoundation.horizontal32,
              imageLink: GraphicsFoundation.instance.png.mockAdBanner6.path,
              title: 'Dubai',
              size: AdvertisementBannerSize.large,
            ),
          ),
          SpacingFoundation.verticalSpace24,
          context.advertisementImageBanner(
            data: BaseUiKitAdvertisementImageBannerData(
              availableWidth: 1.sw - EdgeInsetsFoundation.horizontal32,
              imageLink: GraphicsFoundation.instance.png.mockAdBanner7.path,
              title: 'Dubai',
              size: AdvertisementBannerSize.large,
            ),
          ),
          SpacingFoundation.verticalSpace24,
          context.advertisementImageBanner(
            data: BaseUiKitAdvertisementImageBannerData(
              availableWidth: 1.sw - EdgeInsetsFoundation.horizontal32,
              imageLink: GraphicsFoundation.instance.png.mockAdBanner8.path,
              title: 'Dubai',
              size: AdvertisementBannerSize.large,
            ),
          ),
          SpacingFoundation.verticalSpace24,
          context.advertisementImageBanner(
            data: BaseUiKitAdvertisementImageBannerData(
              availableWidth: 1.sw - EdgeInsetsFoundation.horizontal32,
              imageLink: GraphicsFoundation.instance.png.mockAdBanner9.path,
              title: 'Dubai',
              size: AdvertisementBannerSize.large,
            ),
          ),
          SpacingFoundation.verticalSpace24,
          context.advertisementImageBanner(
            data: BaseUiKitAdvertisementImageBannerData(
              availableWidth: 1.sw - EdgeInsetsFoundation.horizontal32,
              imageLink: GraphicsFoundation.instance.png.mockAdBanner10.path,
              title: 'Dubai',
              size: AdvertisementBannerSize.large,
            ),
          ),
          SpacingFoundation.verticalSpace24,
          context.advertisementImageBanner(
            data: BaseUiKitAdvertisementImageBannerData(
              availableWidth: 1.sw - EdgeInsetsFoundation.horizontal32,
              imageLink: GraphicsFoundation.instance.png.mockAdBanner11.path,
              title: 'Dubai',
              size: AdvertisementBannerSize.large,
            ),
          ),
          SpacingFoundation.verticalSpace24,
        ],
      ),
    );
  }
}
