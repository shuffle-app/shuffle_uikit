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
  final Widget? noItemsFoundIndicator;

  late final progressIndicator = Shimmer.fromColors(
    direction: ShimmerDirection.ltr,
    baseColor: Colors.white,
    period: const Duration(milliseconds: 1000),
    highlightColor: ColorsFoundation.gradientGreyLight3,
    child: shimmerLoadingChild ?? Container(),
  );

  UiKitHorizontalScrollableList({
    super.key,
    required this.itemBuilder,
    required this.pagingController,
    this.noItemsFoundIndicator,
    this.spacing,
    this.leftPadding,
    this.physics,
    this.scrollController,
    this.shimmerLoadingChild,
  });

  @override
  Widget build(BuildContext context) {
    return PagingListener(
        controller: pagingController,
        builder: (context, state, fetchNextPage) => PagedListView<int, ItemType>.separated(
              physics: state.items?.isEmpty ?? false
                  ? const NeverScrollableScrollPhysics()
                  : physics ?? const BouncingScrollPhysics(),
              scrollController: scrollController,
              state: state,
              clipBehavior: Clip.none,
              shrinkWrap: true,
              primary: false,
              scrollDirection: Axis.horizontal,
              addAutomaticKeepAlives: false,
              cacheExtent: 5,
              separatorBuilder: (_, index) => spacing?.widthBox ?? SpacingFoundation.zero.widthBox,
              builderDelegate: PagedChildBuilderDelegate<ItemType>(
                animateTransitions: true,
                firstPageProgressIndicatorBuilder: (c) => progressIndicator,
                newPageProgressIndicatorBuilder: (c) => progressIndicator,
                itemBuilder: itemBuilder,
                noMoreItemsIndicatorBuilder: (c) => const SizedBox.shrink(),
                noItemsFoundIndicatorBuilder: (c) =>
                    noItemsFoundIndicator ?? const UiKitNoContentPlaceholder().paddingAll(EdgeInsetsFoundation.all32),
              ),
              fetchNextPage: fetchNextPage,
            ));
  }
}
