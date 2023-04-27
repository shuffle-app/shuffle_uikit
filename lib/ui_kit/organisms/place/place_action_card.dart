import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class PlaceActionCard extends StatelessWidget {
  final String title;
  final String value;
  final Widget icon;
  final VoidCallback? action;

  const PlaceActionCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = context.uiKitTheme?.boldTextTheme.caption1Medium.copyWith(color: ColorsFoundation.darkNeutral900);
    final valueStyle = context.uiKitTheme?.boldTextTheme.body.copyWith(color: Colors.white);

    /// [matrixValues] взято из Figma
    final List<double> matrixValues = [0.91, -0.42, 0.47, 0.88, 0, 0];
    final double radians = atan2(matrixValues[1], matrixValues[0]);
    return CardWrapper(
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Positioned(
            right: -8.w,
            top: 24.h,
            child: Transform(
              transform: Matrix4.identity()..rotateZ(radians),
              child: icon,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: titleStyle,
              ),
              Text(
                value,
                style: valueStyle,
              ),
              SpacingFoundation.verticalSpace8,
              context.button(
                text: 'See more',
                small: true,
                onPressed: action,
              ),
            ],
          ).paddingAll(EdgeInsetsFoundation.all12),
        ],
      ),
    );
  }
}

class UpcomingEventPlaceActionCard extends PlaceActionCard {
  const UpcomingEventPlaceActionCard({
    super.key,
    required super.value,
    required super.icon,
    required super.action,
  }) : super(
          title: 'Upcoming Event',
        );
}

class PointBalancePlaceActionCard extends PlaceActionCard {
  const PointBalancePlaceActionCard({
    super.key,
    required super.value,
    required super.icon,
    required super.action,
  }) : super(
          title: 'Point Balance',
        );
}
