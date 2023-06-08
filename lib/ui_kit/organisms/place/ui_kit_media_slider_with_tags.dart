import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitMediaSliderWithTags extends StatelessWidget {
  final List<BaseUiKitMedia> media;
  final double? rating;
  final String description;
  final List<UiKitTag> baseTags;
  final List<UiKitTag> uniqueTags;
  final double horizontalMargin;

  const UiKitMediaSliderWithTags({
    Key? key,
    required this.media,
    this.rating,
    required this.baseTags,
    required this.uniqueTags,
    required this.description,
    this.horizontalMargin = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 0.58.sw,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: media.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) return horizontalMargin.widthBox;
              final mediaItem = media.elementAt(index - 1);
              if (mediaItem.type == UiKitMediaType.video) return BaseUiKitMediaWidget.video(media: mediaItem);

              return BaseUiKitMediaWidget.image(media: mediaItem);
            },
            separatorBuilder: (context, index) => SpacingFoundation.horizontalSpace16,
          ),
        ),
        SpacingFoundation.verticalSpace12,
        UiKitTagsWidget(
          rating: rating,
          baseTags: baseTags,
          uniqueTags: uniqueTags,
        ).paddingSymmetric(horizontal: horizontalMargin),
        SpacingFoundation.verticalSpace12,
        Text(
          description,
          style: theme?.boldTextTheme.caption1Bold.copyWith(color: Colors.white),
        ).paddingOnly(left: horizontalMargin * 2, right: horizontalMargin),
      ],
    );
  }
}
