import 'package:flutter/material.dart';
import 'package:shuffle_uikit/foundation/foundation.dart';
import 'package:shuffle_uikit/ui_kit/molecules/profile/place_widget.dart';
import 'package:shuffle_uikit/ui_models/profile/profile_post.dart';

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
          return Padding(
            padding: UiKitEdgeInsets.horizontal16,
            child: Column(
              children: [
                if (index != 0)
                  const Divider(
                    height: 32,
                    thickness: 1,
                    color: UiKitColors.dividerColor,
                  ),
                PlaceWidget(place: place),
              ],
            ),
          );
        },
        childCount: places.length,
      ),
    );
  }
}
