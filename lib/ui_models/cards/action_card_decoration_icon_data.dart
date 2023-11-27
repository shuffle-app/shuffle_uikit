import 'package:flutter/cupertino.dart';

class ActionCardDecorationIconData {
  final IconData icon;
  final double? iconSize;
  final DecorationIconPosition position;
  final double rotationAngle;

  ActionCardDecorationIconData({
    required this.icon,
    required this.position,
    this.iconSize,
    this.rotationAngle = 0,
  });
}

class DecorationIconPosition {
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  DecorationIconPosition({
    this.top,
    this.bottom,
    this.left,
    this.right,
  });
}
