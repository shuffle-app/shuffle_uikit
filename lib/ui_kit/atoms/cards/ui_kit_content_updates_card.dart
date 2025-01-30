import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitContentUpdatesCard extends StatelessWidget {
  final List<UiKitContentUpdateWidget> children;
  final String authorSpeciality;
  final String authorName;
  final String authorUsername;
  final String authorAvatarUrl;
  final UserTileType authorUserType;
  final bool hasGradientBorder;
  final String? comment;
  final int? heartEyesReactionsCount;
  final int? likeReactionsCount;
  final int? fireReactionsCount;
  final int? sunglassesReactionsCount;
  final int? smileyReactionsCount;
  final ValueChanged<String>? onReactionsTapped;
  final VoidCallback? onLongPress;
  final VoidCallback? onSharePress;
  final ViewShareDate? viewShareDate;
  final ValueNotifier<bool>? showTranslateButton;
  final ValueNotifier<String>? translateText;

  late final ValueNotifier<String> description;
  late final ValueNotifier<bool> isTranslate;

  final bool isPinned;

  UiKitContentUpdatesCard({
    super.key,
    required this.children,
    required this.authorSpeciality,
    required this.authorName,
    required this.authorUsername,
    required this.authorAvatarUrl,
    required this.authorUserType,
    this.comment,
    this.hasGradientBorder = false,
    this.heartEyesReactionsCount,
    this.likeReactionsCount,
    this.fireReactionsCount,
    this.sunglassesReactionsCount,
    this.smileyReactionsCount,
    this.onReactionsTapped,
    this.onLongPress,
    this.onSharePress,
    this.viewShareDate,
    this.showTranslateButton,
    this.translateText,
    this.isPinned = false,
  }) {
    description = ValueNotifier<String>(comment ?? '');
    isTranslate = ValueNotifier<bool>(false);
  }

  factory UiKitContentUpdatesCard.fromShuffle({
    Key? key,
    required List<UiKitContentUpdateWidget> children,
    required String text,
    ValueChanged<String>? onReactionsTapped,
    VoidCallback? onLongPress,
    VoidCallback? onSharePress,
    int? heartEyesReactionsCount,
    int? likeReactionsCount,
    int? fireReactionsCount,
    int? sunglassesReactionsCount,
    int? smileyReactionsCount,
    ViewShareDate? viewShareDate,
    ValueNotifier<bool>? showTranslateButton,
    ValueNotifier<String>? translateText,
    bool isPinned = false,
  }) =>
      UiKitContentUpdatesCard(
        key: key,
        authorSpeciality: '',
        authorUserType: UserTileType.influencer,
        authorName: 'Shuffle',
        authorUsername: '',
        authorAvatarUrl: GraphicsFoundation.instance.png.avatars.avatar13.path,
        hasGradientBorder: true,
        comment: text,
        heartEyesReactionsCount: heartEyesReactionsCount,
        likeReactionsCount: likeReactionsCount,
        fireReactionsCount: fireReactionsCount,
        sunglassesReactionsCount: sunglassesReactionsCount,
        smileyReactionsCount: smileyReactionsCount,
        onReactionsTapped: onReactionsTapped,
        onLongPress: onLongPress,
        onSharePress: onSharePress,
        viewShareDate: viewShareDate,
        showTranslateButton: showTranslateButton,
        translateText: translateText,
        isPinned: isPinned,
        children: children,
      );

  bool get showEmptyReactionsState =>
      heartCount == 0 && likeCount == 0 && sunglassesCount == 0 && fireCount == 0 && smileyCount == 0;

  double overallHeight() {
    double additionalSpacingForComment = 0;
    double reactionsSpacing = 0;
    // double translateButtonSpacing = 0;

    if (hasGradientBorder && comment != null && comment!.isNotEmpty) {
      final linesCount = (comment!.length ~/ charactersPerLine) + comment!.split('\n').length;

      additionalSpacingForComment += linesCount * (kIsWeb ? 15 : 18.h);
    }
    // if (hasReactions) {
    reactionsSpacing += SpacingFoundation.verticalSpacing16 + SpacingFoundation.verticalSpacing24;
    // }
    // if (showTranslateButton != null && showTranslateButton!.value) {
    //   translateButtonSpacing += SpacingFoundation.verticalSpacing32;
    // }

    return children.fold(0.0, (previousValue, element) => previousValue + element.height) +
        ((children.length + 2) * SpacingFoundation.verticalSpacing24) +
        (kIsWeb ? 17 : 0.152.sw) +
        EdgeInsetsFoundation.vertical32 +
        reactionsSpacing +
        additionalSpacingForComment;
    // translateButtonSpacing;
  }

  int get heartCount => heartEyesReactionsCount ?? 0;

  int get likeCount => likeReactionsCount ?? 0;

  int get fireCount => fireReactionsCount ?? 0;

  int get sunglassesCount => sunglassesReactionsCount ?? 0;

  int get smileyCount => smileyReactionsCount ?? 0;

  int get charactersPerLine => 1.sw >= 380 ? 38 : 33;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final boldTextTheme = theme?.boldTextTheme;
    final regularTextTheme = theme?.regularTextTheme;
    final colorScheme = theme?.colorScheme;
    final reactionTextColor = colorScheme?.bodyTypography;
    final isLightTheme = theme?.themeMode == ThemeMode.light;

    bool isOverlayVisible = false;
    OverlayEntry? overlayEntry;

    void toggleTranslation() {
      isTranslate.value = !isTranslate.value;
      description.value = isTranslate.value ? (translateText?.value ?? comment ?? '') : comment ?? '';
    }

    final Widget _children = hasGradientBorder
        ? Column(
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
                        ).paddingOnly(right: onSharePress != null ? SpacingFoundation.horizontalSpacing20 : 0.0),
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
              if (hasGradientBorder && description.value.isNotEmpty)
                ValueListenableBuilder<String>(
                  valueListenable: description,
                  builder: (_, desc, __) => Text(
                    desc,
                    style: regularTextTheme?.caption2,
                    textAlign: TextAlign.start,
                  ).paddingOnly(top: EdgeInsetsFoundation.vertical16),
                ),
              if (children.isNotEmpty) ...[
                SpacingFoundation.verticalSpace4,
                ...children,
                SpacingFoundation.verticalSpace16
              ],
              SpacingFoundation.verticalSpace8,
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
          ).paddingAll(EdgeInsetsFoundation.all16)
        : Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              context.userTile(
                data: BaseUiKitUserTileData(
                  name: authorName,
                  username: authorUsername,
                  avatarUrl: authorAvatarUrl,
                  type: authorUserType,
                  noMaterialOverlay: true,
                ),
              ),
              SpacingFoundation.verticalSpace8,
              ...children,
              SpacingFoundation.verticalSpace16
            ],
          ).paddingAll(EdgeInsetsFoundation.all16);

    return GestureDetector(
      onLongPress: () {
        FeedbackIsolate.instance.addEvent(FeedbackIsolateHaptics(
          intensities: [130, 170],
          pattern: [10, 5],
        ));
        onLongPress?.call();
      },
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: kIsWeb ? 60 : 1.sw - EdgeInsetsFoundation.horizontal32,
          maxWidth: kIsWeb ? 90 : 1.sw,
          maxHeight: overallHeight(),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          // fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusFoundation.all24,
              clipBehavior: Clip.hardEdge,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: isLightTheme ? colorScheme?.surface2 : null,
                    gradient: isLightTheme ? null : GradientFoundation.shunyGreyGradientInverted,
                    borderRadius: BorderRadiusFoundation.all24,
                    border: hasGradientBorder ? GradientFoundation.touchIdgradientBorder : null,
                  ),
                  child: _children,
                ),
              ),
            ),
            if (authorSpeciality.isNotEmpty)
              Positioned(
                right: 0,
                bottom: -SpacingFoundation.verticalSpacing8,
                child: ClipRRect(
                  borderRadius: BorderRadiusFoundation.max,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                    child: ColoredBox(
                      color: isLightTheme ? ColorsFoundation.darkNeutral300 : ColorsFoundation.neutral16,
                      child: Text(
                        authorSpeciality,
                        style: boldTextTheme?.caption3Medium.copyWith(
                          color: isLightTheme ? colorScheme?.darkNeutral800 : colorScheme?.darkNeutral100,
                        ),
                      ).paddingSymmetric(
                        horizontal: EdgeInsetsFoundation.horizontal8,
                        vertical: EdgeInsetsFoundation.vertical4,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
