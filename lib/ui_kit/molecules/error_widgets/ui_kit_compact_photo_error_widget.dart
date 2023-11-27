import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitCompactPhotoErrorWidget extends StatelessWidget {
  final double? topSpacing;

  const UiKitCompactPhotoErrorWidget({
    super.key,
    this.topSpacing,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return UiKitCardWrapper(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: topSpacing ?? SpacingFoundation.verticalSpacing24),
          Text(
            S.of(context).NoPhotoHereYet,
            style: textTheme?.body.copyWith(
              color: ColorsFoundation.darkNeutral900,
            ),
          ),
          SpacingFoundation.verticalSpace4,
          const ImageWidget(
            iconData: ShuffleUiKitIcons.noPhoto,
          ),
        ],
      ),
    );
  }
}
