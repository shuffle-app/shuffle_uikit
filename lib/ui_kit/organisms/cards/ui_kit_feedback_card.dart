import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

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
                  UiKitHeaderWithLeading(
                    title: title ?? '',
                    leading: CircularAvatar(
                      avatarUrl: avatarUrl ?? '',
                      name: title,
                      height: calculatedHeight * 0.25,
                    ),
                    subtitle: datePosted?.timeAgo ?? '',
                    trailing: rating != null ? UiKitRatingBadge(rating: rating!) : null,
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
