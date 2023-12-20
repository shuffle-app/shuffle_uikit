import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitHorizontalScrollableList<ItemType> extends StatelessWidget {
  // final List<Widget> children;
  final double? spacing;
  final double? leftPadding;
  final ScrollController? scrollController;
  final PagingController<int, ItemType> pagingController;
  final ScrollPhysics? physics;
  final ItemWidgetBuilder<ItemType> itemBuilder;
  final Widget? shimmerLoadingChild;

  late final progressIndicator = Shimmer(
    gradient: GradientFoundation.greyGradient,
    child: shimmerLoadingChild ?? Container(),
  );

  UiKitHorizontalScrollableList({
    Key? key,
    required this.itemBuilder,
    required this.pagingController,
    this.spacing,
    this.leftPadding,
    this.physics,
    this.scrollController,
    this.shimmerLoadingChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, ItemType>.separated(
      physics: pagingController.itemList?.isEmpty ?? false
          ? const NeverScrollableScrollPhysics()
          : physics ?? const BouncingScrollPhysics(),
      scrollController: scrollController,
      pagingController: pagingController,
      clipBehavior: Clip.none,
      shrinkWrap: true,
      primary: false,
      scrollDirection: Axis.horizontal,
      addAutomaticKeepAlives: true,
      cacheExtent: 5,
      separatorBuilder: (_, index) => spacing?.widthBox ?? SpacingFoundation.zero.widthBox,
      builderDelegate: PagedChildBuilderDelegate<ItemType>(
        animateTransitions: true,
        firstPageProgressIndicatorBuilder: (c) => progressIndicator,
        newPageProgressIndicatorBuilder: (c) => progressIndicator,
        itemBuilder: itemBuilder,
        noItemsFoundIndicatorBuilder: (c) => const UiKitNoContentPlaceholder().paddingAll(EdgeInsetsFoundation.all32),
      ),
    );
  }
}
