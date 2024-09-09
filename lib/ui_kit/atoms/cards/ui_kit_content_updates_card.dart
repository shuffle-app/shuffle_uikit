import 'dart:ui';

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
  final bool hasReactions;
  final int? heartEyesReactionsCount;
  final int? likeReactionsCount;
  final int? fireReactionsCount;
  final int? sunglassesReactionsCount;
  final int? smileyReactionsCount;

  bool get showEmptyReactionsState =>
      (heartEyesReactionsCount == 0 &&
          likeReactionsCount == 0 &&
          sunglassesReactionsCount == 0 &&
          fireReactionsCount == 0 &&
          smileyReactionsCount == 0) ||
      (heartEyesReactionsCount == null &&
          likeReactionsCount == null &&
          sunglassesReactionsCount == null &&
          fireReactionsCount == null &&
          smileyReactionsCount == null);

  const UiKitContentUpdatesCard({
    Key? key,
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
  }) : super(key: key);

  factory UiKitContentUpdatesCard.fromShuffle({
    required List<UiKitContentUpdateWidget> children,
    required String text,
    int? heartEyesReactionsCount,
    int? likeReactionsCount,
    int? fireReactionsCount,
    int? sunglassesReactionsCount,
    int? smileyReactionsCount,
  }) =>
      UiKitContentUpdatesCard(
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
        children: children,
      );

  double get overallHeight {
    double additionalSpacingForComment = 0;
    double reactionsSpacing = 0;
    if (hasGradientBorder && comment != null) {
      final linesCount = comment!.length ~/ 30;
      additionalSpacingForComment += linesCount * 14.5.h;
    }
    if (hasReactions) reactionsSpacing += SpacingFoundation.verticalSpacing8 + SpacingFoundation.verticalSpacing20;

    return children.fold(0.0, (previousValue, element) => previousValue + element.height) +
        ((children.length + 2) * SpacingFoundation.verticalSpacing16) +
        0.125.sw +
        EdgeInsetsFoundation.vertical24 +
        reactionsSpacing +
        additionalSpacingForComment;
  }

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;
    final colorScheme = context.uiKitTheme?.colorScheme;
    final reactionTextColor = colorScheme?.bodyTypography;
    final isLightTheme = context.uiKitTheme?.themeMode == ThemeMode.light;

    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 1.sw - EdgeInsetsFoundation.horizontal32,
        maxWidth: 1.sw,
        maxHeight: overallHeight,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          Container(
            width: 1.sw,
            height: overallHeight,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: isLightTheme ? colorScheme?.surface2 : null,
              gradient: isLightTheme ? null : GradientFoundation.shunyGreyGradientInverted,
              borderRadius: BorderRadiusFoundation.all24,
              border: hasGradientBorder ? GradientFoundation.touchIdgradientBorder : null,
            ),
            child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50)),
          ),
          if (hasGradientBorder)
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: 1.sw,
                  child: const UiKitShuffleTile(),
                ),
                if (hasGradientBorder && comment != null && comment!.isNotEmpty)
                  Text(
                    comment!,
                    style: regularTextTheme?.caption2,
                    textAlign: TextAlign.start,
                  ).paddingOnly(top: EdgeInsetsFoundation.vertical16),
                SpacingFoundation.verticalSpace4,
                ...children.map((child) {
                  final isLastChild = children.indexOf(child) == children.length - 1;

                  if (!isLastChild) return child.paddingOnly(bottom: EdgeInsetsFoundation.vertical16);
                  return child;
                }),
                SpacingFoundation.verticalSpace8,
                if (hasReactions)
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: showEmptyReactionsState
                        ? [
                            ImageWidget(
                              svgAsset: GraphicsFoundation.instance.svg.thumbUp,
                              color: ColorsFoundation.mutedText,
                            ),
                          ]
                        : [
                            UiKitHeartEyesReaction(
                              reactionsCount: heartEyesReactionsCount ?? 0,
                              textColor: reactionTextColor,
                            ),
                            SpacingFoundation.horizontalSpace4,
                            UiKitLikeReaction(
                              reactionsCount: likeReactionsCount ?? 0,
                              textColor: reactionTextColor,
                            ),
                            SpacingFoundation.horizontalSpace4,
                            UiKitFireReaction(
                              reactionsCount: fireReactionsCount ?? 0,
                              textColor: reactionTextColor,
                            ),
                            SpacingFoundation.horizontalSpace4,
                            UiKitSunglassesReaction(
                              reactionsCount: sunglassesReactionsCount ?? 0,
                              textColor: reactionTextColor,
                            ),
                            SpacingFoundation.horizontalSpace4,
                            UiKitSmileyReaction(
                              reactionsCount: smileyReactionsCount ?? 0,
                              textColor: reactionTextColor,
                            ),
                          ],
                  ),
              ],
            ).paddingAll(EdgeInsetsFoundation.all16),
          if (!hasGradientBorder)
            Column(
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
                ...children.map((child) {
                  final isLastChild = children.indexOf(child) == children.length - 1;

                  if (!isLastChild) return child.paddingOnly(bottom: EdgeInsetsFoundation.vertical16);
                  return child;
                }),
              ],
            ).paddingAll(EdgeInsetsFoundation.all16),
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
    );
  }
}
