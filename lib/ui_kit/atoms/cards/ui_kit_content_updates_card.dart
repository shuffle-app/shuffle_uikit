import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitContentUpdatesCard extends StatefulWidget {
  final List<UiKitContentUpdateWidget> children;
  final String authorSpeciality;
  final String authorName;
  final String authorUsername;
  final String authorAvatarUrl;
  final UserTileType authorUserType;
  final bool hasGradientBorder;
  final String? comment;
  final bool hasReactions;
  final int? heartEyesReactionsCount;
  final int? likeReactionsCount;
  final int? fireReactionsCount;
  final int? sunglassesReactionsCount;
  final int? smileyReactionsCount;
  final ValueChanged<String>? onReactionsTapped;
  final VoidCallback? onLongPress;
  final VoidCallback? onSharePress;
  final String createdAt;
  final ValueNotifier<bool>? showTranslateButton;
  final ValueNotifier<String>? translateText;

  const UiKitContentUpdatesCard({
    super.key,
    required this.children,
    required this.authorSpeciality,
    required this.authorName,
    required this.authorUsername,
    required this.authorAvatarUrl,
    required this.authorUserType,
    this.comment,
    this.hasGradientBorder = false,
    this.hasReactions = false,
    this.heartEyesReactionsCount,
    this.likeReactionsCount,
    this.fireReactionsCount,
    this.sunglassesReactionsCount,
    this.smileyReactionsCount,
    this.onReactionsTapped,
    this.onLongPress,
    this.onSharePress,
    this.createdAt = '',
    this.showTranslateButton,
    this.translateText,
  });

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
    String? createdAt,
    ValueNotifier<bool>? showTranslateButton,
    ValueNotifier<String>? translateText,
  }) =>
      UiKitContentUpdatesCard(
        key: key,
        authorSpeciality: '',
        authorUserType: UserTileType.influencer,
        authorName: 'Shuffle',
        authorUsername: '',
        authorAvatarUrl: GraphicsFoundation.instance.png.avatars.avatar13.path,
        hasGradientBorder: true,
        hasReactions: true,
        comment: text,
        heartEyesReactionsCount: heartEyesReactionsCount,
        likeReactionsCount: likeReactionsCount,
        fireReactionsCount: fireReactionsCount,
        sunglassesReactionsCount: sunglassesReactionsCount,
        smileyReactionsCount: smileyReactionsCount,
        onReactionsTapped: onReactionsTapped,
        onLongPress: onLongPress,
        onSharePress: onSharePress,
        createdAt: createdAt ?? '',
        showTranslateButton: showTranslateButton,
        translateText: translateText,
        children: children,
      );

  @override
  State<UiKitContentUpdatesCard> createState() => _UiKitContentUpdatesCardState();
}

class _UiKitContentUpdatesCardState extends State<UiKitContentUpdatesCard> {
  bool get showEmptyReactionsState =>
      heartCount == 0 && likeCount == 0 && sunglassesCount == 0 && fireCount == 0 && smileyCount == 0;

  double overallHeight() {
    double additionalSpacingForComment = 0;
    double reactionsSpacing = 0;
    double translateButtonSpacing = 0;

    final currentText = description ?? '';

    if (widget.hasGradientBorder && currentText.isNotEmpty) {
      final linesCount = (currentText.length ~/ charactersPerLine) + currentText.split('\n').length;

      additionalSpacingForComment += linesCount * (kIsWeb ? 15 : 18.h);
    }
    if (widget.hasReactions) {
      reactionsSpacing += SpacingFoundation.verticalSpacing8 + SpacingFoundation.verticalSpacing20;
    }
    if (widget.showTranslateButton != null && widget.showTranslateButton!.value) {
      translateButtonSpacing += SpacingFoundation.verticalSpacing32;
    }

    return widget.children.fold(0.0, (previousValue, element) => previousValue + element.height) +
        ((widget.children.length + 2) * SpacingFoundation.verticalSpacing24) +
        (kIsWeb ? 17 : 0.152.sw) +
        EdgeInsetsFoundation.vertical24 +
        reactionsSpacing +
        additionalSpacingForComment +
        translateButtonSpacing;
  }

  int get heartCount => widget.heartEyesReactionsCount ?? 0;

  int get likeCount => widget.likeReactionsCount ?? 0;

  int get fireCount => widget.fireReactionsCount ?? 0;

  int get sunglassesCount => widget.sunglassesReactionsCount ?? 0;

  int get smileyCount => widget.smileyReactionsCount ?? 0;

  int get charactersPerLine => 1.sw >= 380 ? 38 : 33;

  bool isTranslate = false;

  late String? description;

  @override
  void initState() {
    super.initState();

    description = widget.comment;
    widget.showTranslateButton?.addListener(_updateHeight);
  }

  @override
  void dispose() {
    widget.showTranslateButton?.removeListener(_updateHeight);
    super.dispose();
  }

