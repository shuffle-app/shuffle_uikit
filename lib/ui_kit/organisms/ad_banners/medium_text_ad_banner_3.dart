import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class MediumTextAdBanner3 extends StatelessWidget {
  const MediumTextAdBanner3({Key? key}) : super(key: key);

  double get width => 0.75.sw;

  double get height => width * 0.7583;

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;

    return context.advertisementTextBanner(
      data: BaseUiKitAdvertisementTextBannerData(
        textAlignment: Alignment.bottomCenter,
        customPadding: 10.0,
        decoration: Positioned(
          top: -height * 0.475,
          left: -SpacingFoundation.horizontalSpacing12,
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
        availableWidth: width,
        imageLink: GraphicsFoundation.instance.png.shuffleTextBanner3.path,
        size: AdvertisementBannerSize.medium,
      ),
    );
  }
}
