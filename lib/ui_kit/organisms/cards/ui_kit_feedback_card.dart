import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitFeedbackCard extends StatefulWidget {
  final String? title;
  final String? avatarUrl;
  final DateTime? datePosted;
  final int? rating;
  final bool? companyAnswered;
  final int? helpfulCount;
  final String? text;
  final VoidCallback? onLike;
  final VoidCallback? onPressed;
  final bool? isHelpful;
  final int? maxLines;
  final UserTileType? userTileType;
  final Color? customBackgroundColor;
  final Size? avatarSize;
  final List<BaseUiKitMedia> media;
  final VoidCallback? onEdit;
  final bool canEdit;
  final VoidCallback? onAvatarTap;

  final bool showTranslateButton;
  final ValueNotifier<bool>? isTranslateLoading;
  final Future<String?> Function()? onTranslateTap;

  const UiKitFeedbackCard({
    super.key,
    this.title,
    this.isHelpful,
    this.avatarUrl,
    this.datePosted,
    this.rating,
    this.companyAnswered,
    this.helpfulCount,
    this.text,
    this.onLike,
    this.onPressed,
    this.maxLines,
    this.userTileType,
    this.customBackgroundColor,
    this.avatarSize,
    this.media = const [],
    this.onEdit,
    this.canEdit = false,
    this.onAvatarTap,
    this.showTranslateButton = false,
    this.onTranslateTap,
    this.isTranslateLoading,
  });

  @override
  State<UiKitFeedbackCard> createState() => _UiKitFeedbackCardState();
}

class _UiKitFeedbackCardState extends State<UiKitFeedbackCard> {
  final int microseconds = DateTime.now().millisecondsSinceEpoch;
  late String description = widget.text ?? '';
  bool isTranslate = false;

