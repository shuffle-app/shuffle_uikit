import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitOverflownActionCard extends StatelessWidget {
  final Widget title;
  final Widget action;
  final ImageWidget overflownIcon;
  final List<OverflownActionCardDecorationIconData> decorationIcons;

  const UiKitOverflownActionCard({
    super.key,
    required this.title,
    required this.action,
    required this.overflownIcon,
    required this.decorationIcons,
  });

  @override
  Widget build(BuildContext context) {
    return UiKitCardWrapper(
      child: Stack(
        fit: StackFit.passthrough,
        children: [],
      ),
    );
  }
}

class OverflownActionCardDecorationIconData {
  final ImageWidget icon;
  final Offset position;
  final double? size;
  final double rotationAngle;

  OverflownActionCardDecorationIconData({
    required this.icon,
    required this.position,
    this.size,
    required this.rotationAngle,
  });
}
