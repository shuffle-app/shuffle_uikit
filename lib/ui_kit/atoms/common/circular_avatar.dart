import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class CircularAvatar extends StatelessWidget {
  final String avatarUrl;
  final double? height;
  final String? name;

  const CircularAvatar({
    super.key,
    required this.avatarUrl,
    this.height,
    this.name,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: ImageWidget(
        height: height ?? SpacingFoundation.verticalSpacing24,
        width: height ?? SpacingFoundation.verticalSpacing24,
        link: avatarUrl,
        errorWidget: LargeCircularAvatarErrorWidget(
            text: name?.split(' ').map((e) =>
            e.isNotEmpty
                ? e.characters.first
                : '').join('') ?? ''),
        fit: BoxFit.cover,
      ),
    );
  }
}
