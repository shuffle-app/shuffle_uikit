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
  final ValueNotifier<List<HorizontalCaptionedImageData>?>? branches;
  final List<Widget>? actions;
  final ScrollController? listViewController;
  final bool? initialDescriptionHide;
  final ValueNotifier<String?>? translateDescription;
  final ValueNotifier<bool>? showTranslateButton;
  final ValueChanged<int>? onImageTap;

  UiKitMediaSliderWithTags({
    super.key,
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
    this.initialDescriptionHide,
    this.showTranslateButton,
    this.translateDescription,
    this.onImageTap,
  }) : scrollController = scrollController ?? ScrollController();

  @override
  State<UiKitMediaSliderWithTags> createState() => _UiKitMediaSliderWithTagsState();
}

class _UiKitMediaSliderWithTagsState extends State<UiKitMediaSliderWithTags> {
  late double scrollPosition;

  late bool isHide;
  bool isTranslate = false;

  List<HorizontalCaptionedImageData>? branches;

  String currentDescription = '';

  @override
  void initState() {
    isHide = widget.initialDescriptionHide ?? true;
    currentDescription = widget.description;
    branches = widget.branches?.value;
    super.initState();
    widget.branches?.addListener(onLoadBranches);
  }

  onLoadBranches() {
    branches = widget.branches?.value;
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    widget.branches?.removeListener(onLoadBranches);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
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
                    widget.scrollController.animateTo(widget.scrollController.offset + 0.83.sw,
                        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
                  } else if (widget.scrollController.offset < 1.sw / 2) {
                    widget.scrollController
                        .animateTo(0, duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
                  } else {
                    widget.scrollController.animateTo(widget.scrollController.offset - 0.83.sw,
                        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
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
                  separatorBuilder: (context, index) => SpacingFoundation.horizontalSpace16,
                  itemBuilder: (context, index) {
                    final mediaItem = widget.media.elementAt(index);
                    final heroTag = '${mediaItem.link}--$index';

                    if (mediaItem.type == UiKitMediaType.video) {
                      return BaseUiKitMediaWidget.video(
                        media: mediaItem,
                        width: widget.media.length == 1 ? mediaWidth : null,
                      ).paddingOnly(left: index == 0 ? widget.horizontalMargin : 0);
                    }

                    return GestureDetector(
                      onTap: () => widget.onImageTap?.call(index),
                      child: Hero(
                        tag: heroTag,
                        transitionOnUserGestures: true,
                        child: BaseUiKitMediaWidget.image(media: mediaItem)
                            .paddingOnly(left: index == 0 ? widget.horizontalMargin : 0),
                      ),
                    );
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
        AnimatedSize(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                child: (branches ?? []).isEmpty
                    ? const SizedBox.shrink()
                    : SizedBox(
                        height: 0.28125.sw * 0.577 + 38.h,
                        child: UiKitCardWrapper(
                          borderRadius: BorderRadius.zero,
                          color: theme?.colorScheme.surface1,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                S.of(context).Branches,
                                style: theme?.boldTextTheme.caption2Medium,
                              ),
                              SpacingFoundation.verticalSpace4,
                              ConstrainedBox(
                                constraints: BoxConstraints(maxHeight: 0.28125.sw * 0.577),
                                child: ListView.separated(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  addAutomaticKeepAlives: false,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    final branch = branches!.elementAt(index);

                                    return UiKitHorizontalCaptionedImage(
                                      title: branch.caption,
                                      imageLink: branch.imageUrl,
                                      borderRadius: BorderRadiusFoundation.all16,
                                      onTap: branch.onTap,
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
                        )))
            .paddingOnly(bottom: SpacingFoundation.verticalSpacing14),
        DescriptionWidget(
          isTranslate: isTranslate,
          isHide: isHide,
          onReadLess: () {
            setState(() {
              widget.listViewController
                  ?.animateTo(scrollPosition, duration: const Duration(milliseconds: 100), curve: Curves.easeIn)
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
          description: currentDescription,
          onTranslateTap: () {
            setState(() {
              isTranslate = !isTranslate;
              currentDescription = (isTranslate &&
                      widget.translateDescription?.value != null &&
                      widget.translateDescription!.value!.isNotEmpty)
                  ? widget.translateDescription!.value!
                  : widget.description;
            });
          },
          showTranslateButton: widget.showTranslateButton,
        ).paddingOnly(
          left: widget.horizontalMargin,
          right: widget.horizontalMargin,
        ),
      ],
    );
  }
}
