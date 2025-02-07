import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitFeedbackCard extends StatelessWidget {
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

  final ValueNotifier<bool>? showTranslateButton;
  final ValueNotifier<String>? translateText;

  late final ValueNotifier<bool> isTranslate;
  late final ValueNotifier<String> description;

  UiKitFeedbackCard({
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
    this.showTranslateButton,
    this.translateText,
  }) {
    description = ValueNotifier<String>(text ?? '');
    isTranslate = ValueNotifier<bool>(false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final boldTextTheme = theme?.boldTextTheme;
    final colorScheme = theme?.colorScheme;

    final shufflePostVideoWidgetWidth = kIsWeb ? 50.0 : 0.16845.sw;
    final shufflePostVideoWidgetHeight = kIsWeb ? 45.0 : 0.16845.sw * 0.75;
    final playButtonSize = Size(32.w, 24.h);
    final xOffset = shufflePostVideoWidgetWidth / 2 - playButtonSize.width / 2;
    final yOffset = shufflePostVideoWidgetHeight / 2 - playButtonSize.height / 2;

    final int microseconds = DateTime.now().millisecondsSinceEpoch;

    void toggleTranslation() {
      isTranslate.value = !isTranslate.value;
      description.value = isTranslate.value ? (translateText?.value ?? text ?? '') : text ?? '';
    }

    return Material(
      color: customBackgroundColor ?? colorScheme?.surface3,
      borderRadius: BorderRadiusFoundation.all24,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onPressed,
        child: Ink(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              UiKitHeaderWithLeading(
                title: title ?? '',
                leading: SizedBox(
                  width: avatarSize?.width,
                  height: avatarSize?.height,
                  child: context.userAvatar(
                    size: UserAvatarSize.x40x40,
                    type: userTileType ?? UserTileType.ordinary,
                    userName: title ?? '',
                    imageUrl: avatarUrl,
                  ),
                ),
                subtitle: datePosted?.timeAgo ?? '',
                trailing: rating != null ? UiKitRatingBadge(rating: rating!) : null,
              ),
              SpacingFoundation.verticalSpace12,
              if (description.value.isNotEmpty)
                ValueListenableBuilder<String>(
                  valueListenable: description,
                  builder: (_, text, __) => Text(
                    text,
                    style: boldTextTheme?.caption1Medium.copyWith(overflow: TextOverflow.ellipsis),
                    maxLines: maxLines ?? (media.isNotEmpty ? 3 : 5),
                  ),
                ),
              SpacingFoundation.verticalSpace12,
              if (media.isNotEmpty) ...[
                SizedBox(
                  height: shufflePostVideoWidgetHeight,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final item = media[index];
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
                              final listLinks =
                                  media.where((e) => e.type == UiKitMediaType.image).map((e) => e.link).toList();
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
                    itemCount: media.length,
                    shrinkWrap: true,
                  ),
                ),
                SpacingFoundation.verticalSpace12
              ],
              if (showTranslateButton != null)
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ValueListenableBuilder<bool>(
                      valueListenable: isTranslate,
                      builder: (_, isTranslating, __) => InkWell(
                        onTap: toggleTranslation,
                        child: showTranslateButton!.value
                            ? Text(
                                isTranslating ? S.of(context).Original : S.of(context).Translate,
                                style: theme?.regularTextTheme.caption4Regular.copyWith(
                                  color: theme.themeMode == ThemeMode.light
                                      ? ColorsFoundation.darkNeutral700
                                      : ColorsFoundation.darkNeutral300,
                                ),
                              )
                            : const SizedBox.shrink(),
                      ),
                    ),
                  ],
                ).paddingOnly(bottom: SpacingFoundation.verticalSpacing12),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (canEdit)
                    GestureDetector(
                      onTap: onEdit,
                      child: ImageWidget(
                        link: GraphicsFoundation.instance.svg.pencil.path,
                        width: 14.w,
                        color: ColorsFoundation.mutedText,
                        fit: BoxFit.contain,
                      ),
                    ),
                  if (companyAnswered ?? false)
                    Text(
                      S.of(context).CompanyAnswered,
                      style: boldTextTheme?.caption2Medium.copyWith(color: ColorsFoundation.darkNeutral900),
                    ),
                  const Spacer(),
                  InkWell(
                    borderRadius: BorderRadiusFoundation.max,
                    onTap: onLike,
                    child: ImageWidget(
                      iconData: ShuffleUiKitIcons.like,
                      width: 12.w,
                      color: (isHelpful ?? false) ? colorScheme?.inverseSurface : ColorsFoundation.mutedText,
                    ),
                  ),
                  if (helpfulCount != null) SpacingFoundation.horizontalSpace2,
                  if (helpfulCount != null)
                    InkWell(
                        borderRadius: BorderRadiusFoundation.max,
                        onTap: onLike,
                        child: Text(
                          helpfulCount?.toString() ?? '',
                          style: boldTextTheme?.caption2Medium.copyWith(color: ColorsFoundation.darkNeutral900),
                        )),
                  SpacingFoundation.horizontalSpace8,
                  InkWell(
                    borderRadius: BorderRadiusFoundation.max,
                    onTap: onLike,
                    child: Text(
                      S.of(context).Helpful,
                      style: boldTextTheme?.caption2Medium.copyWith(color: ColorsFoundation.darkNeutral900),
                    ),
                  ),
                ],
              ),
            ],
          ).paddingAll(EdgeInsetsFoundation.all16),
        ),
      ),
    );
  }
}
