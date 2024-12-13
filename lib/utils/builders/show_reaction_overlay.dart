import 'package:flutter/material.dart';

import '../../shuffle_uikit.dart';

void hideReactionOverlay(OverlayEntry? overlayEntry) {
  overlayEntry?.remove();
  overlayEntry = null;
}

void showReactionOverlay(
  BuildContext context,
  OverlayEntry? overlayEntry,
  Color? reactionTextColor,
  ValueChanged<String>? onReactionsTapped,
) {
  RenderBox renderBox = context.findRenderObject() as RenderBox;
  Offset position = renderBox.localToGlobal(Offset.zero);
  overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: position.dy - 40,
      right: 0,
      child: Material(
        color: Colors.transparent,
        child: UiKitCardWrapper(
          padding: EdgeInsets.all(EdgeInsetsFoundation.all8),
          child: TapRegion(
            onTapOutside: (event) {
              hideReactionOverlay.call(overlayEntry);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                UiKitHeartEyesReaction(
                  reactionsCount: 0,
                  textColor: reactionTextColor,
                  onTap: () {
                    onReactionsTapped?.call('heart_eyes');
                    hideReactionOverlay(overlayEntry);
                    showAnimatedReactionOverlay(context, reaction: GraphicsFoundation.instance.svg.heartEyes);
                  },
                ),
                SpacingFoundation.horizontalSpace4,
                UiKitLikeReaction(
                  reactionsCount: 0,
                  textColor: reactionTextColor,
                  onTap: () {
                    onReactionsTapped?.call('like');
                    hideReactionOverlay(overlayEntry);
                    showAnimatedReactionOverlay(context, reaction: GraphicsFoundation.instance.svg.thumbsUpReversed);
                  },
                ),
                SpacingFoundation.horizontalSpace4,
                UiKitFireReaction(
                  reactionsCount: 0,
                  textColor: reactionTextColor,
                  onTap: () {
                    onReactionsTapped?.call('fire');
                    hideReactionOverlay(overlayEntry);
                    showAnimatedReactionOverlay(context, reaction: GraphicsFoundation.instance.svg.fire);
                  },
                ),
                SpacingFoundation.horizontalSpace4,
                UiKitSunglassesReaction(
                  reactionsCount: 0,
                  textColor: reactionTextColor,
                  onTap: () {
                    onReactionsTapped?.call('sunglasses');
                    hideReactionOverlay(overlayEntry);
                    showAnimatedReactionOverlay(context, reaction: GraphicsFoundation.instance.svg.sunglasses);
                  },
                ),
                SpacingFoundation.horizontalSpace4,
                UiKitSmileyReaction(
                  reactionsCount: 0,
                  onTap: () {
                    onReactionsTapped?.call('smiley');
                    hideReactionOverlay(overlayEntry);
                    showAnimatedReactionOverlay(context, reaction: GraphicsFoundation.instance.svg.smiley);
                  },
                  textColor: reactionTextColor,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );

  Overlay.of(context).insert(overlayEntry);
}

showAnimatedReactionOverlay(
  BuildContext context, {
  required SvgGenImage reaction,
  OverlayEntry? overlayEntry,
}) {
  RenderBox renderBox = context.findRenderObject() as RenderBox;
  Offset position = renderBox.localToGlobal(Offset.zero);
  overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: position.dy+40,
      right: 40,
      child: Material(
        color: Colors.transparent,
        child: ReactionAnimation(
          reaction: reaction,
          onAnimationEnd: () {
            hideReactionOverlay(overlayEntry);
          },
        ),
      ),
    ),
  );

  Overlay.of(context).insert(overlayEntry);
}
