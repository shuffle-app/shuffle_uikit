import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlaceDescriptionGrid extends StatelessWidget {
  final List<Widget> children;
  final double spacing;

  const PlaceDescriptionGrid({
    Key? key,
    required this.spacing,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 24.h,
      spacing: spacing.w,
      children: children,
    );
  }
}
