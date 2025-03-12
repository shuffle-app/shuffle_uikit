import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitPostCard extends StatelessWidget {
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
  final ValueNotifier<bool>? showTranslateButton;
  final ValueNotifier<String>? translateText;
  final DateTime? createAt;

  late final ValueNotifier<String> description;
  late final ValueNotifier<bool> isTranslate;

  final bool isPinned;
  final bool isFeed;

  UiKitPostCard({
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
    this.showTranslateButton,
    this.translateText,
    this.createAt,
    this.isPinned = false,
    this.isFeed = true,
  }) {
    description = ValueNotifier<String>(text);
    isTranslate = ValueNotifier<bool>(false);
  }

  bool get showEmptyReactionsState =>
      ((heartEyesCount == 0 && likesCount == 0 && sunglassesCount == 0 && firesCount == 0 && smileyCount == 0) ||
          (heartEyesCount == null &&
              likesCount == null &&
              sunglassesCount == null &&
              firesCount == null &&
              smileyCount == null)) &&
      isFeed;

  int get heartCount => heartEyesCount ?? 0;

  int get likeCount => likesCount ?? 0;

  int get fireCount => firesCount ?? 0;

  int get sunglassesCountNotNull => sunglassesCount ?? 0;

  int get smileyCountNotNull => smileyCount ?? 0;

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

    void toggleTranslation() {
      isTranslate.value = !isTranslate.value;
      description.value = isTranslate.value ? (translateText?.value ?? text) : text;
    }

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
          minHeight: kIsWeb ? 60 : (isFeed ? 0.2.sh : 0.1.sh),
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
                    children: isFeed
                        ? [
                            Expanded(
                              child: GestureDetector(
                                onTap: onProfilePress,
                                child: context.userTile(
                                  data: BaseUiKitUserTileData(
                                    avatarUrl: authorAvatarUrl,
                                    name: authorName,
                                    username: authorUsername,
                                    type: authorUserType,
                                    showBadge: true,
                                    noMaterialOverlay: true,
                                    userNameTextColor: colorScheme?.inverseBodyTypography,
                                  ),
                                ),
                              ),
                            ),
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
                          ]
                        : [
                            Spacer(),
                            Text(
                              createAt?.timeAgoFormat() ?? '',
                              style: regularTextTheme?.caption3.copyWith(color: ColorsFoundation.mutedText),
                            )
                          ],
                  ),
                  SpacingFoundation.verticalSpace8,
                  ValueListenableBuilder<String>(
                    valueListenable: description,
                    builder: (_, desc, __) => Text(
                      desc,
                      style: regularTextTheme?.caption2.copyWith(color: colorScheme?.surface),
                    ),
                  ),
                  SpacingFoundation.verticalSpace8,
                  Row(
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
                              builder: (c) {
                                return TapRegion(
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
                                );
                              },
                            )
                          : Builder(
                              builder: (c) {
                                return TapRegion(
                                  behavior: HitTestBehavior.opaque,
                                  onTapInside: (value) {
                                    if (onReactionsTapped != null && isFeed) {
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
                  if (viewShareDate != null)
                    UiKitViewShareDateWidget(viewShareDate: viewShareDate!)
                        .paddingOnly(top: SpacingFoundation.verticalSpacing16),
                ],
              ),
            ),
            if (hasNewMark)
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
              )
          ],
        ),
      ),
    );
  }
}
