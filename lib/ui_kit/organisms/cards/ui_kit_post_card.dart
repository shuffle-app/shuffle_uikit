import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitPostCard extends StatefulWidget {
  final String authorName;
  final String authorUsername;
  final String authorAvatarUrl;
  final String authorSpeciality;
  final String text;
  final UserTileType authorUserType;
  final int? heartEyesCount;
  final int? likesCount;
  final int? sunglassesCount;
  final int? firesCount;
  final int? smileyCount;
  final bool hasNewMark;
  final ValueChanged<String>? onReactionsTapped;
  final VoidCallback? onLongPress;
  final VoidCallback? onSharePress;
  final VoidCallback? onProfilePress;
  final ViewShareDate? viewShareDate;
  final bool showTranslateButton;
  final AsyncValueGetter<String?>? onTranslateTap;
  final DateTime? createAt;

  final bool isPinned;
  final bool isFeed;

  const UiKitPostCard({
    super.key,
    required this.authorName,
    required this.authorUsername,
    required this.authorAvatarUrl,
    required this.authorSpeciality,
    required this.text,
    required this.authorUserType,
    this.heartEyesCount,
    this.likesCount,
    this.sunglassesCount,
    this.firesCount,
    this.smileyCount,
    this.hasNewMark = false,
    this.onReactionsTapped,
    this.onLongPress,
    this.onSharePress,
    this.onProfilePress,
    this.viewShareDate,
    this.showTranslateButton = false,
    this.createAt,
    this.isPinned = false,
    this.isFeed = true,
    this.onTranslateTap,
  });

  @override
  State<UiKitPostCard> createState() => _UiKitPostCardState();
}

class _UiKitPostCardState extends State<UiKitPostCard> {
  bool get showEmptyReactionsState =>
      ((widget.heartEyesCount == 0 &&
              widget.likesCount == 0 &&
              widget.sunglassesCount == 0 &&
              widget.firesCount == 0 &&
              widget.smileyCount == 0) ||
          (widget.heartEyesCount == null &&
              widget.likesCount == null &&
              widget.sunglassesCount == null &&
              widget.firesCount == null &&
              widget.smileyCount == null)) &&
      widget.isFeed;

  int get heartCount => widget.heartEyesCount ?? 0;

  int get likeCount => widget.likesCount ?? 0;

  int get fireCount => widget.firesCount ?? 0;

  int get sunglassesCountNotNull => widget.sunglassesCount ?? 0;

  int get smileyCountNotNull => widget.smileyCount ?? 0;

  late String? currentDescription;
  bool isLoadingTranslate = false;
  bool isTranslate = false;

