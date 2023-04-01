import 'package:flutter/material.dart';
import 'package:shuffle_uikit/foundation/ui_kit_border_radius.dart';

class ProfileAvatar extends StatelessWidget {
  final String avatarLink;

  const ProfileAvatar({
    Key? key,
    required this.avatarLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: UiKitBorderRadius.all24,
      child: Image.asset(
        avatarLink,
        package: 'shuffle_uikit',
      ),
    );
  }
}
