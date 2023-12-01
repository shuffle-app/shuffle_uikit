import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitCompactOrderedRatingCard extends StatelessWidget {
  final String? title;
  final int? order;
  final double? rating;
  final String? imageLink;
  final VoidCallback? onPressed;

  const UiKitCompactOrderedRatingCard({
    super.key,
    this.title,
    this.order,
    this.rating,
    this.imageLink,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return LayoutBuilder(
      builder: (context, size) {
        final calculatedHeight = size.maxWidth * 0.2916;
        final sideInfoCardsWidth = size.maxWidth * 0.1597;

        return Material(
          borderRadius: BorderRadiusFoundation.all24,
          clipBehavior: Clip.hardEdge,
          color: context.uiKitTheme?.colorScheme.surface1,
          child: InkWell(
            onTap: onPressed,
            child: Ink(
              height: calculatedHeight,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Ink(
                    width: sideInfoCardsWidth,
                    color: ColorsFoundation.darkNeutral500.withOpacity(0.08),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '#',
                          style: textTheme?.body,
                        ),
                        SpacingFoundation.verticalSpace2,
                        Text(
                          '$order',
                          style: textTheme?.body,
                        ),
                      ],
                    ).paddingSymmetric(
                      horizontal: EdgeInsetsFoundation.horizontal8,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                            child: ClipRRect(
                          borderRadius: BorderRadiusFoundation.all24,
                          child: ImageWidget(
                            link: imageLink,
                            fit: BoxFit.cover,
                          ),
                        )),
                        SpacingFoundation.horizontalSpace8,
                        Expanded(
                          child: Center(
                            child: Text(
                              title ?? '',
                              style: textTheme?.caption1Bold,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ).paddingSymmetric(
                      vertical: EdgeInsetsFoundation.vertical12,
                      horizontal: EdgeInsetsFoundation.horizontal8,
                    ),
                  ),
                  // if (rating != null)
                  Ink(
                    width: sideInfoCardsWidth,
                    color: ColorsFoundation.darkNeutral500.withOpacity( 0.08),
                    // color: ColorsFoundation.darkNeutral500.withOpacity(rating == null ? 0 : 0.08),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (rating != null)
                          ImageWidget(
                            iconData: ShuffleUiKitIcons.star,
                            color: context.uiKitTheme?.colorScheme.inversePrimary,
                          ),
                        SpacingFoundation.verticalSpace4,
                        Text(
                          rating?.toStringAsFixed(1) ?? '',
                          style: textTheme?.body,
                        ),
                      ],
                    ).paddingSymmetric(
                      horizontal: EdgeInsetsFoundation.horizontal8,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
