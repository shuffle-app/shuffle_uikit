import 'package:flutter/material.dart';
import 'package:shuffle_uikit/tokens/tokens.dart';
import 'package:shuffle_uikit/ui_kit/atoms/profile/profile_story_widget.dart';
import 'package:shuffle_uikit/ui_models/profile/profile_story.dart';

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
    return CardWrapper(
      borderRadius: BorderRadius.zero,
      padding: EdgeInsetsFoundation.all16,
      child: SizedBox(
        height: 180,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: stories.length,
          itemBuilder: (context, index) {
            final story = stories[index];
            return ProfileStoryWidget(
              imagePath: story.image,
            );
          },
          separatorBuilder: (context, index) => SpacingFoundation.horizontalSpace12,
        ),
      ),
    );
  }
}
