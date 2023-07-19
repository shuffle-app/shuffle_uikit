import 'package:flutter/material.dart';
import 'package:shuffle_uikit/ui_kit/atoms/profile/ui_kit_chip.dart';

class ProfileInterests extends StatelessWidget {
  final List<String> profileInterests;
  final List<String>? matchingInterests;

  const ProfileInterests({
    Key? key,
    required this.profileInterests,
    this.matchingInterests,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final interest in profileInterests)
          UiKitChip(
            title: interest,
            isSelected: matchingInterests?.contains(interest) ?? false,
            // border: profileInterests.indexOf(interest) == 0 ? GradientFoundation.gradientBorder : null,
          ),
      ],
    );
  }
}
