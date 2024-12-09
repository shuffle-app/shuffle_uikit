import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitLikeReaction extends StatelessWidget {
  final int reactionsCount;
  final VoidCallback? onTap;
  final Color? textColor;

  const UiKitLikeReaction({
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
        reactionsCount: reactionsCount,
        iconSvgGen: GraphicsFoundation.instance.svg.thumbsUpReversed,
        textColor: textColor,
      ),
    );
  }
}
