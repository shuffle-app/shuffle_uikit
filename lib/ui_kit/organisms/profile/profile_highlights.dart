import 'package:flutter/material.dart';
import 'package:shuffle_uikit/foundation/ui_kit_spacing.dart';
import 'package:shuffle_uikit/ui_kit/molecules/profile/profile_highlights_card.dart';

class ProfileHighlights extends StatelessWidget {
  final int placesVisited;
  final int reviewsPosted;
  final int points;

  const ProfileHighlights({
    Key? key,
    required this.placesVisited,
    required this.reviewsPosted,
    required this.points,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Frame 364 in Figma
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProfileHighlightCard(
          value: placesVisited,
          title: 'places visited',
        ),
        UiKitSpacing.horizontalSpace16,
        ProfileHighlightCard(
          value: reviewsPosted,
          title: 'reviews posted',
        ),
        UiKitSpacing.horizontalSpace16,
        ProfileHighlightCard(
          value: points,
          title: 'points earned',
        ),
      ],
    );
  }
}
