import 'package:flutter/material.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 0.48.sw,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: media.length + 1,
            addRepaintBoundaries: false,
            itemBuilder: (context, index) {
              if (index == 0) return horizontalMargin.widthBox;
              final mediaItem = media.elementAt(index - 1);
              if (mediaItem.type == UiKitMediaType.video) {
                return BaseUiKitMediaWidget.video(
                  media: mediaItem,
                  width: media.length == 1 ? 1.sw : null,
                );
              }

              return BaseUiKitMediaWidget.image(media: mediaItem, width: media.length == 1 ? 1.sw : null);
            },
            separatorBuilder: (context, index) => index == 0 ? const SizedBox.shrink() : SpacingFoundation.horizontalSpace16,
          ),
        ),
        SpacingFoundation.verticalSpace14,
        UiKitTagsWidget(
          rating: rating,
          baseTags: baseTags,
          uniqueTags: uniqueTags,
        ).paddingSymmetric(horizontal: horizontalMargin),
        SpacingFoundation.verticalSpace14,
        DescriptionWidget(description: description).paddingOnly(left: horizontalMargin, right: horizontalMargin),
      ],
    );
  }
}
