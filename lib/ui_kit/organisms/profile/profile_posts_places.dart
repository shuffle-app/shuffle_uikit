import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class ProfilePostsPlaces extends StatelessWidget {
  final List<ProfilePlace> places;
  final double? horizontalMargin;
  final VoidCallback? onExpand;

  const ProfilePostsPlaces({
    super.key,
    required this.places,
    this.horizontalMargin,
    this.onExpand,
  });

  @override
  Widget build(BuildContext context) {
    final itemsLeft = places.length > 4 ? places.length - 4 : places.length;

    return UiKitExpandableList(
      itemsTitle: S.current.ReviewsReceived(itemsLeft),
      horizontalMargin: horizontalMargin,
      onExpand: onExpand,
      items: places.map(
        (place) {
          final index = places.indexOf(place);

          return Column(
            children: [
              if (index != 0)
                const Divider(
                  height: 32,
                  thickness: 1,
                  color: ColorsFoundation.surface2,
                ),
              UiKitExtendedInfluencerFeedbackCard(
                title: place.title,
                imageUrl: place.image,
                datePosted: place.createdAt,
                tags: place.tags,
                text: place.postBody,
                smileyCount: place.smileyCount,
                sunglassesCount: place.sunglassesCount,
                fireCount: place.fireCount,
                thumbsUpCount: place.thumbsUpCount,
                heartEyeCount: place.heartEyeCount,
                rating: place.stars,
              ),
            ],
          ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16);
        },
      ).toList(),
    );
  }
}
