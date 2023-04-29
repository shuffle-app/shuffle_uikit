import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class CircularAvatar extends StatelessWidget {
  final String avatarUrl;
  const CircularAvatar({Key? key, required this.avatarUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: ImageWidget(
        height: SpacingFoundation.verticalSpacing24,
        link: avatarUrl,
        // package: 'shuffle_uikit',
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
