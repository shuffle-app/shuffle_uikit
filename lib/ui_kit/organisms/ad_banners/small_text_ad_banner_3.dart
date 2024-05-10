import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SmallTextAdBanner3 extends StatelessWidget {
  const SmallTextAdBanner3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return context.advertisementTextBanner(
      data: BaseUiKitAdvertisementTextBannerData(
        textExactOffset: Offset(-16, -4.h),
        textWidget: GradientableWidget(
          gradient: GradientFoundation.defaultLinearGradient,
          child: Text(
            'shuffle',
            style: boldTextTheme?.subHeadline.copyWith(color: Colors.white, fontWeight: FontWeight.w800),
          ),
        ),
        availableWidth: 1.sw - SpacingFoundation.verticalSpacing32,
        imageLink: GraphicsFoundation.instance.png.searchFeedTextBanner3.path,
        size: AdvertisementBannerSize.small,
      ),
    );
  }
}
