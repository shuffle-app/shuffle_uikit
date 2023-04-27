import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_kit/molecules/place/place_stats.dart';

class PlaceInfo extends StatelessWidget {
  final UiKitPlace place;

  const PlaceInfo({
    Key? key,
    required this.place,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 155.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: place.media.length,
            itemBuilder: (context, index) {
              final media = place.media[index];
              if (media.type == UiKitMediaType.video) return MediaWidget.video(media: media);
              return MediaWidget.image(media: media);
            },
            separatorBuilder: (context, index) => SpacingFoundation.horizontalSpace16,
          ),
        ),
        SpacingFoundation.verticalSpace12,
        PlaceStats(
          rating: place.rating,
          tags: place.tags,
        ),
        SpacingFoundation.verticalSpace12,
        Text(
          place.description,
          style: theme?.boldTextTheme.caption1.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
