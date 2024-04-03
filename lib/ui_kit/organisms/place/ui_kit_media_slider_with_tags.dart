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
  final Future<List<HorizontalCaptionedImageData>?>? branches;
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
                child: ListView.separated(
                  controller: scrollController,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  addAutomaticKeepAlives: false,
                  itemCount: media.length,
                  padding: EdgeInsets.zero,
                  cacheExtent: 0.75.sw,
                  separatorBuilder: (context, index) => SpacingFoundation.horizontalSpace16,
                  itemBuilder: (context, index) {
                    final mediaItem = media.elementAt(index);
                    if (mediaItem.type == UiKitMediaType.video) {
                      return BaseUiKitMediaWidget.video(
                        media: mediaItem,
                        width: media.length == 1 ? mediaWidth : null,
                      ).paddingOnly(left: index == 0 ? horizontalMargin : 0);
                    }

                    return BaseUiKitMediaWidget.image(media: mediaItem)
                        .paddingOnly(left: index == 0 ? horizontalMargin : 0);
                  },
                ),
              ),
              if (actions != null && actions!.isNotEmpty)
                Positioned(
                  right: 16.w,
                  bottom: 0,
                  height: 0.1.sw,
                  width: 1.sw,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: actions!.reversed.toList(),
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
        if (branches != null)
          FutureBuilder(
              future: branches,
              builder: (context, snapshot) => !snapshot.hasData || (snapshot.data ?? []).isEmpty
                  ? const SizedBox.shrink()
                  : UiKitCardWrapper(
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
                              addAutomaticKeepAlives: false,scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final branch = snapshot.data!.elementAt(index);

                                return UiKitHorizontalCaptionedImage(
                                  title: branch.caption,
                                  imageLink: branch.imageUrl,
                                  borderRadius: BorderRadiusFoundation.all16,
                                  onTap: branch.onTap,
                                );
                              },
                              separatorBuilder: (context, index) => SpacingFoundation.horizontalSpace16,
                              itemCount: snapshot.data!.length,
                            ),
                          ),
                        ],
                      ).paddingOnly(
                        top: EdgeInsetsFoundation.vertical12,
                        bottom: EdgeInsetsFoundation.vertical12,
                        left: EdgeInsetsFoundation.horizontal16,
                      ),
                    )).paddingOnly(bottom: SpacingFoundation.verticalSpacing14),
        DescriptionWidget(
          description: description,
        ).paddingOnly(
          left: horizontalMargin,
          right: horizontalMargin,
        ),
      ],
    );
  }
}
