import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SmallTextAdBanner1 extends StatelessWidget {
  const SmallTextAdBanner1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return context.advertisementTextBanner(
      data: BaseUiKitAdvertisementTextBannerData(
        textAlignment: Alignment.center,
        textWidget: GradientableWidget(
          gradient: GradientFoundation.defaultLinearGradient,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'This is',
                  style: boldTextTheme?.subHeadline.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
                ),
                TextSpan(
                  text: '\nshuffle',
                  style: boldTextTheme?.subHeadline.copyWith(color: Colors.white, fontWeight: FontWeight.w800),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ).paddingOnly(left: (1.sw - SpacingFoundation.verticalSpacing32) / 4),
        availableWidth: 1.sw - SpacingFoundation.verticalSpacing32,
        imageLink: GraphicsFoundation.instance.png.searchFeedTextBanner2.path,
        size: AdvertisementBannerSize.small,
      ),
    );
  }
}
