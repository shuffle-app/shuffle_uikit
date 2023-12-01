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
  final Widget body;
  final ScrollController? controller;
  final bool wrapSliverBox;
  final Widget? topFixedAddition;
  final ScrollPhysics physics;
  final double? customToolbarHeight;
  final animDuration = const Duration(milliseconds: 250);
  final bool? canFoldAppBar;
  final double? customToolbarBaseHeight;
  final ScrollViewKeyboardDismissBehavior? keyboardDismissBehavior;

  // final PreferredSizeWidget? bottom;

  const BlurredAppBarPage({
    Key? key,
    this.title = '',
    this.customTitle,
    required this.body,
    this.autoImplyLeading,
    this.leading,
    this.canFoldAppBar,
    this.appBarBody,
    this.wrapSliverBox = true,
    this.controller,
    // ScrollController? controller,
    ScrollPhysics? physics,
    this.appBarTrailing,
    // this.bottom,
    this.customToolbarHeight,
    this.customToolbarBaseHeight,
    this.centerTitle = false,
    this.topFixedAddition,
    this.keyboardDismissBehavior,
  })  : physics = physics ?? const ClampingScrollPhysics(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      physics: physics,
      keyboardDismissBehavior: keyboardDismissBehavior ?? ScrollViewKeyboardDismissBehavior.manual,
      slivers: [
        MultiSliver(
          children: [
            SliverLayoutBuilder(
              builder: (context, sliverConstraints) {
                double toolbarHeight = (customToolbarBaseHeight ?? context.uiKitTheme?.customAppBapTheme.toolbarHeight ?? 90.0);
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
        body.wrapSliverFillRemaining
      ],
    );
  }
}
