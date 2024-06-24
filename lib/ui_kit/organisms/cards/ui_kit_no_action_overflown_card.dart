import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitNoActionOverflownCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final List<ActionCardDecorationIconData> decorationIcons;
  final double? horizontalMargin;
  final VoidCallback? onTap;

  const UiKitNoActionOverflownCard({
    super.key,
    required this.title,
    this.subtitle,
    required this.decorationIcons,
    this.horizontalMargin,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;

    return LayoutBuilder(
      builder: (context, size) {
        final screenUtil = ScreenUtil();
        final calculatedHeight = size.maxWidth * 0.225;
        const designHeight = 72;
        final designWidth = screenUtil.screenWidth / screenUtil.scaleWidth;

        return Stack(
          fit: StackFit.passthrough,
          clipBehavior: Clip.none,
          children: [
            Material(
              borderRadius: BorderRadiusFoundation.all24,
              clipBehavior: Clip.hardEdge,
              color: context.uiKitTheme?.cardColor,
              child: InkWell(
                onTap: onTap,
                child: Ink(
                  height: calculatedHeight,
                  width: size.maxWidth - (horizontalMargin ?? 32),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            title,
                            style: boldTextTheme?.body,
                          ),
                          if (subtitle != null)
                            Text(
                              subtitle!,
                              style: regularTextTheme?.caption2,
                            ),
                        ],
                      ).paddingAll(EdgeInsetsFoundation.all16),
                      ...decorationIcons.map<Widget>(
                        (e) {
                          final relativeTop = e.position.top == null ? null : (e.position.top! / designHeight) * calculatedHeight;
                          final relativeBottom =
                              e.position.bottom == null ? null : (e.position.bottom! / designHeight) * calculatedHeight;
                          final relativeLeft = e.position.left == null ? null : (e.position.left! / designWidth) * size.maxWidth;
                          final relativeRight =
                              e.position.right == null ? null : (e.position.right! / designWidth) * size.maxWidth;
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
              ),
            ).paddingSymmetric(horizontal: horizontalMargin ?? EdgeInsetsFoundation.horizontal16),
            Positioned(
              bottom: -12,
              right: horizontalMargin ?? EdgeInsetsFoundation.horizontal16,
              child: UiKitCardWrapper(
                color: context.uiKitTheme?.colorScheme.surface5,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      S.current.UnderService,
                      style: regularTextTheme?.caption4Regular,
                    ),
                    SpacingFoundation.horizontalSpace4,
                    ImageWidget(
                      svgAsset: GraphicsFoundation.instance.svg.roadworks,
                      height: 16,
                      fit: BoxFit.fitHeight,
                    ),
                  ],
                ).paddingSymmetric(
                  horizontal: EdgeInsetsFoundation.horizontal8,
                  vertical: EdgeInsetsFoundation.vertical4,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
