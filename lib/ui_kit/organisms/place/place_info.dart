import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class PlaceInfo extends StatelessWidget {
  final List<UiKitMedia> media;
  final double? rating;
  final String description;
  final List<UiKitTag> tags;

  const PlaceInfo({
    Key? key,
    required this.media,
    this.rating,
    required this.tags,
    required this.description,
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
            itemCount: media.length,
            itemBuilder: (context, index) {
              final mediaItem = media[index];
              if (mediaItem.type == UiKitMediaType.video) return UiKitMediaWidget.video(media: mediaItem);
              return UiKitMediaWidget.image(media: mediaItem);
            },
            separatorBuilder: (context, index) => SpacingFoundation.horizontalSpace16,
          ),
        ),
        SpacingFoundation.verticalSpace12,
        PlaceStats(
          rating: rating,
          tags: tags,
        ),
        SpacingFoundation.verticalSpace12,
        Text(
          description,
          style: theme?.boldTextTheme.caption1Bold.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
