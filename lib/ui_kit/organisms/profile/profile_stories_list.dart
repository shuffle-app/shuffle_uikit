import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

/// [ProfileStoriesList] accepts [List] of [ProfileStory]
/// and displays them in a horizontal list.
class ProfileStoriesList extends StatelessWidget {
  final List<ProfileStory> stories;

  const ProfileStoriesList({
    Key? key,
    required this.stories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UiKitCardWrapper(
      borderRadius: BorderRadius.zero,
      child: SizedBox(
        height: 180,
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