  void _updateHeight() {
    setState(() {
      overallHeight();
    });
  }

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

    _children() {
      return widget.hasGradientBorder
          ? Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: kIsWeb ? 90 : 1.sw,
                  child: UiKitShuffleTile(
                    trailing: widget.onSharePress != null
                        ? context.iconButtonNoPadding(
                            data: BaseUiKitButtonData(
                                onPressed: widget.onSharePress,
                                iconInfo: BaseUiKitButtonIconData(
                                  iconData: ShuffleUiKitIcons.share,
                                  color: colorScheme?.darkNeutral800,
                                )))
                        : null,
                  ),
                ),
                if (widget.hasGradientBorder && description != null && description!.isNotEmpty)
                  Text(
                    description!,
                    style: regularTextTheme?.caption2,
                    textAlign: TextAlign.start,
                  ).paddingOnly(top: EdgeInsetsFoundation.vertical16),
                if (widget.children.isNotEmpty) ...[
                  SpacingFoundation.verticalSpace4,
                  ...widget.children.map((child) {
                    final isLastChild = widget.children.indexOf(child) == widget.children.length - 1;

                    if (!isLastChild) return child.paddingOnly(bottom: EdgeInsetsFoundation.vertical16);
                    return child;
                  }),
                ],
                SpacingFoundation.verticalSpace8,
                if (widget.showTranslateButton != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ListenableBuilder(
                        listenable: widget.showTranslateButton!,
                        builder: (context, child) => InkWell(
                          onTap: () {
                            setState(() {
                              isTranslate = !isTranslate;
                              if (isTranslate) {
                                if (widget.translateText?.value != null && widget.translateText!.value.isNotEmpty) {
                                  description = widget.translateText?.value;
                                }
                              } else {
                                description = widget.comment;
                              }
                            });
                          },
                          child: widget.showTranslateButton!.value
                              ? Text(
                                  isTranslate ? S.of(context).Original : S.of(context).Translate,
                                  style: context.uiKitTheme?.regularTextTheme.caption4Regular.copyWith(
                                    color: isLightTheme
                                        ? ColorsFoundation.darkNeutral700
                                        : ColorsFoundation.darkNeutral300,
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ),
                      ),
                    ],
                  ).paddingOnly(bottom: SpacingFoundation.verticalSpacing8),
                if (widget.hasReactions)
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UiKitCardWrapper(
                        color: colorScheme?.darkNeutral900,
                        borderRadius: BorderRadiusFoundation.max,
                        padding: EdgeInsets.symmetric(
                            horizontal: SpacingFoundation.horizontalSpacing4,
                            vertical: SpacingFoundation.verticalSpacing2),
                        child: Text(widget.createdAt, style: regularTextTheme?.caption3),
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
                                child: const ImageWidget(
                                  iconData: ShuffleUiKitIcons.thumbup,
                                  color: ColorsFoundation.mutedText,
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
                  )
              ],
            ).paddingAll(EdgeInsetsFoundation.all16)
          : Column(
              children: [
                context.userTile(
                  data: BaseUiKitUserTileData(
                    name: widget.authorName,
                    username: widget.authorUsername,
                    avatarUrl: widget.authorAvatarUrl,
                    type: widget.authorUserType,
                    noMaterialOverlay: true,
                  ),
                ),
                SpacingFoundation.verticalSpace8,
                ...widget.children.map((child) {
                  final isLastChild = widget.children.indexOf(child) == widget.children.length - 1;

                  if (!isLastChild) return child.paddingOnly(bottom: EdgeInsetsFoundation.vertical16);
                  return child;
                }),
              ],
            ).paddingAll(EdgeInsetsFoundation.all16);
    }

    // debugPrint('updates card build here and overallHeight: $overallHeight');

    return GestureDetector(
      onLongPress: () {
        FeedbackIsolate.instance.addEvent(FeedbackIsolateHaptics(
          intensities: [130, 170],
          pattern: [10, 5],
        ));
        widget.onLongPress?.call();
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
                child: DecoratedBox(
                  // width: kIsWeb ? 90 : 1.sw,
                  // height: overallHeight,
                  // clipBehavior: Clip.hardEdge,
                  position: DecorationPosition.foreground,
                  decoration: BoxDecoration(
                    color: isLightTheme ? colorScheme?.surface2 : null,
                    gradient: isLightTheme ? null : GradientFoundation.shunyGreyGradientInverted,
                    borderRadius: BorderRadiusFoundation.all24,
                    border: widget.hasGradientBorder ? GradientFoundation.touchIdgradientBorder : null,
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                    child: IgnorePointer(
                      child: Opacity(
                        opacity: 0,
                        child: _children(),
                      ),
                    ),
                  ),
                )),
            _children(),
            if (widget.authorSpeciality.isNotEmpty)
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
                        widget.authorSpeciality,
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
