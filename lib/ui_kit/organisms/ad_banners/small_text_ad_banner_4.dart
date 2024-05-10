import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SmallTextAdBanner4 extends StatelessWidget {
  const SmallTextAdBanner4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;

    return context.advertisementTextBanner(
      data: BaseUiKitAdvertisementTextBannerData(
        customPadding: EdgeInsetsFoundation.horizontal12,
        textAlignment: Alignment.bottomCenter,
        textWidget: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Immerse\n',
                    style: boldTextTheme?.subHeadline.copyWith(color: ColorsFoundation.lightSurface),
                  ),
                  TextSpan(
                    text: 'yourself in the',
                    style: regularTextTheme?.body.copyWith(color: ColorsFoundation.lightSurface),
                  ),
                ],
              ),
            ),
            Text(
              'business\nenvironment',
              style: boldTextTheme?.subHeadline.copyWith(color: ColorsFoundation.lightSurface),
              textAlign: TextAlign.right,
            ),
          ],
        ),
        availableWidth: 1.sw - SpacingFoundation.verticalSpacing32,
        imageLink: GraphicsFoundation.instance.png.searchFeedTextBanner4.path,
        size: AdvertisementBannerSize.small,
      ),
    );
  }
}
