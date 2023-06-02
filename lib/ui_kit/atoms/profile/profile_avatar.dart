import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class ProfileAvatar extends StatelessWidget {
  final String avatarLink;
  final String? name;

  const ProfileAvatar({
    Key? key,
    required this.avatarLink,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorAvatarText = name?.split(' ').map((e) => e.characters.first).join('') ?? '';

    return ClipRRect(
      borderRadius: BorderRadiusFoundation.all24,
      child: ImageWidget(
        link: avatarLink,
        errorWidget: BigAvatarErrorWidget(text: errorAvatarText),
        // package: 'shuffle_uikit',
      ),
    );
  }
}
