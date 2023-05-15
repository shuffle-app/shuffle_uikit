import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BasePlaceActionCard extends StatelessWidget {
  final String title;
  final String value;
  final SvgGenImage? vectorIconAsset;
  final AssetGenImage? rasterIconAsset;
  final VoidCallback? action;

  const BasePlaceActionCard({
    Key? key,
    required this.title,
    required this.value,
    this.vectorIconAsset,
    this.rasterIconAsset,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = context.uiKitTheme?.boldTextTheme.caption1Medium.copyWith(color: ColorsFoundation.darkNeutral900);
    final valueStyle = context.uiKitTheme?.boldTextTheme.body.copyWith(color: Colors.white);

    /// [matrixValues] взято из Figma
    // final List<double> matrixValues = [0.91, -0.42, 0.47, 0.88, 0, 0];
    final double radians = atan2(-0.42, 0.91);

    return UiKitCardWrapper(
      child: Stack(
        fit: StackFit.expand,
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
            mainAxisSize: MainAxisSize.max,
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
              context.smallButton(
                text: 'See more',
                onPressed: action,
              ),
            ],
          ).paddingAll(EdgeInsetsFoundation.all12),
        ],
      ),
    );
  }
}
