import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class LargeTextAdBanner4 extends UiKitSwiperAdCard {
  final double? customHeight;
  LargeTextAdBanner4({super.key, this.customHeight})
      : super(
          adsData: BaseUiKitAdvertisementTextBannerData(
            textWidget: const SizedBox(),
            availableWidth: 0,
            size: AdvertisementBannerSize.large,
            imageLink: GraphicsFoundation.instance.png.spinnerTextBanner3.path,
          ),
        );

  @override
  double get width => 1.sw - EdgeInsetsFoundation.horizontal32;

  double get height => width * 1.17;

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;

    return context.advertisementTextBanner(
      data: BaseUiKitAdvertisementTextBannerData(
        textAlignment: Alignment.bottomCenter,
        textWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Immerse\n',
                    style: boldTextTheme?.subHeadline.copyWith(color: ColorsFoundation.surface4.withOpacity(0.8)),
                  ),
                  TextSpan(
                    text: 'yourself in the',
                    style: regularTextTheme?.body.copyWith(color: ColorsFoundation.surface4),
                  ),
                ],
              ),
            ),
            SpacingFoundation.verticalSpace16,
            Text(
              'business\nenvironment',
              style: boldTextTheme?.subHeadline.copyWith(color: ColorsFoundation.surface4),
              textAlign: TextAlign.right,
            ),
          ],
        ),
        availableWidth: width,
        customHeight: customHeight,
        imageFit: BoxFit.cover,
        imageLink: GraphicsFoundation.instance.png.shuffleTextBanner4.path,
        size: AdvertisementBannerSize.large,
      ),
    );
  }
}
