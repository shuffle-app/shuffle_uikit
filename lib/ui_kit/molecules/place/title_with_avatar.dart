import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_kit/atoms/common/circular_avatar.dart';

class TitleWithAvatar extends StatelessWidget {
  final String title;
  final String avatarUrl;

  const TitleWithAvatar({
    Key? key,
    required this.title,
    required this.avatarUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = context.uiKitTheme?.boldTextTheme.title2;
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        CircularAvatar(
          avatarUrl: avatarUrl,
        ),
        SpacingFoundation.horizontalSpace12,
        Text(
          title,
          style: textStyle,
        ),
      ],
    );
  }
}
