import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
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
  final bool reverse;
  final bool hideBottomSpace;

  /// Additional bottom padding for reply message in chat screen
  /// defaults to 0
  final double keyboardPadding;

  const BlurredAppPageWithPagination({
    super.key,
    required this.paginationController,
    required this.builderDelegate,
    this.reverse = false,
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
    this.hideBottomSpace = false,
    this.keyboardPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    double toolbarHeight = (customToolbarBaseHeight ?? context.uiKitTheme?.customAppBapTheme.toolbarHeight ?? 90.0);
    double expandedHeight = appBarBody == null ? toolbarHeight : customToolbarHeight ?? 190.0;

    return CustomScrollView(
      physics: physics ?? const BouncingScrollPhysics(),
      primary: true,
      cacheExtent: 0.5.sh,
      keyboardDismissBehavior: keyboardDismissBehavior ?? ScrollViewKeyboardDismissBehavior.manual,
      slivers: [
        MultiSliver(
          children: [
            SliverLayoutBuilder(
              builder: (context, sliverConstraints) {
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
        KeyboardVisibilityBuilder(
          builder: (context, visible) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              curve: Curves.decelerate,
              height: 1.sh - expandedHeight - (1.sw * 0.275) - keyboardPadding,
              width: 1.sw,
              alignment: Alignment.topCenter,
              child: PagedListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollController: scrollController,
                padding: reverse
                    ? EdgeInsets.only(
                        top: padding?.top ?? 0,
                        left: padding?.right ?? 0,
                        right: padding?.left ?? 0,
                        bottom: (padding?.bottom ?? 0) + (bodyBottomSpace ?? 0),
                      )
                    : padding ?? EdgeInsets.zero,
                reverse: reverse,
                pagingController: paginationController,
                builderDelegate: builderDelegate,
                separatorBuilder: (context, index) => childrenSpacing?.heightBox ?? SpacingFoundation.verticalSpace16,
              ),
            ).wrapSliverBox;
          },
        ),
        if (bodyBottomSpace != null) bodyBottomSpace!.heightBox.wrapSliverBox,
      ],
    );
  }
}
