import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

/// думаю стоит перенепсти этот виджет в компонентную библиотеку разобрав его на атомы
class UiKitExtendedInfluencerFeedbackCard extends StatelessWidget {
  final String? title;
  final String? imageUrl;
  final DateTime? datePosted;
  final List<UiKitTag>? tags;
  final String? text;
  final double? rating;
  final int? helpfulCount;

  const UiKitExtendedInfluencerFeedbackCard({
    Key? key,
    this.title,
    this.imageUrl,
    this.datePosted,
    this.tags,
    this.text,
    this.helpfulCount,
    this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        final theme = context.uiKitTheme;
        final textTheme = theme?.boldTextTheme;
        final postBodyStyle = context.uiKitTheme?.boldTextTheme.caption1Bold;
        final titleStyle = textTheme?.caption1Bold;
        final width = size.maxWidth;

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusFoundation.all24,
                  child: ImageWidget(
                    link: imageUrl,
                    width: width * 0.27,
                    height: (width * 0.27) * 0.75,
                    fit: BoxFit.cover,
                  ),
                ),
                SpacingFoundation.horizontalSpace10,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? '',
                      style: titleStyle,
                    ),
                    SpacingFoundation.verticalSpace2,
                    Text(
                      datePosted?.timeAgo ?? '',
                      style: textTheme?.caption1Medium.copyWith(
                        color: ColorsFoundation.darkNeutral900,
                      ),
                    ),
                    SpacingFoundation.verticalSpace4,
                    SizedBox(
                      width: (size.maxWidth * 0.7) - SpacingFoundation.horizontalSpacing10,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            if (rating != null)
                              UiKitTagWidget(
                                  title: rating!.toStringAsFixed(0),
                                  icon: ShuffleUiKitIcons.star,
                                  textColor: theme?.colorScheme.inversePrimary),
                            ...tags
                                    ?.map<Widget>((e) => UiKitTagWidget(
                                          title: e.title,
                                          icon: e.icon,
                                          showSpacing: rating != null || tags?.indexOf(e) != 0,
                                        ))
                                    .toList() ??
                                [],
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SpacingFoundation.verticalSpace12,
            Text(
              text ?? '',
              style: postBodyStyle?.copyWith(
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 5,
            ),
            SpacingFoundation.verticalSpace12,
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const ImageWidget(
                  iconData: ShuffleUiKitIcons.thumbup,
                  color: ColorsFoundation.darkNeutral900,
                ),
                SpacingFoundation.horizontalSpace8,
                Text(
                  S.of(context).Helpful,
                  style: titleStyle?.copyWith(
                    color: ColorsFoundation.darkNeutral900,
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
