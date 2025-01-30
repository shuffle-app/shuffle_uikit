import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_kit/atoms/cards/digest_content_card.dart';

class UiKitDigestCard extends StatelessWidget {
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

  final ValueNotifier<bool>? showTranslateButton;
  final ValueNotifier<String>? titleTranslateText;
  final ValueNotifier<String>? underTitleTranslateText;

  late final ValueNotifier<String> titleNotifier;
  late final ValueNotifier<String> underTitleNotifier;
  late final ValueNotifier<bool> isTranslate;

  late final DigestUiModel? digestUiModel;

  final bool isPinned;

  UiKitDigestCard({
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
    this.showTranslateButton,
    this.titleTranslateText,
    this.underTitleTranslateText,
    this.isPinned = false,
    this.onSharePress,
  }) {
    digestUiModel = digestUiModels != null && digestUiModels!.isNotEmpty ? digestUiModels![0] : null;

    titleNotifier = ValueNotifier<String>(title ?? '');
    underTitleNotifier = ValueNotifier<String>(underTitleText ?? '');

    isTranslate = ValueNotifier<bool>(false);
  }

  int get heartCount => heartEyesReactionsCount ?? 0;

  int get likeCount => likeReactionsCount ?? 0;

  int get fireCount => fireReactionsCount ?? 0;

  int get sunglassesCount => sunglassesReactionsCount ?? 0;

  int get smileyCount => smileyReactionsCount ?? 0;

  bool get showEmptyReactionsState =>
      heartCount == 0 && likeCount == 0 && sunglassesCount == 0 && fireCount == 0 && smileyCount == 0;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final boldTextTheme = theme?.boldTextTheme;
    final regularTextTheme = theme?.regularTextTheme;
    final colorScheme = theme?.colorScheme;
    final isLightTheme = theme?.themeMode == ThemeMode.light;
    final reactionTextColor = colorScheme?.bodyTypography;

    final shufflePostVideoWidgetHeight = 0.16845.sw * 0.75;
    final shufflePostVideoWidgetWidth = 0.16845.sw;
    final playButtonSize = Size(32.w, 24.h);
    final xOffset = shufflePostVideoWidgetWidth / 2 - playButtonSize.width / 2;
    final yOffset = shufflePostVideoWidgetHeight / 2 - playButtonSize.height / 2;

    bool isOverlayVisible = false;
    OverlayEntry? overlayEntry;

    void toggleTranslation() {
      isTranslate.value = !isTranslate.value;

      ///Translate in publication
      titleNotifier.value = isTranslate.value ? (titleTranslateText?.value ?? title ?? '') : title ?? '';
      underTitleNotifier.value =
          isTranslate.value ? (underTitleTranslateText?.value ?? underTitleText ?? '') : underTitleText ?? '';

      ///Translate in content card
      digestUiModel?.contentDescriptionNotifier?.value = isTranslate.value
          ? (digestUiModel?.contentDescriptionTranslate?.value ?? digestUiModel?.contentDescription ?? '')
          : digestUiModel?.contentDescription ?? '';

      digestUiModel?.descriptionNotifier?.value = isTranslate.value
          ? (digestUiModel?.descriptionTranslate?.value ?? digestUiModel?.description ?? '')
          : digestUiModel?.description ?? '';

      digestUiModel?.subTitleNotifier?.value = isTranslate.value
          ? (digestUiModel?.subTitleTranslate?.value ?? digestUiModel?.subTitle ?? '')
          : digestUiModel?.subTitle ?? '';
    }

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
                  if (isPinned && kIsWeb)
                    ImageWidget(
                      link: GraphicsFoundation.instance.svg.pinned.path,
                      height: 18,
                      width: 18,
                      fit: BoxFit.fill,
                      color: ColorsFoundation.mutedText,
                    ).paddingOnly(right: SpacingFoundation.horizontalSpacing20),
                  if (onSharePress != null)
                    context.iconButtonNoPadding(
                      data: BaseUiKitButtonData(
                        onPressed: onSharePress,
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
          if (title != null && title!.isNotEmpty)
            ValueListenableBuilder<String>(
              valueListenable: titleNotifier,
              builder: (_, title, __) => Text(
                title,
                style: boldTextTheme?.caption1Bold,
                textAlign: TextAlign.start,
              ).paddingOnly(top: SpacingFoundation.verticalSpacing12),
            ),
          if (underTitleText != null && underTitleText!.isNotEmpty)
            ValueListenableBuilder<String>(
              valueListenable: underTitleNotifier,
              builder: (_, underTitleText, __) => Text(
                underTitleText,
                style: regularTextTheme?.caption1,
                textAlign: TextAlign.start,
              ).paddingOnly(top: SpacingFoundation.verticalSpacing12),
            ),
          if (digestUiModel != null) ...[
            if (digestUiModel?.subTitle != null && digestUiModel!.subTitle!.isNotEmpty)
              ValueListenableBuilder<String>(
                valueListenable: digestUiModel!.subTitleNotifier!,
                builder: (_, subtitle, __) => Text(
                  subtitle,
                  style: boldTextTheme?.caption1Bold,
                  textAlign: TextAlign.start,
                ),
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
                    if (digestUiModel?.contentDescriptionNotifier != null &&
                        digestUiModel!.contentDescriptionNotifier!.value.isNotEmpty)
                      ValueListenableBuilder<String>(
                        valueListenable: digestUiModel!.contentDescriptionNotifier!,
                        builder: (_, contentDescriptionTranslate, __) => Text(
                          contentDescriptionTranslate,
                          style: regularTextTheme?.caption4Regular,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
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
          if (digestUiModel?.descriptionNotifier != null && digestUiModel!.descriptionNotifier!.value.isNotEmpty)
            ValueListenableBuilder<String>(
              valueListenable: digestUiModel!.descriptionNotifier!,
              builder: (_, underTitleText, __) => Text(
                underTitleText,
                style: regularTextTheme?.caption2,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ).paddingOnly(top: SpacingFoundation.verticalSpacing8),
            ),
          SpacingFoundation.verticalSpace12,
          GradientableWidget(
            gradient: GradientFoundation.buttonGradient,
            child: context.smallOutlinedButton(
              data: BaseUiKitButtonData(
                text: S.of(context).Read(''),
                onPressed: onReadTap,
              ),
            ),
          ),
          SpacingFoundation.verticalSpace12,
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (showTranslateButton != null)
                ValueListenableBuilder<bool>(
                  valueListenable: isTranslate,
                  builder: (_, isTranslating, __) => InkWell(
                    onTap: toggleTranslation,
                    child: showTranslateButton!.value
                        ? Text(
                            isTranslating ? S.of(context).Original : S.of(context).Translate,
                            style: regularTextTheme?.caption4Semibold,
                          )
                        : const SizedBox.shrink(),
                  ),
                ),
              showEmptyReactionsState
                  ? Builder(
                      builder: (c) => TapRegion(
                        behavior: HitTestBehavior.opaque,
                        onTapInside: (value) {
                          if (onReactionsTapped != null) {
                            isOverlayVisible
                                ? hideReactionOverlay(overlayEntry)
                                : showReactionOverlay(
                                    c,
                                    overlayEntry,
                                    reactionTextColor,
                                    onReactionsTapped,
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
                          if (onReactionsTapped != null) {
                            isOverlayVisible
                                ? hideReactionOverlay(overlayEntry)
                                : showReactionOverlay(
                                    c,
                                    overlayEntry,
                                    reactionTextColor,
                                    onReactionsTapped,
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
          if (viewShareDate != null)
            UiKitViewShareDateWidget(viewShareDate: viewShareDate!)
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
