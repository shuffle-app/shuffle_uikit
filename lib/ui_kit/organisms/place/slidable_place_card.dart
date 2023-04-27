import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_kit/atoms/profile/place_tag_widget.dart';
import 'package:shuffle_uikit/ui_kit/molecules/place/ui_kit_photo_slider.dart';

class SlidablePlaceCard extends StatelessWidget {
  final SlidablePlaceCardData slidablePlaceCardData;

  const SlidablePlaceCard({
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
              media: slidablePlaceCardData.media,
              width: size.maxWidth,
              height: 156.h,
            ),
            SpacingFoundation.verticalSpace12,
            Text(
              slidablePlaceCardData.title,
              style: theme?.boldTextTheme.caption1.copyWith(color: Colors.white),
            ),
            SpacingFoundation.verticalSpace4,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (final placeTag in slidablePlaceCardData.placeTags)
                    PlaceTagWidget(
                      title: placeTag.title,
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
