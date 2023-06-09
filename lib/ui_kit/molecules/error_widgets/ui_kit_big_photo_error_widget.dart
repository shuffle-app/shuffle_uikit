import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitBigPhotoErrorWidget extends StatelessWidget {
  const UiKitBigPhotoErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return UiKitCardWrapper(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SpacingFoundation.verticalSpace16,
          SpacingFoundation.verticalSpace24,
          SpacingFoundation.verticalSpace12,
          SpacingFoundation.verticalSpace16,
          Text(
            'Ooops!',
            style: textTheme?.body,
          ),
          SpacingFoundation.verticalSpace4,
          ImageWidget(
            svgAsset: GraphicsFoundation.instance.svg.noPhoto,
          ),
          SpacingFoundation.verticalSpace4,
          Text(
            'No photo here yet!',
            style: textTheme?.body,
          ),
        ],
      ),
    );
  }
}
