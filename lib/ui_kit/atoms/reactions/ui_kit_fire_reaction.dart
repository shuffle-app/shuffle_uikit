import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitFireReaction extends StatelessWidget {
  final int reactionsCount;
  final VoidCallback? onTap;
  final Color? textColor;

  const UiKitFireReaction({
    Key? key,
    required this.reactionsCount,
    this.onTap,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: UiKitEmojiReaction(
        iconPath: GraphicsFoundation.instance.svg.fireEmoji.path,
        reactionsCount: reactionsCount,
        textColor: textColor,
      ),
    );
  }
}
