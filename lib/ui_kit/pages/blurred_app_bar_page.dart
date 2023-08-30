import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:sliver_tools/sliver_tools.dart';

class BlurredAppBarPage extends StatelessWidget {
  final String title;
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

  // final PreferredSizeWidget? bottom;

  const BlurredAppBarPage({
    Key? key,
    required this.title,
    required this.body,
    this.autoImplyLeading,
    this.leading,
    this.appBarBody,
    this.wrapSliverBox = true,
    this.controller,
    // ScrollController? controller,
    ScrollPhysics? physics,
    this.appBarTrailing,
    // this.bottom,
    this.customToolbarHeight,
    this.centerTitle = false,
    this.topFixedAddition,
  })  : physics = physics ?? const ClampingScrollPhysics(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final toolbarHeight = (context.uiKitTheme?.customAppBapTheme.toolbarHeight ?? 90.0);

    return CustomScrollView(
      controller: controller,
      physics: physics,
      slivers: [
        MultiSliver(
          children: [
            SliverLayoutBuilder(
              builder: (context, sliverConstraints) {
                final expandedHeight = appBarBody == null ? toolbarHeight : customToolbarHeight ?? 190.0;
                final hideAppBarBody = appBarBody == null ? true : sliverConstraints.scrollOffset > toolbarHeight;

                return SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  pinned: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusFoundation.onlyBottom24,
                  ),
                  collapsedHeight: toolbarHeight,
                  expandedHeight: expandedHeight,
                  flexibleSpace: CustomAppBar(
                    hideBody: hideAppBarBody,
                    leading: leading,
                    bodySpacing: appBarBody == null ? SpacingFoundation.zero : SpacingFoundation.verticalSpacing16,
                    title: title,
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
