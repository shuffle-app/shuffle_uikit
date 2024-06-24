import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class LargeTextAdBanner3 extends UiKitSwiperAdCard {
  final double? customHeight;
  LargeTextAdBanner3({super.key, this.customHeight})
      : super(
          adsData: BaseUiKitAdvertisementTextBannerData(
            textWidget: const SizedBox(),
            availableWidth: 0,
            size: AdvertisementBannerSize.large,
            imageLink: GraphicsFoundation.instance.png.shuffleTextBanner3.path,
          ),
        );

  double get height => customHeight ?? ((1.sw - SpacingFoundation.verticalSpacing32) * 1.17);

  @override
  double get width => 1.sw - 48;

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;

    return context.advertisementTextBanner(
      data: BaseUiKitAdvertisementTextBannerData(
        customHeight: customHeight,
        decoration: Positioned(
          top: -height * 0.15,
          left: 0,
          child: Opacity(
            opacity: 0.5,
            child: GradientableWidget(
              gradient: GradientFoundation.whiteLinearGradient,
              child: ImageWidget(
                link: GraphicsFoundation.instance.svg.logo.path,
                width: width * 0.65,
                color: Colors.white,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        customPadding: 10.0,
        availableWidth: width,
        imageLink: GraphicsFoundation.instance.png.shuffleTextBanner3.path,
        textAlignment: Alignment.bottomCenter,
        textWidget: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.01),
            borderRadius: BorderRadiusFoundation.max,
          ),
          child: ClipRRect(
            borderRadius: BorderRadiusFoundation.max,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Take',
                      style: regularTextTheme?.caption1,
                    ),
                    TextSpan(
                      text: ' care ',
                      style: boldTextTheme?.caption1Bold.copyWith(fontWeight: FontWeight.w600),
                    ),
                    TextSpan(
                      text: 'of',
                      style: regularTextTheme?.caption1,
                    ),
                    TextSpan(
                      text: ' yourself',
                      style: boldTextTheme?.caption1Bold.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ).paddingSymmetric(
                horizontal: SpacingFoundation.horizontalSpacing16,
                vertical: SpacingFoundation.verticalSpacing4,
              ),
            ),
          ),
        ),
        size: AdvertisementBannerSize.large,
      ),
    );
  }
}
