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
  final String createdAt;
  final ValueNotifier<bool>? showTranslateButton;
  final ValueNotifier<String>? translateText;

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
    this.createdAt = '',
    this.showTranslateButton,
    this.translateText,
  });

  @override
  State<UiKitPostCard> createState() => _UiKitPostCardState();
}

class _UiKitPostCardState extends State<UiKitPostCard> {
  bool get showEmptyReactionsState =>
      (widget.heartEyesCount == 0 &&
          widget.likesCount == 0 &&
          widget.sunglassesCount == 0 &&
          widget.firesCount == 0 &&
          widget.smileyCount == 0) ||
      (widget.heartEyesCount == null &&
          widget.likesCount == null &&
          widget.sunglassesCount == null &&
          widget.firesCount == null &&
          widget.smileyCount == null);

  int get heartCount => widget.heartEyesCount ?? 0;

  int get likeCount => widget.likesCount ?? 0;

  int get fireCount => widget.firesCount ?? 0;

  int get sunglassesCountNotNull => widget.sunglassesCount ?? 0;

  int get smileyCountNotNull => widget.smileyCount ?? 0;

  bool isTranslate = false;

  late String description;

  @override
  void initState() {
    super.initState();

    description = widget.text;
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
          minHeight: kIsWeb ? 60 : 0.2.sh,
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
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Expanded(
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
                    )),
                    if (widget.onSharePress != null)
                      context.iconButtonNoPadding(
                          data: BaseUiKitButtonData(
                              onPressed: widget.onSharePress,
                              iconInfo: BaseUiKitButtonIconData(
                                iconData: ShuffleUiKitIcons.share,
                                color: colorScheme?.darkNeutral800,
                              )))
                  ]),
                  SpacingFoundation.verticalSpace8,
                  Text(
                    description,
                    style: regularTextTheme?.caption2.copyWith(color: colorScheme?.surface),
                  ),
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
                                    description = widget.translateText!.value;
                                  }
                                } else {
                                  description = widget.text;
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
                                  child: const ImageWidget(
                                    iconData: ShuffleUiKitIcons.thumbup,
                                    color: ColorsFoundation.mutedText,
                                  ),
                                );
                              },
                            )
                          : Builder(
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
