import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

/// [ProfileStoriesList] accepts [List] of [ProfileStory]
/// and displays them in a horizontal list.
class ProfileStoriesList extends StatelessWidget {
  final List<ProfileStory> stories;

  const ProfileStoriesList({
    super.key,
    required this.stories,
  });

  @override
  Widget build(BuildContext context) {
    return UiKitCardWrapper(
      borderRadius: BorderRadius.zero,
      child: SizedBox(
        height: 0.28125.sw * 1.75,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: stories.length,
          itemBuilder: (context, index) {
            final story = stories[index];

            return UiKitReactionPreview(
              imagePath: story.image,
            );
          },
          separatorBuilder: (context, index) => SpacingFoundation.horizontalSpace12,
        ),
      ).paddingLTRB(
        EdgeInsetsFoundation.horizontal16,
        EdgeInsetsFoundation.vertical16,
        EdgeInsetsFoundation.zero,
        EdgeInsetsFoundation.vertical16,
      ),
    );
  }
}
