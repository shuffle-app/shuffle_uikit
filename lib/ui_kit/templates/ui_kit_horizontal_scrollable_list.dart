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
    return ListView.separated(
        physics: physics ?? const BouncingScrollPhysics(),
        controller: scrollController,
        shrinkWrap: true,
        primary: false,
        scrollDirection: Axis.horizontal,
        itemCount: children.length + (leftPadding == null ? 1 : 2),
        separatorBuilder: (_, index) =>
            spacing?.widthBox ?? SpacingFoundation.zero.widthBox,
        itemBuilder: (c, index) {
          if (index == 0 && leftPadding != null) {
            return (leftPadding! - (spacing ?? 0)).widthBox;
          }
          final newIndex = index - (leftPadding == null ? 0 : 1);

          return newIndex == children.length
              ? 20.w.widthBox
              : children[newIndex];
        }
        // children: [(leftPadding ?? 0).widthBox, ...children, 20.w.widthBox],
        // ),
        );
    // SingleChildScrollView(
    //   physics: physics ?? const BouncingScrollPhysics(),
    //   controller: scrollController,
    //   scrollDirection: Axis.horizontal,
    //   child: Wrap(
    //     spacing: spacing ?? SpacingFoundation.zero,
    //     children: [(leftPadding ?? 0).widthBox, ...children, 20.w.widthBox],
    //   ),
    // );
  }
}
