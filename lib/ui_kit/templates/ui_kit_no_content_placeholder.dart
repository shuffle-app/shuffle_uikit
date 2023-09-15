import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitNoContentPlaceholder extends StatelessWidget {
  const UiKitNoContentPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return UiKitCardWrapper(
      width: 1.sw - (EdgeInsetsFoundation.all32 * 2),
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
            'No content here yet!',
            style: textTheme?.body.copyWith(
              color: ColorsFoundation.darkNeutral900,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16),
    );
  }
}
