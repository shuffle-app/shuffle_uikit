import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_kit/atoms/cards/digest_content_card.dart';

class UiKitDigestCard extends StatefulWidget {
  final String? title;
  final String? underTitleText;
  final List<DigestUiModel>? digestUiModels;
  final VoidCallback? onReadTap;
  final ValueChanged<String>? onReactionsTapped;
  final ViewShareDate? viewShareDate;
  final VoidCallback? onSharePress;
  final int? heartEyesReactionsCount;
  final int? likeReactionsCount;
  final int? fireReactionsCount;
  final int? sunglassesReactionsCount;
  final int? smileyReactionsCount;

  final bool showTranslateButton;
  final Future<List<String>> Function()? onTranslateTap;

  final bool isPinned;

  const UiKitDigestCard({
    super.key,
    this.title,
    this.underTitleText,
    this.digestUiModels,
    this.onReadTap,
    this.heartEyesReactionsCount,
    this.likeReactionsCount,
    this.fireReactionsCount,
    this.sunglassesReactionsCount,
    this.smileyReactionsCount,
    this.onReactionsTapped,
    this.viewShareDate,
    this.showTranslateButton = false,
    this.onTranslateTap,
    this.isPinned = false,
    this.onSharePress,
  });

  @override
  State<UiKitDigestCard> createState() => _UiKitDigestCardState();
}

class _UiKitDigestCardState extends State<UiKitDigestCard> {
  final shufflePostVideoWidgetHeight = 0.16845.sw * 0.75;
  final shufflePostVideoWidgetWidth = 0.16845.sw;
  final playButtonSize = Size(32.w, 24.h);
  late final xOffset = shufflePostVideoWidgetWidth / 2 - playButtonSize.width / 2;
  late final yOffset = shufflePostVideoWidgetHeight / 2 - playButtonSize.height / 2;
  bool isTranslate = false;

  late final DigestUiModel? digestUiModel;
  late final List<String> translateListText;

  int get heartCount => widget.heartEyesReactionsCount ?? 0;

  int get likeCount => widget.likeReactionsCount ?? 0;

  int get fireCount => widget.fireReactionsCount ?? 0;

  int get sunglassesCount => widget.sunglassesReactionsCount ?? 0;

  int get smileyCount => widget.smileyReactionsCount ?? 0;

  bool get showEmptyReactionsState =>
      heartCount == 0 && likeCount == 0 && sunglassesCount == 0 && fireCount == 0 && smileyCount == 0;

  @override
  void initState() {
    digestUiModel =
        widget.digestUiModels != null && widget.digestUiModels!.isNotEmpty ? widget.digestUiModels![0] : null;
    translateListText = List.empty(growable: true);
    super.initState();
  }

