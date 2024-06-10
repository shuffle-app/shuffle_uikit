import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:sliver_tools/sliver_tools.dart';

class BlurredAppBarPage extends StatelessWidget {
  final String title;
  final Widget? customTitle;
  final bool? autoImplyLeading;
  final bool centerTitle;
  final Widget? appBarBody;
  final Widget? appBarTrailing;
  final Widget? leading;
  final List<Widget>? children;
  final ScrollController? controller;
  final bool wrapSliverBox;
  final Widget? topFixedAddition;
  final ScrollPhysics? physics;
  final double? customToolbarHeight;
  final animDuration = const Duration(milliseconds: 250);
  final bool? canFoldAppBar;
  final double? customToolbarBaseHeight;
  final ScrollViewKeyboardDismissBehavior? keyboardDismissBehavior;
  final Widget? Function(BuildContext, int)? childrenBuilder;
  final int? childrenCount;
  final double? bodyBottomSpace;
  final EdgeInsets? childrenPadding;
  final Key? animatedListKey;
  final String? onIWidgetInfoString;

  const BlurredAppBarPage({
    super.key,
    this.title = '',
    this.customTitle,
    this.children,
    this.autoImplyLeading,
    this.leading,
    this.canFoldAppBar,
    this.appBarBody,
    this.wrapSliverBox = true,
    this.controller,
    this.physics,
    this.appBarTrailing,
    this.customToolbarHeight,
    this.customToolbarBaseHeight,
    this.centerTitle = false,
    this.topFixedAddition,
    this.keyboardDismissBehavior,
    this.childrenBuilder,
    this.childrenCount,
    this.childrenPadding,
    this.animatedListKey,
    this.bodyBottomSpace,
    this.onIWidgetInfoString,
  })  : assert(childrenBuilder == null || childrenCount != null,
            'childrenCount must be not null if childrenBuilder is not null'),
        assert(childrenBuilder != null || children != null, 'childrenBuilder or body must be not null');

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
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
        if (childrenBuilder == null && children != null)
          SliverList(
            delegate: SliverChildListDelegate(
              children!.map((e) {
                if (childrenPadding == null) return e;
                return e.paddingOnly(
                  top: childrenPadding!.top,
                  bottom: childrenPadding!.bottom,
                  left: childrenPadding!.left,
                  right: childrenPadding!.right,
                );
              }).toList(),
            ),
          ),
        if (children == null && childrenBuilder != null)
          if (animatedListKey != null)
            SliverAnimatedList(
              key: animatedListKey,
              initialItemCount: childrenCount!,
              itemBuilder: (context, index, animation) {
                if (childrenPadding == null) {
                  return ScaleTransition(
                      alignment: Alignment.topRight, scale: animation, child: childrenBuilder!.call(context, index));
                }

                return ScaleTransition(
                    alignment: Alignment.topRight,
                    scale: animation,
                    child: childrenBuilder!.call(context, index)?.paddingOnly(
                          top: childrenPadding!.top,
                          bottom: childrenPadding!.bottom,
                          left: childrenPadding!.left,
                          right: childrenPadding!.right,
                        ));
              },
            )
          else
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (childrenPadding == null) {
                    return childrenBuilder!.call(context, index);
                  }

                  return childrenBuilder!.call(context, index)?.paddingOnly(
                        top: childrenPadding!.top,
                        bottom: childrenPadding!.bottom,
                        left: childrenPadding!.left,
                        right: childrenPadding!.right,
                      );
                },
                childCount: childrenCount!,
              ),
            ),
        if (bodyBottomSpace != null) bodyBottomSpace!.heightBox.wrapSliverBox,
      ],
    );
  }
}