  Future<void> toggleTranslation() async {
    if (isTranslate) {
      description = widget.text ?? '';
      isTranslate = !isTranslate;
    } else {
      final translateDescription = await widget.onTranslateTap?.call();

      if (translateDescription != null && translateDescription.isNotEmpty) {
        description = translateDescription;
        isTranslate = !isTranslate;
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final boldTextTheme = theme?.boldTextTheme;
    final colorScheme = theme?.colorScheme;
    final bool isLightTheme = theme?.themeMode == ThemeMode.light;

    return Material(
      color: widget.customBackgroundColor ?? colorScheme?.surface3,
      borderRadius: BorderRadiusFoundation.all24,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: widget.onPressed,
        child: LayoutBuilder(
          builder: (context, size) {
            final shufflePostVideoWidgetWidth = kIsWeb ? 50.0 : 0.16845 * size.maxWidth;
            final shufflePostVideoWidgetHeight = (kIsWeb ? 45.0 : (0.16845 * size.maxWidth)) * 0.75;
            final playButtonSize = Size(32.w, 24.h);
            final xOffset = shufflePostVideoWidgetWidth / 2 - playButtonSize.width / 2;
            final yOffset = shufflePostVideoWidgetHeight / 2 - playButtonSize.height / 2;

            double calculateMaxTextHeight({
              required double totalHeight,
              required BuildContext context,
            }) {
              double titleHeight = 60.w;
              double textPaddingVertical = SpacingFoundation.verticalSpacing8 + SpacingFoundation.verticalSpacing12;
              double buttonButtonHeight = 32.w;

              double usedHeight = titleHeight + textPaddingVertical + buttonButtonHeight;
              if (widget.media.isNotEmpty) {
                usedHeight += shufflePostVideoWidgetHeight;
              }

              return totalHeight - usedHeight;
            }

            int calculateMaxLines({
              required String text,
              required TextStyle style,
              required double maxWidth,
              required double maxHeight,
            }) {
              final textPainter = TextPainter(
                text: TextSpan(text: text, style: style),
                maxLines: 100,
                textDirection: TextDirection.ltr,
              )..layout(maxWidth: maxWidth);

              final lineHeight = textPainter.preferredLineHeight;
              if (lineHeight <= 0) return 3;

              final isHeightConstrained = maxHeight != double.infinity;
              if (!isHeightConstrained) {
                return 100;
              }

              final hasMedia = widget.media.isNotEmpty;
              final calculatedLines = (maxHeight / lineHeight).floor();

              return calculatedLines.clamp(
                hasMedia ? 1 : 3,
                hasMedia ? 5 : 10,
              );
            }

            return Ink(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: widget.onAvatarTap,
                    child: UiKitHeaderWithLeading(
                      title: widget.title ?? '',
                      leading: SizedBox(
                        width: widget.avatarSize?.width,
                        height: widget.avatarSize?.height,
                        child: context.userAvatar(
                          size: UserAvatarSize.x40x40,
                          type: widget.userTileType ?? UserTileType.ordinary,
                          userName: widget.title ?? '',
                          imageUrl: widget.avatarUrl,
                        ),
                      ),
                      subtitle: widget.datePosted?.timeAgo ?? '',
                      trailing: widget.rating != null ? UiKitRatingBadge(rating: widget.rating!) : null,
                    ),
                  ),
                  SpacingFoundation.verticalSpace12,
                  if (widget.text != null && widget.text!.isNotEmpty)
                    LayoutBuilder(
                      builder: (context, textConstraints) {
                        int? calculatedMaxLines;

                        if (widget.maxLines == null) {
                          final maxTextHeight = calculateMaxTextHeight(
                            totalHeight: size.maxHeight,
                            context: context,
                          );

                          calculatedMaxLines = calculateMaxLines(
                            text: widget.text ?? '',
                            style: boldTextTheme?.caption1Medium ?? TextStyle(fontSize: 13.w),
                            maxWidth: textConstraints.maxWidth,
                            maxHeight: maxTextHeight,
                          );
                        }

                        return Text(
                          description.trim(),
                          style: boldTextTheme?.caption1Medium.copyWith(overflow: TextOverflow.ellipsis),
                          maxLines: widget.maxLines ?? calculatedMaxLines,
                        );
                      },
                    ),
                  SpacingFoundation.verticalSpace8,
                  if (widget.media.isNotEmpty) ...[
                    SizedBox(
                      height: shufflePostVideoWidgetHeight,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final item = widget.media[index];
                          if (item.type == UiKitMediaType.video) {
                            return UiKitMediaVideoWidget(
                              width: shufflePostVideoWidgetWidth,
                              playButtonCustomOffset: Offset(xOffset, yOffset),
                              media: item,
                              borderRadius: BorderRadiusFoundation.all8,
                            );
                          } else {
                            final String heroTag = '${item.link}--${microseconds}';
                            return GestureDetector(
                                onTap: () {
                                  final listLinks = widget.media
                                      .where((e) => e.type == UiKitMediaType.image)
                                      .map((e) => e.link)
                                      .toList();
                                  context.push(
                                      PhotoDialog(
                                        images: listLinks,
                                        initialIndex: listLinks.indexOf(item.link),
                                        tag: heroTag,
                                      ),
                                      nativeTransition: false,
                                      transitionDuration: const Duration(milliseconds: 500),
                                      useRootNavigator: true);
                                },
                                child: Hero(
                                    tag: heroTag,
                                    transitionOnUserGestures: true,
                                    child: UiKitMediaImageWidget(
                                      width: shufflePostVideoWidgetWidth,
                                      media: item,
                                      borderRadius: BorderRadiusFoundation.all8,
                                    )));
                          }
                        },
                        separatorBuilder: (_, __) => SpacingFoundation.horizontalSpace4,
                        itemCount: widget.media.length,
                        shrinkWrap: true,
                      ),
                    ),
                    SpacingFoundation.verticalSpace4
                  ],
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (widget.canEdit)
                        GestureDetector(
                          onTap: widget.onEdit,
                          child: ImageWidget(
                            link: GraphicsFoundation.instance.svg.pencil.path,
                            width: 14.w,
                            color: ColorsFoundation.mutedText,
                            fit: BoxFit.contain,
                          ),
                        ).paddingOnly(right: SpacingFoundation.horizontalSpacing8),
                      if (widget.companyAnswered ?? false)
                        Text(
                          S.of(context).CompanyAnswered,
                          style: boldTextTheme?.caption2Medium.copyWith(color: ColorsFoundation.darkNeutral900),
                        ),
                      if (widget.showTranslateButton)
                        if (widget.isTranslateLoading != null)
                          ValueListenableBuilder(
                            valueListenable: widget.isTranslateLoading!,
                            builder: (context, value, child) {
                              if (value) {
                                return SizedBox(
                                  width: 14.w,
                                  height: 14.w,
                                  child: CircularProgressIndicator(
                                    color: isLightTheme
                                        ? ColorsFoundation.darkNeutral700
                                        : ColorsFoundation.darkNeutral300,
                                    strokeWidth: 2.w,
                                  ),
                                );
                              } else {
                                return TranslateButton(
                                  isTranslate: isTranslate,
                                  showTranslateButton: widget.showTranslateButton,
                                  toggleTranslation: toggleTranslation,
                                );
                              }
                            },
                          )
                        else
                          TranslateButton(
                            isTranslate: isTranslate,
                            showTranslateButton: widget.showTranslateButton,
                            toggleTranslation: toggleTranslation,
                          ),
                      Spacer(),
                      InkWell(
                        borderRadius: BorderRadiusFoundation.max,
                        onTap: widget.onLike,
                        child: ImageWidget(
                          iconData: ShuffleUiKitIcons.like,
                          width: 12.w,
                          color: (widget.isHelpful ?? false) ? colorScheme?.inverseSurface : ColorsFoundation.mutedText,
                        ),
                      ),
                      if (widget.helpfulCount != null) SpacingFoundation.horizontalSpace2,
                      if (widget.helpfulCount != null)
                        InkWell(
                            borderRadius: BorderRadiusFoundation.max,
                            onTap: widget.onLike,
                            child: Text(
                              widget.helpfulCount?.toString() ?? '',
                              style: boldTextTheme?.caption2Medium.copyWith(color: ColorsFoundation.darkNeutral900),
                            )),
                      SpacingFoundation.horizontalSpace8,
                      InkWell(
                        borderRadius: BorderRadiusFoundation.max,
                        onTap: widget.onLike,
                        child: Text(
                          S.of(context).Helpful,
                          style: boldTextTheme?.caption2Medium.copyWith(color: ColorsFoundation.darkNeutral900),
                        ),
                      ),
                    ],
                  ),
                ],
              ).paddingAll(EdgeInsetsFoundation.all16),
            );
          },
        ),
      ),
    );
  }
}

class TranslateButton extends StatelessWidget {
  final VoidCallback? toggleTranslation;
  final bool showTranslateButton;
  final bool isTranslate;

  const TranslateButton({
    super.key,
    this.toggleTranslation,
    this.showTranslateButton = false,
    this.isTranslate = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final bool isLightTheme = theme?.themeMode == ThemeMode.light;

    return GestureDetector(
      onTap: toggleTranslation,
      child: showTranslateButton
          ? Text(
              isTranslate ? S.of(context).Original : S.of(context).Translate,
              style: theme?.regularTextTheme.caption4Regular.copyWith(
                color: isLightTheme ? ColorsFoundation.darkNeutral700 : ColorsFoundation.darkNeutral300,
              ),
            ).paddingOnly(right: SpacingFoundation.horizontalSpacing8)
          : const SizedBox.shrink(),
    );
  }
}
