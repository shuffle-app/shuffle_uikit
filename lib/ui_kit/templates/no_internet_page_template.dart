import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class NoInternetPageTemplate extends StatelessWidget {
  const NoInternetPageTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 0.12.sh),
          ImageWidget(
            svgAsset: GraphicsFoundation.instance.svg.satelite,
          ),
          SpacingFoundation.verticalSpace8,
          Text(
            'Oops!',
            style: textTheme?.title1.copyWith(color: ColorsFoundation.darkNeutral900),
            textAlign: TextAlign.center,
          ),
          SpacingFoundation.verticalSpace16,
          Text(
            'No internet connection!',
            style: textTheme?.labelLarge.copyWith(color: ColorsFoundation.darkNeutral900),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
