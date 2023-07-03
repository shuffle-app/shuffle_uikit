import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitHorizontalScrollableList extends StatelessWidget {
  final List<Widget> children;
  final double? spacing;
  final double? leftPadding;
  final ScrollController? scrollController;
  final ScrollPhysics? physics;

  const UiKitHorizontalScrollableList({
    Key? key,
    required this.children,
    this.spacing,
    this.leftPadding,
    this.physics,
    this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: physics ?? const BouncingScrollPhysics(),
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: spacing ?? SpacingFoundation.zero,
        children: [(leftPadding ?? 0).widthBox, ...children, 20.w.widthBox],
      ),
    );
  }
}