  Future<void> toggleTranslation() async {
    if (isTranslate) {
      isTranslate = !isTranslate;
    } else {
      if (translateListText.isEmpty) {
        List<String>? translate = await widget.onTranslateTap?.call();

        if (translate != null && translate.isNotEmpty) translateListText.addAll(translate);
      }

      isTranslate = !isTranslate;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final boldTextTheme = theme?.boldTextTheme;
    final regularTextTheme = theme?.regularTextTheme;
    final colorScheme = theme?.colorScheme;
    final isLightTheme = theme?.themeMode == ThemeMode.light;
    final reactionTextColor = colorScheme?.bodyTypography;

    bool isOverlayVisible = false;
    OverlayEntry? overlayEntry;

    _children() {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: kIsWeb ? 90 : 1.sw,
            child: UiKitShuffleTile(
              trailing: Row(
                children: [
                  if (widget.isPinned && kIsWeb)
                    ImageWidget(
                      link: GraphicsFoundation.instance.svg.pinned.path,
                      height: 18,
                      width: 18,
                      fit: BoxFit.fill,
                      color: ColorsFoundation.mutedText,
                    ).paddingOnly(right: SpacingFoundation.horizontalSpacing20),
                  if (widget.onSharePress != null)
                    context.iconButtonNoPadding(
                      data: BaseUiKitButtonData(
                        onPressed: widget.onSharePress,
                        iconInfo: BaseUiKitButtonIconData(
                          iconData: ShuffleUiKitIcons.share,
                          color: colorScheme?.darkNeutral800,
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
          if (widget.title != null && widget.title!.isNotEmpty)
            Text(
              isTranslate && translateListText.isNotEmpty ? translateListText[0] : widget.title!,
              style: boldTextTheme?.caption1Bold,
              textAlign: TextAlign.start,
            ).paddingOnly(top: SpacingFoundation.verticalSpacing12),
          if (widget.underTitleText != null && widget.underTitleText!.isNotEmpty)
            Text(
              isTranslate && translateListText.length >= 2 ? translateListText[1] : widget.underTitleText!,
              style: regularTextTheme?.caption1,
              textAlign: TextAlign.start,
            ).paddingOnly(top: SpacingFoundation.verticalSpacing12),
          if (digestUiModel != null) ...[
            if (digestUiModel?.subTitle != null && digestUiModel!.subTitle!.isNotEmpty)
              Text(
                isTranslate && translateListText.length >= 3 ? translateListText[2] : digestUiModel!.subTitle!,
                style: boldTextTheme?.caption1Bold,
                textAlign: TextAlign.start,
              ).paddingOnly(top: SpacingFoundation.verticalSpacing12),
            if (digestUiModel?.placeId != null || digestUiModel?.eventId != null)
              UiKitCardWrapper(
                color: theme?.colorScheme.surface3,
                borderRadius: BorderRadiusFoundation.all16,
                padding: EdgeInsets.all(EdgeInsetsFoundation.all12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DigestContentCard(digestUiModel: digestUiModel),
                    if (digestUiModel?.contentDescription != null && digestUiModel!.contentDescription!.isNotEmpty)
                      Text(
                        isTranslate && translateListText.length >= 4
                            ? translateListText[3]
                            : digestUiModel!.contentDescription!,
                        style: regularTextTheme?.caption4Regular,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ).paddingOnly(top: SpacingFoundation.verticalSpacing12)
            else if (digestUiModel?.newPhotos != null && digestUiModel!.newPhotos!.isNotEmpty)
              UiKitStaggeredMediaRow(
                mediaList: digestUiModel!.newPhotos!,
                visibleMediaCount: 4,
              ).paddingOnly(top: SpacingFoundation.verticalSpacing12)
            else if (digestUiModel?.newVideos != null && digestUiModel!.newVideos!.isNotEmpty)
              UiKitCustomChildContentUpdateWidget(
                height: shufflePostVideoWidgetHeight,
                child: Row(
                  children: digestUiModel!.newVideos!.map(
                    (video) {
                      final isLast = digestUiModel!.newVideos!.last == video;

                      return SizedBox(
                        height: shufflePostVideoWidgetHeight,
                        child: UiKitMediaVideoWidget(
                          width: shufflePostVideoWidgetWidth,
                          playButtonCustomOffset: Offset(xOffset, yOffset),
                          media: video,
                          borderRadius: BorderRadiusFoundation.all8,
                        ).paddingOnly(right: isLast ? 0 : EdgeInsetsFoundation.horizontal16),
                      );
                    },
                  ).toList(),
                ),
              ).paddingOnly(top: SpacingFoundation.verticalSpacing12),
          ],
          if (digestUiModel?.description != null && digestUiModel!.description!.isNotEmpty)
            Text(
              isTranslate && translateListText.length >= 5 ? translateListText[4] : digestUiModel!.description!,
              style: regularTextTheme?.caption2,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ).paddingOnly(top: SpacingFoundation.verticalSpacing8),
          SpacingFoundation.verticalSpace12,
          GradientableWidget(
            gradient: GradientFoundation.buttonGradient,
            child: context.smallOutlinedButton(
              data: BaseUiKitButtonData(
                text: S.of(context).Read(''),
                onPressed: widget.onReadTap,
              ),
            ),
          ),
          SpacingFoundation.verticalSpace12,
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: toggleTranslation,
                child: widget.showTranslateButton
                    ? Text(
                        isTranslate ? S.of(context).Original : S.of(context).Translate,
                        style: regularTextTheme?.caption4Semibold,
                      )
                    : const SizedBox.shrink(),
              ),
              showEmptyReactionsState
                  ? Builder(
                      builder: (c) => TapRegion(
                        behavior: HitTestBehavior.opaque,
                        onTapInside: (value) {
                          if (widget.onReactionsTapped != null) {
                            isOverlayVisible
                                ? hideReactionOverlay(overlayEntry)
                                : showReactionOverlay(
                                    c,
                                    overlayEntry,
                                    reactionTextColor,
                                    widget.onReactionsTapped,
                                  );
                            isOverlayVisible = !isOverlayVisible;
                          }
                        },
                        onTapOutside: (event) {
                          isOverlayVisible = false;
                          hideReactionOverlay(overlayEntry);
                        },
                        child: ImageWidget(
                          iconData: ShuffleUiKitIcons.thumbup,
                          color: colorScheme?.inversePrimary,
                        ),
                      ),
                    )
                  : Builder(
                      builder: (c) => TapRegion(
                        behavior: HitTestBehavior.opaque,
                        onTapInside: (value) {
                          if (widget.onReactionsTapped != null) {
                            isOverlayVisible
                                ? hideReactionOverlay(overlayEntry)
                                : showReactionOverlay(
                                    c,
                                    overlayEntry,
                                    reactionTextColor,
                                    widget.onReactionsTapped,
                                  );
                            isOverlayVisible = !isOverlayVisible;
                          }
                        },
                        onTapOutside: (event) {
                          isOverlayVisible = false;
                          hideReactionOverlay(overlayEntry);
                        },
                        child: Row(
                          children: [
                            if (heartCount != 0)
                              UiKitHeartEyesReaction(
                                reactionsCount: heartCount,
                                textColor: reactionTextColor,
                              ),
                            if (likeCount != 0) ...[
                              SpacingFoundation.horizontalSpace4,
                              UiKitLikeReaction(
                                reactionsCount: likeCount,
                                textColor: reactionTextColor,
                              )
                            ],
                            if (fireCount != 0) ...[
                              SpacingFoundation.horizontalSpace4,
                              UiKitFireReaction(
                                reactionsCount: fireCount,
                                textColor: reactionTextColor,
                              )
                            ],
                            if (sunglassesCount != 0) ...[
                              SpacingFoundation.horizontalSpace4,
                              UiKitSunglassesReaction(
                                reactionsCount: sunglassesCount,
                                textColor: reactionTextColor,
                              )
                            ],
                            if (smileyCount != 0) ...[
                              SpacingFoundation.horizontalSpace4,
                              UiKitSmileyReaction(
                                reactionsCount: smileyCount,
                                textColor: reactionTextColor,
                              )
                            ],
                          ],
                        ),
                      ),
                    ),
            ],
          ),
          if (widget.viewShareDate != null)
            UiKitViewShareDateWidget(viewShareDate: widget.viewShareDate!)
                .paddingOnly(top: SpacingFoundation.verticalSpacing16),
        ],
      ).paddingAll(EdgeInsetsFoundation.all16);
    }

    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: kIsWeb ? 60 : 1.sw - EdgeInsetsFoundation.horizontal32,
        maxWidth: kIsWeb ? 90 : 1.sw,
      ),
      child: ClipRRect(
        borderRadius: BorderRadiusFoundation.all24,
        clipBehavior: Clip.hardEdge,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: isLightTheme ? colorScheme?.surface2 : null,
              gradient: isLightTheme ? null : GradientFoundation.digestCardGradient,
              borderRadius: BorderRadiusFoundation.all24,
              border: GradientFoundation.touchIdgradientBorder,
            ),
            child: _children(),
          ),
        ),
      ),
    );
  }
}
