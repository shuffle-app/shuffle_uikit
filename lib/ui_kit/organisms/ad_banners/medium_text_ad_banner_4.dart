import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class MediumTextAdBanner4 extends StatelessWidget {
  const MediumTextAdBanner4({Key? key}) : super(key: key);

  double get width => 0.75.sw;

  double get height => width * 0.7583;

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
                    style: boldTextTheme?.subHeadline.copyWith(color: ColorsFoundation.surface4),
                  ),
                  TextSpan(
                    text: 'yourself in the',
                    style: regularTextTheme?.body.copyWith(color: ColorsFoundation.surface4),
                  ),
                ],
              ),
            ),
            Text(
              'business environment',
              style: boldTextTheme?.subHeadline.copyWith(color: ColorsFoundation.surface4),
              textAlign: TextAlign.right,
            ),
          ],
        ),
        availableWidth: width,
        imageLink: GraphicsFoundation.instance.png.spinnerTextBanner3.path,
        size: AdvertisementBannerSize.medium,
      ),
    );
  }
}
