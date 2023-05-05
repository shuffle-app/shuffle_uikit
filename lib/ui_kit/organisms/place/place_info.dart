import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitMediaSliderWithTags extends StatelessWidget {
  final List<UiKitMediaPhoto> photos;
  final List<UiKitMediaVideo> videos;
  final double? rating;
  final String description;
  final List<UiKitTag> baseTags;
  final List<UiKitTag> uniqueTags;

  const UiKitMediaSliderWithTags({
    Key? key,
    required this.photos,
    required this.videos,
    this.rating,
    required this.baseTags,
    required this.uniqueTags,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final media = [...videos, ...photos];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 155.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: media.length,
            itemBuilder: (context, index) {
              final mediaItem = media.elementAt(index);
              if (mediaItem.type == UiKitMediaType.video) return UiKitMediaWidget.video(media: mediaItem);
              return UiKitMediaWidget.image(media: mediaItem);
            },
            separatorBuilder: (context, index) => SpacingFoundation.horizontalSpace16,
          ),
        ),
        SpacingFoundation.verticalSpace12,
        UiKitTagsWidget(
          rating: rating,
          baseTags: baseTags,
          uniqueTags: uniqueTags,
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
