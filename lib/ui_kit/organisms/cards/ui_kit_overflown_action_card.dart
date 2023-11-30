import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

/// all sizes in [ActionCardDecorationIconData] and [DecorationIconPosition]
/// are relative to the design size of the card
/// so, they are responsive to the card size

class UiKitOverflownActionCard extends StatelessWidget {
  final Widget title;
  final Widget action;
  final double? horizontalMargin;
  final String? overflownIconLink;
  final IconData? overflownIcon;
  final List<ActionCardDecorationIconData> decorationIcons;

  const UiKitOverflownActionCard({
    super.key,
    required this.title,
    this.horizontalMargin,
    required this.action,
    this.overflownIconLink,
    this.overflownIcon,
    required this.decorationIcons,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        final screenUtil = ScreenUtil();
        final calculatedHeight = size.maxWidth * 0.4179;
        final overflownIconWidth = size.maxWidth * 0.325;
        const designHeight = 112;
        final designWidth = screenUtil.screenWidth / screenUtil.scaleWidth;

        return SizedBox(
          height: calculatedHeight,
          width: size.maxWidth,
          child: Stack(
            fit: StackFit.expand,
            children: [
              UiKitCardWrapper(
                height: calculatedHeight,
                width: size.maxWidth - (horizontalMargin ?? 32),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        title,
                        action,
                      ],
                    ).paddingAll(EdgeInsetsFoundation.all16),
                    Positioned(
                      right: -overflownIconWidth * 0.25,
                      bottom: -8,
                      child: Transform.rotate(
                        angle: -pi / 12,
                        child: ImageWidget(
                          link: overflownIconLink,
                          iconData: overflownIcon,
                          fit: BoxFit.fitHeight,
                          height: calculatedHeight * 0.92,
                        ),
                      ),
                    ),
                    ...decorationIcons.map<Widget>(
                      (e) {
                        final relativeTop = e.position.top == null ? null : (e.position.top! / designHeight) * calculatedHeight;
                        final relativeBottom =
                            e.position.bottom == null ? null : (e.position.bottom! / designHeight) * calculatedHeight;
                        final relativeLeft = e.position.left == null ? null : (e.position.left! / designWidth) * size.maxWidth;
                        final relativeRight = e.position.right == null ? null : (e.position.right! / designWidth) * size.maxWidth;
                        final relativeIconHeight = e.iconSize == null ? null : (e.iconSize! / designHeight) * calculatedHeight;

                        return Positioned(
                          top: relativeTop,
                          bottom: relativeBottom,
                          left: relativeLeft,
                          right: relativeRight,
                          child: Transform.rotate(
                            angle: e.rotationAngle * (pi / 180),
                            child: ImageWidget(
                              iconData: e.icon,
                              link: e.iconLink,
                              width: relativeIconHeight,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ).paddingOnly(left: horizontalMargin ?? 0);
  }
}
