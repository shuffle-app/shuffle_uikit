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
  final Future<String?> Function()? onCreateBranchesTap;
  final Future<String?> Function()? onRenameTap;
  final String? branchName;
  final Future<String?> Function(int)? removeBranchItem;
  final bool showBranches;
  final ValueChanged<IconData>? onTagTap;

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
    this.onCreateBranchesTap,
    this.onRenameTap,
    this.branchName,
    this.removeBranchItem,
    this.showBranches = false,
    this.onTagTap,
  }) : scrollController = scrollController ?? ScrollController();

  @override
  State<UiKitMediaSliderWithTags> createState() => _UiKitMediaSliderWithTagsState();
}

class _UiKitMediaSliderWithTagsState extends State<UiKitMediaSliderWithTags> {
  final double plusIconSize = kIsWeb ? 30 : 30.w;
  late String? currentBranchName;
  late double scrollPosition;
  late bool isHide;

  bool isTranslate = false;
  bool _showBranches = false;
  List<HorizontalCaptionedImageData>? branches;
  String currentDescription = '';

  @override
  void initState() {
    isHide = widget.initialDescriptionHide ?? true;
    currentDescription = widget.description;
    branches = widget.branches?.value;
    currentBranchName = widget.branchName;
    if (branches != null && branches!.isNotEmpty) {
      _showBranches = true;
    } else {
      _showBranches = widget.showBranches;
    }
    super.initState();
    widget.branches != null ? widget.branches?.addListener(onLoadBranches) : _showBranches = widget.showBranches;
  }

  onLoadBranches() {
    branches = widget.branches?.value;
    if (branches != null && branches!.isNotEmpty) {
      _showBranches = true;
    } else {
      _showBranches = widget.showBranches;
    }
    if (mounted) setState(() {});
  }

  renameBranch(String? branchName) {
    if (branchName != null && branchName.isNotEmpty) {
      setState(() {
        currentBranchName = branchName;
      });
    }
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
          onTagTap: widget.onTagTap,
        ).paddingSymmetric(horizontal: widget.horizontalMargin),
        SpacingFoundation.verticalSpace14,
        AnimatedSize(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                child: !_showBranches
                    ? const SizedBox.shrink()
                    : SizedBox(
                        height: 0.28125.sw * 0.577 + (1.sw <= 380 ? 45.h : 38.h),
                        child: UiKitCardWrapper(
                          borderRadius: BorderRadius.zero,
                          color: theme?.colorScheme.surface1,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    widget.showBranches
                                        ? (currentBranchName ?? S.of(context).Branches)
                                        : S.of(context).Branches,
                                    style: theme?.boldTextTheme.caption2Medium,
                                  ),
                                  Spacer(),
                                  if (currentBranchName != null && currentBranchName!.isNotEmpty && widget.showBranches)
                                    InkWell(
                                      onTap: () async {
                                        final upcomingBranchName = await widget.onRenameTap?.call();
                                        renameBranch(upcomingBranchName);
                                      },
                                      child: ImageWidget(
                                        svgAsset: GraphicsFoundation.instance.svg.pencil,
                                        color: Colors.white,
                                        width: 18.w,
                                        height: 18.w,
                                        fit: BoxFit.contain,
                                      ),
                                    ).paddingOnly(right: SpacingFoundation.horizontalSpacing16),
                                ],
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
                                    if (index == 0 && widget.showBranches) {
                                      return context.badgeButtonNoValue(
                                        data: BaseUiKitButtonData(
                                          onPressed: () async {
                                            final upcomingBranchName = await widget.onCreateBranchesTap?.call();
                                            renameBranch(upcomingBranchName);
                                          },
                                          iconWidget: DecoratedBox(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              border: Border.fromBorderSide(
                                                BorderSide(
                                                  color: ColorsFoundation.neutral40,
                                                  width: 2,
                                                ),
                                              ),
                                              borderRadius: BorderRadiusFoundation.all12,
                                            ),
                                            child: GradientableWidget(
                                              gradient: GradientFoundation.defaultLinearGradient,
                                              child: ImageWidget(
                                                iconData: ShuffleUiKitIcons.plus,
                                                height: plusIconSize,
                                                width: plusIconSize,
                                              ),
                                            ).paddingSymmetric(horizontal: SpacingFoundation.horizontalSpacing12),
                                          ),
                                        ),
                                      );
                                    }

                                    final branch = branches!.elementAt(index - (widget.showBranches ? 1 : 0));

                                    return GestureDetector(
                                      onLongPress: () {
                                        if (widget.showBranches) {
                                          setState(() {
                                            branch.isSelected = !branch.isSelected;
                                          });
                                        }
                                      },
                                      child: Stack(
                                        children: [
                                          UiKitHorizontalCaptionedImage(
                                            title: branch.caption,
                                            imageLink: branch.imageUrl,
                                            borderRadius: BorderRadiusFoundation.all16,
                                            onTap: branch.isSelected ? null : branch.onTap,
                                          ),
                                          if (branch.isSelected)
                                            SizedBox(
                                              width: kIsWeb ? 90 : 0.28125.sw,
                                              height: kIsWeb ? 52 : (0.28125.sw * 0.577),
                                              child: Center(
                                                child: TapRegion(
                                                  onTapInside: (_) async {
                                                    if (widget.showBranches) {
                                                      currentBranchName =
                                                          await widget.removeBranchItem?.call(branch.placeId);
                                                      branch.isSelected = false;

                                                      setState(() {});
                                                    }
                                                  },
                                                  onTapOutside: (_) {
                                                    if (widget.showBranches) {
                                                      setState(() {
                                                        branch.isSelected = false;
                                                      });
                                                    }
                                                  },
                                                  child: ImageWidget(
                                                    iconData: ShuffleUiKitIcons.unlink,
                                                    color: Colors.white.withValues(alpha: 0.7),
                                                    width: 42.w,
                                                    height: 42.w,
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) => SpacingFoundation.horizontalSpace16,
                                  itemCount: (branches?.length ?? 0) + (widget.showBranches ? 1 : 0),
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
