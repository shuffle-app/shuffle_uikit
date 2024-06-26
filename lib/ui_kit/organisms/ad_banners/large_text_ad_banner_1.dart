import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class LargeTextAdBanner1 extends UiKitSwiperAdCard {
  final double? customHeight;
  LargeTextAdBanner1({super.key, this.customHeight})
      : super(
            adsData: BaseUiKitAdvertisementTextBannerData(
              textWidget: const SizedBox(),
              availableWidth: 0,
              size: AdvertisementBannerSize.large,
              imageLink: GraphicsFoundation.instance.png.shuffleTextBanner1.path,
            ));

  @override
  double get width => 1.sw - 48;

  double get height => customHeight ?? ((1.sw - 48) * 1.17);

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;

    return context.advertisementTextBanner(
      data: BaseUiKitAdvertisementTextBannerData(
        customHeight: customHeight,
        textWidget: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            GradientableWidget(
              gradient: GradientFoundation.defaultLinearGradient,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'This is',
                      style: boldTextTheme?.subHeadline.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                      text: ' shuffle',
                      style: boldTextTheme?.subHeadline.copyWith(color: Colors.white, fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: height * 0.22),
            GradientableWidget(
              gradient: GradientFoundation.whiteLinearInvertedGradient,
              child: Text(
                'Smart leisure\nselection for everyone,\neverywhere',
                style: regularTextTheme?.body.copyWith(fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        availableWidth: width,
        imageLink: GraphicsFoundation.instance.png.shuffleTextBanner1.path,
        size: AdvertisementBannerSize.large,
      ),
    );
  }
}
