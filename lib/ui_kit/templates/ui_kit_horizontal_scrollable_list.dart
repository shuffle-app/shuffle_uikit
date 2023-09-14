import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitHorizontalScrollableList<ItemType> extends StatelessWidget {
  // final List<Widget> children;
  final double? spacing;
  final double? leftPadding;
  final ScrollController? scrollController;
  final PagingController<int, ItemType> pagingController;
  final ScrollPhysics? physics;
  final ItemWidgetBuilder<ItemType> itemBuilder;

  final progressIndicator = const SizedBox(
      width: 20,
      height: 20,
      child: GradientableWidget(
          gradient: GradientFoundation.attentionCard,
          active: true,
          child: CircularProgressIndicator.adaptive(backgroundColor: Colors.white)));

  const UiKitHorizontalScrollableList({
    Key? key,
    required this.itemBuilder,
    required this.pagingController,
    this.spacing,
    this.leftPadding,
    this.physics,
    this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, ItemType>.separated(
      physics: pagingController.itemList?.isEmpty ?? false
          ? const NeverScrollableScrollPhysics()
          : physics ?? const BouncingScrollPhysics(),
      scrollController: scrollController,
      pagingController: pagingController,
      shrinkWrap: true,
      primary: false,
      scrollDirection: Axis.horizontal,

      separatorBuilder: (_, index) => spacing?.widthBox ?? SpacingFoundation.zero.widthBox,
      builderDelegate: PagedChildBuilderDelegate<ItemType>(
        animateTransitions: true,
        firstPageProgressIndicatorBuilder: (c) => progressIndicator,
        newPageProgressIndicatorBuilder: (c) => progressIndicator,
        // itemCount: children.length + (leftPadding == null ? 1 : 2),
        itemBuilder: itemBuilder,
        noItemsFoundIndicatorBuilder: (c) => const UiKitNoContentPlaceholder().paddingAll(EdgeInsetsFoundation.all32),

        // if (index == 0 && leftPadding != null) {
        //   return (leftPadding! - (spacing ?? 0)).widthBox;
        // }
        // final newIndex = index - (leftPadding == null ? 0 : 1);
        //
        // return newIndex == children.length
        //     ? 20.w.widthBox
        //     : children[newIndex];
        // }
      ),
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
