import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitContentTypeColoredTile extends StatelessWidget {
  final Size size;
  final Color color;
  final String iconPath;

  const UiKitContentTypeColoredTile({
    Key? key,
    required this.size,
    required this.color,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const angle = 135 * (pi / 180);

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            width: size.width,
            height: size.height,
            transform: Transform.rotate(
              angle: angle,
            ).transform,
            transformAlignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusFoundation.all16,
              color: color,
            ),
          ),
          Container(
            width: size.width,
            height: size.height,
            transform: Transform.rotate(
              angle: angle,
            ).transform,
            transformAlignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusFoundation.all16,
              boxShadow: [
                // box-shadow: -40px 40px 60px 0px rgba(255, 255, 255, 0.10) inset, 40px -40px 60px 0px rgba(186, 186, 186, 0.10) inset, 4px -4px 10px 0px rgba(0, 0, 0, 0.32) inset, -4px 4px 10px 0px rgba(255, 255, 255, 0.50) inset;

                BoxShadow(
                  color: Colors.white.withOpacity(0.25),
                ),

                BoxShadow(
                  color: color,
                  offset: const Offset(4, 0),
                  blurRadius: 10,
                  spreadRadius: -8,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  offset: const Offset(16, 0),
                  blurRadius: 10,
                  spreadRadius: 0,
                ),
              ],
            ),
          ),
          Center(
            child: Opacity(
              opacity: 0.5,
              child: Container(
                width: size.width,
                height: size.height,
                transform: Transform.rotate(
                  angle: -angle,
                ).transform,
                transformAlignment: Alignment.center,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusFoundation.all16,
                  color: Colors.white.withOpacity(0.3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.25),
                    ),
                    BoxShadow(
                      color: color,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.35),
                      offset: const Offset(-2, -14),
                      blurRadius: 10,
                      spreadRadius: -12,
                    ),
                  ],
                ),
              ).paddingAll(EdgeInsetsFoundation.all16),
            ),
          ),
          Center(
            child: ImageWidget(
              link: iconPath,
            ),
          ),
        ],
      ),
    );
  }
}
