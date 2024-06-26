import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitDescriptionGrid extends StatelessWidget {
  final List<DescriptionGridData> children;
  final double spacing;

  const UiKitDescriptionGrid({
    super.key,
    required this.spacing,
    required this.children,
  });

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