  Future<void> toggleTranslation() async {
    isLoadingTranslate = true;
    setState(() {});

    if (isTranslate) {
      currentDescription = widget.text;
      isTranslate = !isTranslate;
    } else {
      final translate = await widget.onTranslateTap?.call();
      if (translate != null && translate.isNotEmpty) {
        currentDescription = translate;
        isTranslate = !isTranslate;
      }
    }

    isLoadingTranslate = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    currentDescription = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final boldTextTheme = theme?.boldTextTheme;
    final regularTextTheme = theme?.regularTextTheme;
    final colorScheme = theme?.colorScheme;
    final reactionTextColor = colorScheme?.inverseBodyTypography;
    final isLightTheme = theme?.themeMode == ThemeMode.light;

    OverlayEntry? overlayEntry;
    bool isOverlayVisible = false;

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
          minHeight: kIsWeb ? 60 : (widget.isFeed ? 0.2.sh : 0.1.sh),
          maxWidth: kIsWeb ? 90 : 1.sw,
          minWidth: kIsWeb ? 60 : 1.sw - EdgeInsetsFoundation.horizontal32,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            UiKitCardWrapper(
              color: colorScheme?.inverseSurface,
              borderRadius: BorderRadiusFoundation.all24,
              padding: EdgeInsets.all(EdgeInsetsFoundation.all16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: widget.isFeed
                        ? [
                            Expanded(
                              child: GestureDetector(
                                onTap: widget.onProfilePress,
                                child: context.userTile(
                                  data: BaseUiKitUserTileData(
                                    avatarUrl: widget.authorAvatarUrl,
                                    name: widget.authorName,
                                    username: widget.authorUsername,
                                    type: widget.authorUserType,
                                    showBadge: true,
                                    noMaterialOverlay: true,
                                    userNameTextColor: colorScheme?.inverseBodyTypography,
                                  ),
                                ),
                              ),
                            ),
                            if (widget.isPinned && kIsWeb)
                              ImageWidget(
                                link: GraphicsFoundation.instance.svg.pinned.path,
                                height: 18,
                                width: 18,
                                fit: BoxFit.fill,
                                color: ColorsFoundation.mutedText,
                              ).paddingOnly(
                                  right: widget.onSharePress != null ? SpacingFoundation.horizontalSpacing20 : 0.0),
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
                          ]
                        : [
                            Spacer(),
                            Text(
                              widget.createAt?.timeAgoFormat() ?? '',
                              style: regularTextTheme?.caption3.copyWith(color: ColorsFoundation.mutedText),
                            )
                          ],
                  ),
                  SpacingFoundation.verticalSpace8,
                  if (currentDescription != null && currentDescription!.isNotEmpty)
                    Text(
                      currentDescription!,
                      style: regularTextTheme?.caption2,
                      textAlign: TextAlign.start,
                    ).paddingOnly(top: EdgeInsetsFoundation.vertical16),
                  SpacingFoundation.verticalSpace8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (widget.showTranslateButton)
                        if (isLoadingTranslate)
                          SizedBox(
                            width: 14.w,
                            height: 14.w,
                            child: CircularProgressIndicator(
                              color: isLightTheme ? ColorsFoundation.darkNeutral700 : ColorsFoundation.darkNeutral300,
                              strokeWidth: 2.w,
                            ),
                          )
                        else
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
                              builder: (c) {
                                return TapRegion(
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
                                );
                              },
                            )
                          : Builder(
                              builder: (c) {
                                return TapRegion(
                                  behavior: HitTestBehavior.opaque,
                                  onTapInside: (value) {
                                    if (widget.onReactionsTapped != null && widget.isFeed) {
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
                                      if (heartCount > 0)
                                        UiKitHeartEyesReaction(
                                          reactionsCount: heartCount,
                                          textColor: reactionTextColor,
                                        ),
                                      if (likeCount > 0) ...[
                                        SpacingFoundation.horizontalSpace4,
                                        UiKitLikeReaction(
                                          reactionsCount: likeCount,
                                          textColor: reactionTextColor,
                                        )
                                      ],
                                      if (fireCount > 0) ...[
                                        SpacingFoundation.horizontalSpace4,
                                        UiKitFireReaction(
                                          reactionsCount: fireCount,
                                          textColor: reactionTextColor,
                                        )
                                      ],
                                      if (sunglassesCountNotNull > 0) ...[
                                        SpacingFoundation.horizontalSpace4,
                                        UiKitSunglassesReaction(
                                          reactionsCount: sunglassesCountNotNull,
                                          textColor: reactionTextColor,
                                        )
                                      ],
                                      if (smileyCountNotNull > 0) ...[
                                        SpacingFoundation.horizontalSpace4,
                                        UiKitSmileyReaction(
                                          reactionsCount: smileyCountNotNull,
                                          textColor: reactionTextColor,
                                        )
                                      ],
                                    ],
                                  ),
                                );
                              },
                            ),
                    ],
                  ),
                  if (widget.viewShareDate != null)
                    UiKitViewShareDateWidget(viewShareDate: widget.viewShareDate!)
                        .paddingOnly(top: SpacingFoundation.verticalSpacing16),
                ],
              ),
            ),
            if (widget.hasNewMark)
              Align(
                alignment: Alignment.topRight,
                child: Transform.rotate(
                  angle: -pi / 9,
                  child: UiKitCardWrapper(
                    gradient: GradientFoundation.defaultLinearGradient,
                    child: Text(
                      S.current.New.toLowerCase(),
                      style: boldTextTheme?.caption3Medium.copyWith(color: Colors.black),
                    ).paddingSymmetric(
                      horizontal: EdgeInsetsFoundation.horizontal4,
                      vertical: EdgeInsetsFoundation.vertical2,
                    ),
                  ),
                ).paddingOnly(top: EdgeInsetsFoundation.vertical2),
              ),
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
              )
          ],
        ),
      ),
    );
  }
}
