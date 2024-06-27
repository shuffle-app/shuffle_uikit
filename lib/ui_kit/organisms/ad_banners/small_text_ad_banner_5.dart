import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SmallTextAdBanner5 extends StatelessWidget {
  const SmallTextAdBanner5({super.key});

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;
    final colorScheme = context.uiKitTheme?.colorScheme;

    return context.advertisementTextBanner(
      data: BaseUiKitAdvertisementTextBannerData(
        customPadding: EdgeInsetsFoundation.horizontal12,
        textAlignment: Alignment.bottomCenter,
        textWidget: Align(
          alignment: Alignment.bottomLeft,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Take',
                  style: regularTextTheme?.caption1.copyWith(
                    color: colorScheme?.primary,
                  ),
                ),
                TextSpan(
                  text: ' care ',
                  style: boldTextTheme?.caption1Bold.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme?.primary,
                  ),
                ),
                TextSpan(
                  text: 'of',
                  style: regularTextTheme?.caption1.copyWith(
                    color: colorScheme?.primary,
                  ),
                ),
                TextSpan(
                  text: ' yourself',
                  style: boldTextTheme?.caption1Bold.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme?.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
        availableWidth: 1.sw - SpacingFoundation.verticalSpacing32,
        imageLink: GraphicsFoundation.instance.png.mockAdBanner32.path,
        size: AdvertisementBannerSize.small,
      ),
    );
  }
}
