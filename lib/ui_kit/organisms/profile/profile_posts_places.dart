import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class ProfilePostsPlaces extends StatelessWidget {
  final List<ProfilePlace> places;

  const ProfilePostsPlaces({
    Key? key,
    required this.places,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final place = places[index];

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
                helpfulCount: place.helpfulCount,
                rating: place.stars,
              ),
            ],
          ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16);
        },
        childCount: places.length,
      ),
    );
  }
}
