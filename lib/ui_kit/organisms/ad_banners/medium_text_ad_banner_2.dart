import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class MediumTextAdBanner2 extends StatelessWidget {
  final double? customHeight;
  const MediumTextAdBanner2({Key? key, this.customHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;

    return context.advertisementTextBanner(
      data: BaseUiKitAdvertisementTextBannerData(
        customHeight: customHeight,
        availableWidth: 0.75.sw,
        imageLink: GraphicsFoundation.instance.png.spinnerTextBanner2.path,
        textAlignment: Alignment.bottomRight,
        textWidget: GradientableWidget(
          gradient: GradientFoundation.defaultLinearGradient,
          child: Text(
            'palette\nyourself',
            style: regularTextTheme?.title2,
          ),
        ),
        size: AdvertisementBannerSize.medium,
      ),
    );
  }
}
