import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SmallTextAdBanner2 extends StatelessWidget {
  const SmallTextAdBanner2({super.key});

  @override
  Widget build(BuildContext context) {
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;

    return context.advertisementTextBanner(
      data: BaseUiKitAdvertisementTextBannerData(
        textAlignment: Alignment.bottomCenter,
        textWidget: GradientableWidget(
          gradient: GradientFoundation.defaultLinearGradient,
          child: Text(
            'palette yourself',
            style: regularTextTheme?.title2.copyWith(color: Colors.white),
          ),
        ),
        availableWidth: 1.sw - SpacingFoundation.verticalSpacing32,
        imageLink: GraphicsFoundation.instance.png.searchFeedTextBanner1.path,
        size: AdvertisementBannerSize.small,
      ),
    );
  }
}
