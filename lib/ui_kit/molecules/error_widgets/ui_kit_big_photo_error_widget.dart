import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitBigPhotoErrorWidget extends StatelessWidget {
  final bool showText;
  final BorderRadius? borderRadius;

  const UiKitBigPhotoErrorWidget({super.key,this.borderRadius}) : showText = true;

  const UiKitBigPhotoErrorWidget.withoutText({super.key,this.borderRadius}) : showText = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return UiKitCardWrapper(
      borderRadius: borderRadius,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (showText)
            Text(
              S.of(context).Ooops,
              style: textTheme?.body.copyWith(
                color: ColorsFoundation.darkNeutral900,
              ),
            )
          else
            ((textTheme?.body.fontSize ?? 1) * 1.2).heightBox,
          SpacingFoundation.verticalSpace4,
          ImageWidget(
            svgAsset: GraphicsFoundation.instance.svg.noPhoto,
          ),
          SpacingFoundation.verticalSpace4,
          if (showText)
            Text(
              S.of(context).NoPhotoHereYet,
              style: textTheme?.body.copyWith(
                color: ColorsFoundation.darkNeutral900,
              ),
              textAlign: TextAlign.center,
            )
          else
            ((textTheme?.body.fontSize ?? 1) * 1.2).heightBox,
        ],
      ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16),
    );
  }
}
