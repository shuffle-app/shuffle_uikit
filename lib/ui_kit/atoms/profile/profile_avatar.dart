import 'package:flutter/material.dart';
import 'package:shuffle_uikit/foundation/ui_kit_border_radius.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

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
