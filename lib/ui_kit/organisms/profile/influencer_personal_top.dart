import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class InfluencerPersonalTop extends StatelessWidget {
  final List<InfluencerTopCategory> categories;
  final Function(int? placeId, int? eventId)? onItemTap;

  const InfluencerPersonalTop({
    super.key,
    required this.categories,
    this.onItemTap,
  });

  double get contentImageWidth => 0.25.sw;

  double get contentImageHeight => contentImageWidth * 0.75;

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          S.current.PersonalTop,
          style: boldTextTheme?.title1,
        ),
        SpacingFoundation.verticalSpace16,
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          separatorBuilder: (context, index) => SpacingFoundation.verticalSpace16,
          itemBuilder: (context, index) {
            final category = categories[index];

            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: GradientableWidget(
                        gradient: GradientFoundation.defaultLinearGradient,
                        child: Text(
                          category.title,
                          style: boldTextTheme?.subHeadline.copyWith(color: Colors.white),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
                SpacingFoundation.verticalSpace16,
                ...category.items.map(
                  (content) {
                    final isLast = category.items.indexOf(content) == category.items.length - 1;

                    return GestureDetector(
                      onTap: () => onItemTap?.call(content.placeId, content.eventId),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadiusFoundation.all12,
                            child: ImageWidget(
                              link: content.imageUrl,
                              width: contentImageWidth,
                              height: contentImageHeight,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SpacingFoundation.horizontalSpace12,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  content.title,
                                  style: boldTextTheme?.caption1Bold,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  formatDifference(content.datePosted),
                                  style: boldTextTheme?.caption1Medium.copyWith(color: ColorsFoundation.mutedText),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SpacingFoundation.verticalSpace8,
                                UiKitTagsWidget(baseTags: content.tags),
                              ],
                            ),
                          ),
                        ],
                      ).paddingOnly(bottom: isLast ? 0 : EdgeInsetsFoundation.vertical16),
                    );
                  },
                ),
              ],
            );
          },
          itemCount: categories.length,
        ),
      ],
    );
  }
}
