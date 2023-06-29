import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BorderedUserCircleAvatar extends StatelessWidget {
  final String? imageUrl;
  final double? size;
  final BoxBorder? border;
  final String? name;

  const BorderedUserCircleAvatar({
    Key? key,
    this.imageUrl,
    this.size,
    this.border,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: border,
      ),
      child: ClipOval(
        child: ImageWidget(
          link: imageUrl,
          fit: BoxFit.cover,
          errorWidget: LargeCircularAvatarErrorWidget(
            text: name
                    ?.split(' ')
                    .map(
                      (e) => e.isNotEmpty ? e.characters.first : '',
                    )
                    .join('') ??
                '',
          ),
        ),
      ),
    );
  }
}
