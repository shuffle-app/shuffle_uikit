import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitCompactPhotoErrorWidget extends StatelessWidget {
  const UiKitCompactPhotoErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return UiKitCardWrapper(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SpacingFoundation.verticalSpace24,
          Text(
            'No photo here yet!',
            style: textTheme?.body,
          ),
          SpacingFoundation.verticalSpace4,
          ImageWidget(
            svgAsset: GraphicsFoundation.instance.svg.noPhoto,
          ),
        ],
      ),
    );
  }
}
