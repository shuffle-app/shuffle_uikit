import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class AdBannersPage extends StatelessWidget {
  const AdBannersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;

    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: MediaQuery.viewPaddingOf(context).top),
          Text(
            'Ad Banners',
            style: boldTextTheme?.title1,
            textAlign: TextAlign.center,
          ),
          SpacingFoundation.verticalSpace16,
          const Center(child: SmallTextAdBanner1()),
          SpacingFoundation.verticalSpace16,
          const Center(child: SmallTextAdBanner2()),
          SpacingFoundation.verticalSpace16,
          const Center(child: SmallTextAdBanner3()),
          SpacingFoundation.verticalSpace16,
          const Center(child: SmallTextAdBanner4()),
          SpacingFoundation.verticalSpace16,
          Center(child: LargeTextAdBanner1()),
          SpacingFoundation.verticalSpace16,
          Center(child: LargeTextAdBanner2()),
          SpacingFoundation.verticalSpace16,
          Center(child: LargeTextAdBanner3()),
          SpacingFoundation.verticalSpace16,
          Center(child: LargeTextAdBanner4()),
          SpacingFoundation.verticalSpace16,
          const Center(child: MediumTextAdBanner1()),
          SpacingFoundation.verticalSpace16,
          const Center(child: MediumTextAdBanner2()),
          SpacingFoundation.verticalSpace16,
          const Center(child: MediumTextAdBanner3()),
          SpacingFoundation.verticalSpace16,
          const Center(child: MediumTextAdBanner4()),
          SpacingFoundation.verticalSpace24,
        ],
      ),
    );
  }
}
