import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitMediaSliderWithTags extends StatelessWidget {
  final List<BaseUiKitMedia> media;
  final double? rating;
  final String description;
  final List<UiKitTag> baseTags;
  final List<UiKitTag> uniqueTags;
  final TimeOfDay? openTo;
  final TimeOfDay? openFrom;
  final double horizontalMargin;
  final ScrollController scrollController;

  UiKitMediaSliderWithTags({
    Key? key,
    required this.media,
    this.rating,
    ScrollController? scrollController,
    required this.baseTags,
    required this.uniqueTags,
    required this.description,
    this.horizontalMargin = 0,
    this.openTo,
    this.openFrom,
  })  : scrollController = scrollController ?? ScrollController(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaWidth = kIsWeb ? 358.0 : (1.sw - horizontalMargin * 2);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            height: kIsWeb ? 156 : 0.48.sw,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTapUp: (TapUpDetails details) {
                if (details.globalPosition.dx > 1.sw / 2) {
                  scrollController.animateTo(scrollController.offset + 0.83.sw,
                      duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
                } else if (scrollController.offset < 1.sw / 2) {
                  scrollController.animateTo(0, duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
                } else {
                  scrollController.animateTo(scrollController.offset - 0.83.sw,
                      duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
                }
              },
              child: ListView.builder(
                controller: scrollController,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                addAutomaticKeepAlives: false,
                itemCount: media.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) return horizontalMargin.widthBox;

                  final mediaItem = media.elementAt(index - 1);
                  if (mediaItem.type == UiKitMediaType.video) {
                    return BaseUiKitMediaWidget.video(
                      media: mediaItem,
                      width: media.length == 1 ? mediaWidth : null,
                    ).paddingOnly(right: media.length == index ? 0 : SpacingFoundation.horizontalSpacing16);
                  }

                  return BaseUiKitMediaWidget.image(media: mediaItem, width: media.length == 1 ? mediaWidth : null)
                      .paddingOnly(right: media.length == index ? 0 : SpacingFoundation.horizontalSpacing16);
                },
                // separatorBuilder: (context, index) => index == 0
                //     ? const SizedBox.shrink()
                //     : SpacingFoundation.horizontalSpace16,
              ),
            )),
        SpacingFoundation.verticalSpace14,
        UiKitTagsWidget(
          rating: rating,
          baseTags: baseTags,
          uniqueTags: uniqueTags,
          openTo: openTo,
          openFrom: openFrom,
        ).paddingSymmetric(horizontal: horizontalMargin),
        SpacingFoundation.verticalSpace14,
        RepaintBoundary(
            child: DescriptionWidget(description: description)
                .paddingOnly(left: horizontalMargin, right: horizontalMargin)),
      ],
    );
  }
}
