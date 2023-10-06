import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitContentTypeEmptyTile extends StatelessWidget {
  final Size size;
  final double? customRotationAngle;

  const UiKitContentTypeEmptyTile({
    Key? key,
    required this.size,
    this.customRotationAngle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final angle = customRotationAngle ?? 135 * (pi / 180);

    return Container(
      width: size.width,
      height: size.height,
      clipBehavior: Clip.hardEdge,
      transform: Transform.rotate(
        angle: angle,
      ).transform,
      transformAlignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusFoundation.all8,
        boxShadow: [
          //2px -2px 4px 0px rgba(0, 0, 0, 0.32)
          BoxShadow(
            color: Colors.white.withOpacity(0.15),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: const Offset(4, -1),
            blurRadius: 4,
            spreadRadius: -2,
          ),
        ],
      ),
    );
  }
}
