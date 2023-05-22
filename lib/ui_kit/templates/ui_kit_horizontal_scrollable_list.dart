import 'package:flutter/material.dart';
import 'package:shuffle_uikit/foundation/shuffle_ui_kit_foundation.dart';

class UiKitHorizontalScrollableList extends StatelessWidget {
  final List<Widget> children;
  final double? spacing;

  const UiKitHorizontalScrollableList({
    Key? key,
    required this.children,
    this.spacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: spacing ?? SpacingFoundation.horizontalSpacing8,
        children: children,
      ),
    );
  }
}
