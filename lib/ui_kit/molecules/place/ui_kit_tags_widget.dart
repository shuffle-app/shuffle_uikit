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
                  height: 16.h,
                  fit: BoxFit.fitHeight,
                ),
                SpacingFoundation.horizontalSpace8,
                Text(
                  rating.toString(),
                  style: theme?.boldTextTheme.caption1Bold
                      .copyWith(color: Colors.white),
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: SpacingFoundation.horizontalSpacing8,
                  children: baseTags
                      .map((e) => UiKitTagWidget(
                            title: e.title,
                            icon: e.iconPath,
                            uniqueTag: e.unique,
                          ))
                      .toList(),
                ),
              ),
              if (uniqueTags != null && uniqueTags!.isNotEmpty) ...[
                SpacingFoundation.verticalSpace4,
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Wrap(
                //     spacing: SpacingFoundation.horizontalSpacing8,
                //     children: uniqueTags!.map((e) => UiKitTagWidget(title: e.title, icon: e.iconPath, uniqueTag: true)).toList(),
                //   ),
                // ),
                SizedBox(
                    height: SpacingFoundation.horizontalSpacing16,
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      primary: false,
                      separatorBuilder: (_, __) =>
                          SpacingFoundation.horizontalSpace8,
                      itemCount: uniqueTags!.length,
                      itemBuilder: (_, index) => UiKitTagWidget(
                          title: uniqueTags![index].title,
                          icon: uniqueTags![index].iconPath,
                          uniqueTag: true),
                    ))
              ],
            ],
          ),
        ),
      ],
    );
  }
}
