import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class LargeTextAdBanner2 extends UiKitSwiperAdCard {
  final double? customHeight;
  LargeTextAdBanner2({super.key, this.customHeight})
      : super(
          adsData: BaseUiKitAdvertisementTextBannerData(
            textWidget: const SizedBox(),
            availableWidth: 0,
            size: AdvertisementBannerSize.large,
            imageLink: GraphicsFoundation.instance.png.shuffleTextBanner2.path,
          ),
        );

  @override
  double get width => 1.sw - 48;

  double get height => customHeight ?? (width * 1.17);

  @override
  Widget build(BuildContext context) {
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;

    return context.advertisementTextBanner(
      data: BaseUiKitAdvertisementTextBannerData(
        customHeight: height,
        textExactOffset: Offset(-16, -(0.316 * height)),
        textWidget: GradientableWidget(
          child: Text(
            'palette\nyourself',
            style: regularTextTheme?.title2,
          ),
        ),
        availableWidth: width,
        imageLink: GraphicsFoundation.instance.png.shuffleTextBanner2.path,
        size: AdvertisementBannerSize.large,
      ),
    );
  }
}
