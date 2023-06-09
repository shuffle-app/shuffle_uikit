import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitBigPhotoErrorWidget extends StatelessWidget {
  const UiKitBigPhotoErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return UiKitCardWrapper(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Ooops!',
            style: textTheme?.body.copyWith(
              color: ColorsFoundation.darkNeutral900,
            ),
          ),
          SpacingFoundation.verticalSpace4,
          ImageWidget(
            svgAsset: GraphicsFoundation.instance.svg.noPhoto,
          ),
          SpacingFoundation.verticalSpace4,
          Text(
            'No photo here yet!',
            style: textTheme?.body.copyWith(
              color: ColorsFoundation.darkNeutral900,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
