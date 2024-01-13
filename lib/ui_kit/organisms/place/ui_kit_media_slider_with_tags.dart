import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitMediaSliderWithTags extends StatelessWidget {
  final List<BaseUiKitMedia> media;
  final double? rating;
  final String description;
  final List<UiKitTag> baseTags;
  final List<UiKitTag> uniqueTags;
  final double horizontalMargin;
  final ScrollController scrollController;
  final List<HorizontalCaptionedImageData>? branches;
  final VoidCallback? onBranchTap;
  final List<Widget>? actions;

  UiKitMediaSliderWithTags({
    Key? key,
    required this.media,
    this.rating,
    ScrollController? scrollController,
    required this.baseTags,
    required this.uniqueTags,
    required this.description,
    this.horizontalMargin = 0,
    this.branches,
    this.actions,
    this.onBranchTap,
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
          width: 1.sw,
          child: Stack(
            children: [
              GestureDetector(
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
                  physics: const ClampingScrollPhysics(),
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
                ),
              ),
              if (actions != null && actions!.isNotEmpty)
                Positioned(
                  right: 16.w,
                  bottom: 0,
                  height: 0.1.sw,
                  width: 1.sw,
                  child: Wrap(
                    runSpacing:  SpacingFoundation.horizontalSpacing16,
                    spacing:  SpacingFoundation.horizontalSpacing16,
                    crossAxisAlignment: WrapCrossAlignment.end,
                    runAlignment: WrapAlignment.end,
                    alignment: WrapAlignment.end,
                    children: actions!
                    ,
                  ),
                ),
            ],
          ),
        ),
        SpacingFoundation.verticalSpace14,
        UiKitTagsWidget(
          rating: rating,
          baseTags: baseTags,
          uniqueTags: uniqueTags,
        ).paddingSymmetric(horizontal: horizontalMargin),
        SpacingFoundation.verticalSpace14,
        if (branches != null) ...[
          UiKitCardWrapper(
            borderRadius: BorderRadius.zero,
            color: context.uiKitTheme?.colorScheme.surface1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Branches',
                  style: context.uiKitTheme?.boldTextTheme.caption2Medium,
                ),
                SpacingFoundation.verticalSpace4,
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 0.28125.sw * 0.577),
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final branch = branches!.elementAt(index);

                      return UiKitHorizontalCaptionedImage(
                        title: branch.caption,
                        imageLink: branch.imageUrl,
                        borderRadius: BorderRadiusFoundation.all16,
                        onTap: onBranchTap,
                      );
                    },
                    separatorBuilder: (context, index) => SpacingFoundation.horizontalSpace16,
                    itemCount: branches!.length,
                  ),
                ),
              ],
            ).paddingOnly(
              top: EdgeInsetsFoundation.vertical12,
              bottom: EdgeInsetsFoundation.vertical12,
              left: EdgeInsetsFoundation.horizontal16,
            ),
          ),
          SpacingFoundation.verticalSpace14,
        ],
        RepaintBoundary(
            child: DescriptionWidget(description: description).paddingOnly(left: horizontalMargin, right: horizontalMargin)),
      ],
    );
  }
}
