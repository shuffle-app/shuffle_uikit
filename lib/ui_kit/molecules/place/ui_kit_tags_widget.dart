import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitTagsWidget extends StatelessWidget {
  final double? rating;
  final List<UiKitTag> baseTags;
  final List<UiKitTag>? uniqueTags;
  final TimeOfDay? openTo;
  final TimeOfDay? openFrom;

  const UiKitTagsWidget({
    Key? key,
    required this.baseTags,
    this.rating,
    this.uniqueTags,
    this.openTo,
    this.openFrom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final isTimeAvailable = openTo != null && openFrom != null;

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (rating != null) ...[
          UiKitCardWrapper(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ImageWidget(
                  svgAsset: GraphicsFoundation.instance.svg.star,
                  height: SpacingFoundation.horizontalSpacing16,
                  fit: BoxFit.fitHeight,
                  color: context.uiKitTheme?.colorScheme.inversePrimary,
                ),
                SpacingFoundation.horizontalSpace8,
                Text(
                  rating.toString(),
                  style: theme?.boldTextTheme.caption1Bold,
                ),
              ],
            ).paddingSymmetric(
              horizontal: EdgeInsetsFoundation.horizontal16,
              vertical: EdgeInsetsFoundation.vertical12,
            ),
          ),
          SpacingFoundation.horizontalSpace8
        ],
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: SpacingFoundation.horizontalSpacing16 + 2,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        clipBehavior: Clip.hardEdge,
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        primary: false,
                        itemBuilder: (context, index) {
                          final tag = baseTags.elementAt(index);

                          return UiKitTagWidget(
                            title: tag.title,
                            icon: tag.iconPath,
                            uniqueTag: false,
                          );
                        },
                        separatorBuilder: (context, index) => SpacingFoundation.horizontalSpace8,
                        itemCount: baseTags.length,
                      ),
                    ),
                    if (isTimeAvailable && isBetween(openFrom, openTo)) ...[
                      SpacingFoundation.horizontalSpace4,
                      Text(
                        durationFrom(TimeOfDay.now(), openTo),
                        style: theme?.boldTextTheme.caption2Medium.copyWith(
                          color: theme.colorScheme.darkNeutral900,
                        ),
                      ),
                    ] else if (isTimeAvailable) ...[
                      UiKitTag(title: 'closed', iconPath: GraphicsFoundation.instance.svg.clock.path).widget,
                      SpacingFoundation.horizontalSpace4,
                    ],
                  ],
                ),
              ),
              if (uniqueTags != null && uniqueTags!.isNotEmpty) ...[
                SpacingFoundation.verticalSpace4,
                Row(
                  children: [
                    if (isTimeAvailable && isBetween(openFrom, openTo)) ...[
                      SpacingFoundation.horizontalSpace4,
                      Text(
                        durationFrom(TimeOfDay.now(), openTo),
                        style: theme?.boldTextTheme.caption2Medium.copyWith(
                          color: theme.colorScheme.darkNeutral900,
                        ),
                      ),
                      SpacingFoundation.horizontalSpace4,
                    ] else if (isTimeAvailable) ...[
                      UiKitTag(title: 'closed', iconPath: GraphicsFoundation.instance.svg.clock.path).widget,
                      SpacingFoundation.horizontalSpace4,
                    ],
                    Expanded(
                      child: SizedBox(
                        height: SpacingFoundation.horizontalSpacing16 + 2,
                        child: ListView.separated(
                          clipBehavior: Clip.hardEdge,
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          primary: false,
                          separatorBuilder: (_, __) => SpacingFoundation.horizontalSpace8,
                          itemCount: uniqueTags!.length,
                          itemBuilder: (_, index) {
                            return UiKitTagWidget(
                              title: uniqueTags![index].title,
                              icon: uniqueTags![index].iconPath,
                              uniqueTag: true,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ],
          ),
        ),
      ],
    );
  }
}
