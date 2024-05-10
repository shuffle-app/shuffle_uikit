import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitProUserProfileEventCard extends StatelessWidget {
  final String? previewImage;
  final String title;
  final DateTime contentDate;
  final double? rating;
  final List<UiKitTag>? properties;
  final List<ProfileStory>? stories;
  final List<UiKitFeedbackCard>? reviews;

  const UiKitProUserProfileEventCard({
    Key? key,
    required this.title,
    required this.contentDate,
    this.previewImage,
    this.rating,
    this.properties,
    this.stories,
    this.reviews,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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
                      text: '\n${DateFormat('MMM dd, yyyy', Localizations.localeOf(context).languageCode).format(contentDate)}',
                      style: boldTextTheme?.caption1Medium.copyWith(color: ColorsFoundation.mutedText),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SpacingFoundation.verticalSpace16,
        UiKitTagsWidget(
          baseTags: properties?.where((element) => !element.unique).toList() ?? [],
          uniqueTags: properties?.where((element) => element.unique).toList() ?? [],
        ),
        SpacingFoundation.verticalSpace16,
        if (stories != null && stories!.isNotEmpty)
          SizedBox(
            height: 0.1875.sw,
            width: 1.sw,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final story = stories!.elementAt(index);

                return UiKitReactionPreview(
                  imagePath: story.image,
                  customWidth: 0.1875.sw,
                  customHeight: 0.1875.sw,
                  isEmpty: story.isEmpty,
                  viewed: story.viewed,
                  onTap: () {},
                );
              },
              separatorBuilder: (context, index) => SpacingFoundation.horizontalSpace8,
              itemCount: stories!.length,
            ),
          ),
        if (stories != null && stories!.isNotEmpty) SpacingFoundation.verticalSpace16,
        if (reviews != null && reviews!.isNotEmpty)
          SizedBox(
            height: 0.27.sh,
            width: 1.sw,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SpacingFoundation.horizontalSpace8,
              itemBuilder: (context, index) => SizedBox(
                height: 0.27.sh,
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
