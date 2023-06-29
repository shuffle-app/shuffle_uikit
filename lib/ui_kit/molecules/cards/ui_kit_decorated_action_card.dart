import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitDecoratedActionCard extends StatelessWidget {
  final String title;
  final Widget action;
  final List<ActionCardDecorationIconData>? decorationIcons;

  const UiKitDecoratedActionCard({
    super.key,
    required this.title,
    required this.action,
    this.decorationIcons,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        final screenUtil = ScreenUtil();
        final calculatedHeight = size.maxWidth * 0.305;
        const designHeight = 88;
        final designWidth = screenUtil.screenWidth / screenUtil.scaleWidth;

        return UiKitCardWrapper(
          width: size.maxWidth,
          height: calculatedHeight,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: SpacingFoundation.verticalSpacing16,
                left: SpacingFoundation.horizontalSpacing16,
                child: Text(
                  title,
                  style: context.uiKitTheme?.boldTextTheme.body,
                ),
              ),
              Positioned(
                bottom: SpacingFoundation.verticalSpacing16,
                left: SpacingFoundation.horizontalSpacing16,
                child: action,
              ),
              ...decorationIcons?.map<Widget>((e) {
                    final relativeTop = e.position.top == null ? null : (e.position.top! / designHeight) * calculatedHeight;
                    final relativeBottom = e.position.bottom == null ? null : (e.position.bottom! / designHeight) * calculatedHeight;
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
                          link: e.iconLink,
                          width: relativeIconHeight,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }).toList() ??
                  [],
            ],
          ),
        );
      },
    );
  }
}
