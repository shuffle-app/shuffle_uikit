import 'package:flutter/material.dart';
import 'package:shuffle_uikit/foundation/spacing_foundation.dart';
import 'package:shuffle_uikit/ui_kit/molecules/profile/profile_highlight_card.dart';

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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: ProfileHighlightCard(
            value: placesVisited,
            title: 'places visited',
          ),
        ),
        SpacingFoundation.horizontalSpace8,
        Expanded(
          child: ProfileHighlightCard(
            value: reviewsPosted,
            title: 'reviews posted',
          ),
        ),
        SpacingFoundation.horizontalSpace8,
        Expanded(
          child: ProfileHighlightCard(
            value: points,
            title: 'points earned',
          ),
        ),
      ],
    );
  }
}
