import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:sliver_tools/sliver_tools.dart';

class BlurredAppPageWithPagination<T> extends StatelessWidget {
  final String title;
  final Widget? customTitle;
  final bool? autoImplyLeading;
  final bool centerTitle;
  final Widget? appBarBody;
  final Widget? appBarTrailing;
  final Widget? leading;
  final PagingController<int, T> paginationController;
  final ScrollController? scrollController;
  final Widget? topFixedAddition;
  final ScrollPhysics? physics;
  final double? customToolbarHeight;
  final animDuration = const Duration(milliseconds: 250);
  final bool? canFoldAppBar;
  final double? customToolbarBaseHeight;
  final ScrollViewKeyboardDismissBehavior? keyboardDismissBehavior;
  final PagedChildBuilderDelegate<T> builderDelegate;
  final double? bodyBottomSpace;
  final double? childrenSpacing;
  final Key? animatedListKey;
  final String? onIWidgetInfoString;
  final EdgeInsets? padding;

  const BlurredAppPageWithPagination({
    super.key,
    required this.paginationController,
    required this.builderDelegate,
    this.padding,
    this.scrollController,
    this.title = '',
    this.customTitle,
    this.autoImplyLeading,
    this.leading,
    this.canFoldAppBar,
    this.appBarBody,
    this.physics,
    this.appBarTrailing,
    this.customToolbarHeight,
    this.customToolbarBaseHeight,
    this.centerTitle = false,
    this.topFixedAddition,
    this.keyboardDismissBehavior,
    this.childrenSpacing,
    this.animatedListKey,
    this.bodyBottomSpace,
    this.onIWidgetInfoString,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      physics: physics ?? (Platform.isIOS ? const BouncingScrollPhysics() : const ClampingScrollPhysics()),
      cacheExtent: 0.5.sh,
      keyboardDismissBehavior: keyboardDismissBehavior ?? ScrollViewKeyboardDismissBehavior.manual,
      slivers: [
        MultiSliver(
          children: [
            SliverLayoutBuilder(
              builder: (context, sliverConstraints) {
                double toolbarHeight =
                    (customToolbarBaseHeight ?? context.uiKitTheme?.customAppBapTheme.toolbarHeight ?? 90.0);
                double expandedHeight = appBarBody == null ? toolbarHeight : customToolbarHeight ?? 190.0;

                final hideAppBarBody =
                    appBarBody == null ? true : canFoldAppBar ?? sliverConstraints.scrollOffset > toolbarHeight;

                return SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  pinned: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusFoundation.onlyBottom24,
                  ),
                  collapsedHeight: canFoldAppBar ?? true ? toolbarHeight : expandedHeight,
                  expandedHeight: expandedHeight,
                  flexibleSpace: CustomAppBar(
                    onIWidgetInfoString: onIWidgetInfoString,
                    hideBody: hideAppBarBody,
                    leading: leading,
                    bodySpacing: appBarBody == null ? SpacingFoundation.zero : SpacingFoundation.verticalSpacing16,
                    title: title,
                    customTitle: customTitle,
                    appBarBody: AnimatedContainer(
                      duration: animDuration,
                      height: hideAppBarBody
                          ? 0
                          : max(
                              0,
                              expandedHeight - toolbarHeight - SpacingFoundation.verticalSpacing16,
                            ),
                      child: appBarBody,
                    ),
                    appBarTrailing: appBarTrailing,
                    autoImplyLeading: autoImplyLeading,
                    centerTitle: centerTitle,
                  ),
                  // bottom: bottom,
                );
              },
            ),
            if (topFixedAddition != null) SliverPinnedHeader(child: topFixedAddition!),
          ],
        ),
        PagedSliverList.separated(
          pagingController: paginationController,
          builderDelegate: builderDelegate,
          separatorBuilder: (context, index) => childrenSpacing?.heightBox ?? SpacingFoundation.verticalSpace16,
        ),
        if (bodyBottomSpace != null) bodyBottomSpace!.heightBox.wrapSliverBox,
      ],
    );
  }
}
