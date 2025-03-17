import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitProUserProfileEventCard extends StatelessWidget {
  final String? previewImage;
  final String title;
  final DateTime contentDate;
  final double? rating;
  final List<UiKitTag>? properties;
  final List<ProfileVideoReaction>? videoReactions;
  final List<UiKitFeedbackCard>? reviews;
  final VoidCallback? onTap;

  const UiKitProUserProfileEventCard({
    super.key,
    required this.title,
    required this.contentDate,
    this.previewImage,
    this.rating,
    this.properties,
    this.videoReactions,
    this.reviews,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final isSmallScreen = MediaQuery.sizeOf(context).width <= 375;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GestureDetector(
            onTap: onTap,
            child:
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusFoundation.all12,
                  child: ImageWidget(
                    link: previewImage,
                    width: 0.25.sw,
                    height: 0.25.sw * 0.75,
                    fit: BoxFit.cover,
                  ),
                ),
                SpacingFoundation.horizontalSpace12,
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: title,
                          style: boldTextTheme?.caption1Bold,
                        ),
                        TextSpan(
                          text:
                          '\n${DateFormat('MMM dd, yyyy', Localizations
                              .localeOf(context)
                              .languageCode).format(contentDate)}',
                          style: boldTextTheme?.caption1Medium.copyWith(color: ColorsFoundation.mutedText),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
        SpacingFoundation.verticalSpace16,
        UiKitTagsWidget(
          baseTags: properties?.where((element) => !element.unique).toList() ?? [],
          uniqueTags: properties?.where((element) => element.unique).toList() ?? [],
        ),
        SpacingFoundation.verticalSpace16,
        if (videoReactions != null && videoReactions!.isNotEmpty)
          SizedBox(
            height: 0.1875.sw,
            width: 1.sw,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final story = videoReactions!.elementAt(index);

                return UiKitReactionPreview(
                  imagePath: story.image,
                  customWidth: 0.1875.sw,
                  customHeight: 0.1875.sw,
                  isEmpty: story.isEmpty,
                  viewed: story.viewed,
                  onTap: story.onTap,
                );
              },
              separatorBuilder: (context, index) => SpacingFoundation.horizontalSpace8,
              itemCount: videoReactions!.length,
            ),
          ),
        if (videoReactions != null && videoReactions!.isNotEmpty) SpacingFoundation.verticalSpace16,
        if (reviews != null && reviews!.isNotEmpty)
          SizedBox(
            height: 0.27.sh,
            width: 1.sw,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SpacingFoundation.horizontalSpace8,
              itemBuilder: (context, index) =>
                  SizedBox(
                    height: (isSmallScreen ? 168.5.h : 0.286.sh),
                    width: 0.859375.sw,
                    child: reviews!.elementAt(index),
                  ),
              itemCount: reviews!.length,
            ),
          ),
      ],
    );
  }
}
