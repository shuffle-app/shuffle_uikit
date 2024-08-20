import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitEmojiReaction extends StatelessWidget {
  final String iconPath;
  final int reactionsCount;
  final Color? textColor;

  const UiKitEmojiReaction({
    super.key,
    required this.iconPath,
    required this.reactionsCount,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          reactionsFormatter(reactionsCount),
          style: regularTextTheme?.caption2.copyWith(color: textColor),
        ),
        ImageWidget(link: iconPath),
      ],
    );
  }

  String reactionsFormatter(int reactionsCount) {
    if (reactionsCount == 0) return '';

    if (reactionsCount > 1000) {
      return '+1000';
    } else if (reactionsCount > 100) {
      return '+100';
    } else if (reactionsCount > 10) {
      return '+10';
    } else {
      return reactionsCount.toString();
    }
  }
}
