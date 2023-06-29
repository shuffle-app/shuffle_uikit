import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_kit/molecules/badges/ui_kit_rating_badge.dart';

class UiKitFeedbackCard extends StatelessWidget {
  final String? title;
  final String? avatarUrl;
  final DateTime? datePosted;
  final double? rating;
  final bool? companyAnswered;
  final int? helpfulCount;
  final String? text;
  final VoidCallback? onLike;
  final VoidCallback? onPressed;

  const UiKitFeedbackCard({
    super.key,
    this.title,
    this.avatarUrl,
    this.datePosted,
    this.rating,
    this.companyAnswered,
    this.helpfulCount,
    this.text,
    this.onLike,
    this.onPressed,
  });

  String _timeAgo(DateTime? date) {
    if (date == null) return 'some time ago';

    return '${DateTime.now().difference(date).inDays} days ago';
  }

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return LayoutBuilder(
      builder: (context, size) {
        final calculatedHeight = size.maxWidth * 0.55;

        return Material(
          color: ColorsFoundation.surface3,
          borderRadius: BorderRadiusFoundation.all24,
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            onTap: onPressed,
            child: Ink(
              height: calculatedHeight,
              width: size.maxWidth,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CircularAvatar(
                        avatarUrl: avatarUrl ?? '',
                        name: title,
                        height: calculatedHeight * 0.25,
                      ),
                      SpacingFoundation.horizontalSpace12,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              title ?? '',
                              style: boldTextTheme?.caption1Bold,
                            ),
                            SpacingFoundation.verticalSpace2,
                            Text(
                              _timeAgo(datePosted),
                              style: boldTextTheme?.caption1Medium.copyWith(color: ColorsFoundation.darkNeutral900),
                            ),
                          ],
                        ),
                      ),
                      if (rating != null) UiKitRatingBadge(rating: rating!),
                    ],
                  ),
                  Text(
                    text ?? '',
                    style: boldTextTheme?.caption1Medium.copyWith(overflow: TextOverflow.ellipsis),
                    maxLines: 3,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (companyAnswered ?? false)
                        Text(
                          'Сompany answered',
                          style: boldTextTheme?.caption2Medium.copyWith(color: ColorsFoundation.darkNeutral900),
                        ),
                      const Spacer(),
                      GestureDetector(
                        onTap: onLike,
                        child: ImageWidget(
                          svgAsset: GraphicsFoundation.instance.svg.thumbUp,
                          color: ColorsFoundation.darkNeutral900,
                        ),
                      ),
                      SpacingFoundation.horizontalSpace8,
                      GestureDetector(
                        onTap: onLike,
                        child: Text(
                          'Helpful',
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
      },
    );
  }
}
