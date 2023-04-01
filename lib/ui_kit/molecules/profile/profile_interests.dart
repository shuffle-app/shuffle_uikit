import 'package:flutter/material.dart';
import 'package:shuffle_uikit/ui_kit/atoms/profile/interest_chip.dart';

class ProfileInterests extends StatelessWidget {
  final List<String> profileInterests;
  final List<String> userInterests;

  const ProfileInterests({
    Key? key,
    required this.profileInterests,
    required this.userInterests,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final interest in profileInterests)
          InterestChip(
            interest: interest,
            isSelected: userInterests.contains(interest),
          ),
      ],
    );
  }
}
