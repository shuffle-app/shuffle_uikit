import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitTagsWidget extends StatelessWidget {
  final double? rating;
  final List<UiKitTag> baseTags;
  final List<UiKitTag>? uniqueTags;

  const UiKitTagsWidget({
    Key? key,
    this.rating,
    required this.baseTags,
    this.uniqueTags,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

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
                child: ListView.separated(
                  clipBehavior: Clip.hardEdge,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
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
              if (uniqueTags != null && uniqueTags!.isNotEmpty) ...[
                SpacingFoundation.verticalSpace4,
                SizedBox(
                  height: SpacingFoundation.horizontalSpacing16 + 2,
                  child: ListView.separated(
                    clipBehavior: Clip.hardEdge,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
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
                )
              ],
            ],
          ),
        ),
      ],
    );
  }
}
