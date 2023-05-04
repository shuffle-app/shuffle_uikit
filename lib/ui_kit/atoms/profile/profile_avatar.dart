import 'package:flutter/material.dart';
import 'package:shuffle_uikit/ui_kit_external.dart';

class ProfileAvatar extends StatelessWidget {
  final String avatarLink;

  const ProfileAvatar({
    Key? key,
    required this.avatarLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusFoundation.all24,
      child: ImageWidget(
        link: avatarLink,
        // package: 'shuffle_uikit',
      ),
    );
  }
}
