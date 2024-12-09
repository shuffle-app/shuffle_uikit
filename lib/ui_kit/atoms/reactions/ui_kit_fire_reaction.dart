import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitFireReaction extends StatelessWidget {
  final int reactionsCount;
  final VoidCallback? onTap;
  final Color? textColor;

  const UiKitFireReaction({
    super.key,
    required this.reactionsCount,
    this.onTap,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: UiKitEmojiReaction(
        iconSvgGen: GraphicsFoundation.instance.svg.fireEmoji,
        reactionsCount: reactionsCount,
        textColor: textColor,
      ),
    );
  }
}
