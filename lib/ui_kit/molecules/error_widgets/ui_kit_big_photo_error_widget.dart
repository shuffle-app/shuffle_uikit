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
            S.of(context).Ooops,
            style: textTheme?.body.copyWith(
              color: ColorsFoundation.darkNeutral900,
            ),
          ),
          SpacingFoundation.verticalSpace4,
          const ImageWidget(
            iconData: ShuffleUiKitIcons.noPhoto,
          ),
          SpacingFoundation.verticalSpace4,
          Text(
            S.of(context).NoPhotoHereYet,
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
