import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class MediumTextAdBanner1 extends StatelessWidget {
  final double? customHeight;
  const MediumTextAdBanner1({
    Key? key,
    this.customHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return context.advertisementTextBanner(
      data: BaseUiKitAdvertisementTextBannerData(
        availableWidth: 0.75.sw,
        customHeight: customHeight,
        imageLink: GraphicsFoundation.instance.png.spinnerTextBanner1.path,
        textAlignment: Alignment.topRight,
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
        ),
        size: AdvertisementBannerSize.medium,
      ),
    );
  }
}
