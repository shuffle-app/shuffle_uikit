import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitTagsWidget extends StatelessWidget {
  final double? rating;
  final List<UiKitTag> baseTags;
  final List<UiKitTag>? uniqueTags;

  const UiKitTagsWidget({
    super.key,
    this.rating,
    required this.baseTags,
    this.uniqueTags,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (rating != null) ...[
          UiKitCardWrapper(
            height: SpacingFoundation.horizontalSpacing16 + 2 + SpacingFoundation.horizontalSpacing24 +SpacingFoundation.verticalSpacing4,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ImageWidget(
                  iconData: ShuffleUiKitIcons.star,
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
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  primary: false,
                  itemBuilder: (context, index) {
                    final tag = baseTags.elementAt(index);

                    return tag.widget;
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
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    primary: false,
                    separatorBuilder: (_, __) => SpacingFoundation.horizontalSpace8,
                    itemCount: uniqueTags!.length,
                    itemBuilder: (_, index) {
                      return uniqueTags![index].widget;
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
