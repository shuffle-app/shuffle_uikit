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
                  },
                ),
                SpacingFoundation.horizontalSpace4,
                UiKitLikeReaction(
                  reactionsCount: 0,
                  textColor: reactionTextColor,
                  onTap: () {
                    onReactionsTapped?.call('like');
                    hideReactionOverlay(overlayEntry);
                  },
                ),
                SpacingFoundation.horizontalSpace4,
                UiKitFireReaction(
                  reactionsCount: 0,
                  textColor: reactionTextColor,
                  onTap: () {
                    onReactionsTapped?.call('fire');
                    hideReactionOverlay(overlayEntry);
                  },
                ),
                SpacingFoundation.horizontalSpace4,
                UiKitSunglassesReaction(
                  reactionsCount: 0,
                  textColor: reactionTextColor,
                  onTap: () {
                    onReactionsTapped?.call('sunglasses');
                    hideReactionOverlay(overlayEntry);
                  },
                ),
                SpacingFoundation.horizontalSpace4,
                UiKitSmileyReaction(
                  reactionsCount: 0,
                  onTap: () {
                    onReactionsTapped?.call('smiley');
                    hideReactionOverlay(overlayEntry);
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
