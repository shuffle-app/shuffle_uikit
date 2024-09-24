import 'package:auto_size_text/auto_size_text.dart';
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
                    color: ColorsFoundation.neutral8,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '#',
                          style: textTheme?.subHeadline,
                        ),
                        SpacingFoundation.verticalSpace2,
                        AutoSizeText(
                          '$order',
                          maxLines: 1,
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
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ).paddingSymmetric(
                      vertical: EdgeInsetsFoundation.vertical12,
                      horizontal: EdgeInsetsFoundation.horizontal8,
                    ),
                  ),
                  Ink(
                    width: sideInfoCardsWidth,
                    color: ColorsFoundation.neutral8,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (rating != null)
                          ImageWidget(
                            iconData: ShuffleUiKitIcons.star,
                            height: textTheme?.subHeadline.height ?? textTheme?.subHeadline.fontSize,
                            fit: BoxFit.fitHeight,
                            color: context.uiKitTheme?.colorScheme.inversePrimary,
                          ),
                        SpacingFoundation.verticalSpace4,
                        AutoSizeText(
                          rating?.toStringAsFixed(1) ?? '',
                          style: textTheme?.body,
                          maxLines: 1,
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
