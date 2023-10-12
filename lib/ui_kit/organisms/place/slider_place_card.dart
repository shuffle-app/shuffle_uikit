import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SliderPlaceCard extends StatelessWidget {
  final SlidablePlaceCardData slidablePlaceCardData;

  const SliderPlaceCard({
    Key? key,
    required this.slidablePlaceCardData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        final theme = context.uiKitTheme;

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            UiKitPhotoSlider(
              media: slidablePlaceCardData.media ?? [],
              width: size.maxWidth,
              height: 156.h,
            ),
            SpacingFoundation.verticalSpace12,
            Text(
              '${slidablePlaceCardData.title}',
              style: theme?.boldTextTheme.caption1Bold,
            ),
            SpacingFoundation.verticalSpace4,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (final placeTag in slidablePlaceCardData.placeTags ?? [])
                    UiKitTagWidget(
                      title: placeTag.name,
                      icon: placeTag.iconPath,
                    ).paddingOnly(right: 8.sp),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
