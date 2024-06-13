import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitMediaSliderWithTags extends StatefulWidget {
  final List<BaseUiKitMedia> media;
  final double? rating;
  final String description;
  final List<UiKitTag> baseTags;
  final List<UiKitTag> uniqueTags;
  final double horizontalMargin;
  final ScrollController scrollController;
  final Future<List<HorizontalCaptionedImageData>?>? branches;
  final List<Widget>? actions;
  final ScrollController? listViewController;

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
    this.listViewController,
  })  : scrollController = scrollController ?? ScrollController(),
        super(key: key);

  @override
  State<UiKitMediaSliderWithTags> createState() =>
      _UiKitMediaSliderWithTagsState();
}

class _UiKitMediaSliderWithTagsState extends State<UiKitMediaSliderWithTags> {
  late double scrollPosition;
  bool isHide = true;

  @override
  Widget build(BuildContext context) {
    final mediaWidth = kIsWeb ? 358.0 : (1.sw - widget.horizontalMargin * 2);

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
                    widget.scrollController.animateTo(
                        widget.scrollController.offset + 0.83.sw,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut);
                  } else if (widget.scrollController.offset < 1.sw / 2) {
                    widget.scrollController.animateTo(0,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut);
                  } else {
                    widget.scrollController.animateTo(
                        widget.scrollController.offset - 0.83.sw,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut);
                  }
                },
                child: ListView.separated(
                  controller: widget.scrollController,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  addAutomaticKeepAlives: false,
                  itemCount: widget.media.length,
                  padding: EdgeInsets.zero,
                  cacheExtent: 0.75.sw,
                  separatorBuilder: (context, index) =>
                      SpacingFoundation.horizontalSpace16,
                  itemBuilder: (context, index) {
                    final mediaItem = widget.media.elementAt(index);
                    if (mediaItem.type == UiKitMediaType.video) {
                      return BaseUiKitMediaWidget.video(
                        media: mediaItem,
                        width: widget.media.length == 1 ? mediaWidth : null,
                      ).paddingOnly(
                          left: index == 0 ? widget.horizontalMargin : 0);
                    }

                    return BaseUiKitMediaWidget.image(media: mediaItem)
                        .paddingOnly(
                            left: index == 0 ? widget.horizontalMargin : 0);
                  },
                ),
              ),
              if (widget.actions != null && widget.actions!.isNotEmpty)
                Positioned(
                  right: 16.w,
                  bottom: 0,
                  height: 0.1.sw,
                  width: 1.sw,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: widget.actions!.reversed.toList(),
                  ),
                ),
            ],
          ),
        ),
        SpacingFoundation.verticalSpace14,
        UiKitTagsWidget(
          rating: widget.rating,
          baseTags: widget.baseTags,
          uniqueTags: widget.uniqueTags,
        ).paddingSymmetric(horizontal: widget.horizontalMargin),
        SpacingFoundation.verticalSpace14,
        if (widget.branches != null)
          FutureBuilder(
              future: widget.branches,
              builder: (context, snapshot) => AnimatedSize(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      child: !snapshot.hasData || (snapshot.data ?? []).isEmpty
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
                                    style: context.uiKitTheme?.boldTextTheme
                                        .caption2Medium,
                                  ),
                                  SpacingFoundation.verticalSpace4,
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                        maxHeight: 0.28125.sw * 0.577),
                                    child: ListView.separated(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      addAutomaticKeepAlives: false,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        final branch =
                                            snapshot.data!.elementAt(index);

                                        return UiKitHorizontalCaptionedImage(
                                          title: branch.caption,
                                          imageLink: branch.imageUrl,
                                          borderRadius:
                                              BorderRadiusFoundation.all16,
                                          onTap: branch.onTap,
                                        );
                                      },
                                      separatorBuilder: (context, index) =>
                                          SpacingFoundation.horizontalSpace16,
                                      itemCount: snapshot.data!.length,
                                    ),
                                  ),
                                ],
                              ).paddingOnly(
                                top: EdgeInsetsFoundation.vertical12,
                                bottom: EdgeInsetsFoundation.vertical12,
                                left: EdgeInsetsFoundation.horizontal16,
                              ),
                            ))
                  .paddingOnly(bottom: SpacingFoundation.verticalSpacing14)),
        DescriptionWidget(
          isHide: isHide,
          onReadLess: () {
            setState(() {
              widget.listViewController
                  ?.animateTo(scrollPosition,
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.easeIn)
                  .then(
                (value) {
                  setState(() {
                    isHide = true;
                  });
                },
              );
            });
          },
          onReadMore: () {
            setState(() {
              isHide = false;
              scrollPosition = widget.listViewController?.position.pixels ?? 0;
            });
          },
          description: widget.description,
        ).paddingOnly(
          left: widget.horizontalMargin,
          right: widget.horizontalMargin,
        ),
      ],
    );
  }
}
