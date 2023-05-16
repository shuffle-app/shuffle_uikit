import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitDescriptionGrid extends StatelessWidget {
  final List<DescriptionGridData> children;
  final double spacing;

  const UiKitDescriptionGrid({
    Key? key,
    required this.spacing,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 24.h,
      spacing: spacing.w,
      children: children
          .map<Widget>(
            (e) => UiKitTitledDescriptionGridWidget(
              spacing: spacing.w,
              title: e.title,
              description: e.value ?? '',
            ),
          )
          .toList(),
    );
  }
}

class DescriptionGridData {
  final String title;
  final String? value;

  const DescriptionGridData({
    required this.title,
    this.value,
  });
}
