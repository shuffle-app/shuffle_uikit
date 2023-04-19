import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_kit/molecules/profile/place_widget.dart';

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
                  color: ColorsFoundation.dividerColor,
                ),
              PlaceWidget(place: place),
            ],
          ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16);
        },
        childCount: places.length,
      ),
    );
  }
}
