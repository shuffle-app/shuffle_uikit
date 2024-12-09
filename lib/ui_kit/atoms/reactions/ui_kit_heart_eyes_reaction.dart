import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitHeartEyesReaction extends StatelessWidget {
  final int reactionsCount;
  final VoidCallback? onTap;
  final Color? textColor;

  const UiKitHeartEyesReaction({
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
        iconSvgGen: GraphicsFoundation.instance.svg.heartEyes,
        textColor: textColor,
      ),
    );
  }
}
