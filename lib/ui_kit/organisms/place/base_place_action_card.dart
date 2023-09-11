import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BasePlaceActionCard extends StatelessWidget {
  final String title;
  final String value;
  final SvgGenImage? vectorIconAsset;
  final AssetGenImage? rasterIconAsset;
  final VoidCallback? action;
  final AutoSizeGroup? group;

  const BasePlaceActionCard({
    Key? key,
    required this.title,
    required this.value,
    this.vectorIconAsset,
    this.rasterIconAsset,
    required this.action,
     this.group,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle =
        context.uiKitTheme?.boldTextTheme.caption1Medium.copyWith(color: ColorsFoundation.darkNeutral900);
    final valueStyle = context.uiKitTheme?.boldTextTheme.body;

    /// [matrixValues] взято из Figma
    // final List<double> matrixValues = [0.91, -0.42, 0.47, 0.88, 0, 0];
    final double radians = atan2(-0.42, 0.91);

    return UiKitCardWrapper(
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Positioned(
            right: -8.w,
            top: 24.h,
            child: Transform(
              transform: Matrix4.identity()..rotateZ(radians),
              child: ImageWidget(
                rasterAsset: rasterIconAsset,
                svgAsset: vectorIconAsset,
                height: 36.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                title,
                style: titleStyle,
                textAlign: TextAlign.left,
              ),
              Text(
                value,
                style: valueStyle,
                textAlign: TextAlign.left,
              ),
              SpacingFoundation.verticalSpace8,
      SmallOrdinaryButton(
                text: 'See more',
                onPressed: action,
          group:group
              ),
            ],
          ).paddingAll(EdgeInsetsFoundation.all12),
        ],
      ),
    );
  }
}
