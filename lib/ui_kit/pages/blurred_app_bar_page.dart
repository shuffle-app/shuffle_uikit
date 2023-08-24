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

  // final PreferredSizeWidget? bottom;

  BlurredAppBarPage({
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
    this.centerTitle = false, this.topFixedAddition,
  })
      : 
        // controller = controller ?? ScrollController(),
        physics = physics ?? const ClampingScrollPhysics(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final toolbarHeight = (context.uiKitTheme?.customAppBapTheme
        .toolbarHeight ?? 90.0);
    final expandedHeight = appBarBody == null ? toolbarHeight : 190.0;

    // return NestedScrollView(
    // return MultiSliver(
      return CustomScrollView(
      controller: controller,
      // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      physics: physics,
      // headerSliverBuilder: (c, _) =>
        slivers: [

        MultiSliver(
      children: [
      // [
      //   SliverOverlapAbsorber(
      //     handle:NestedScrollView.sliverOverlapAbsorberHandleFor(c),
      //     sliver:
          // slivers: [
        SliverLayoutBuilder(
          builder: (context, sliverConstraints) {
            const animDuration = Duration(milliseconds: 250);

            final hideAppBarBody = appBarBody == null ? true : sliverConstraints
                .scrollOffset > toolbarHeight;
            // sliverConstraints.scrollOffset > expandedHeight;

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
                bodySpacing: appBarBody == null
                    ? SpacingFoundation.zero
                    : SpacingFoundation.verticalSpacing16,
                title: title,
                appBarBody: AnimatedContainer(
                  duration: animDuration,
                  height: hideAppBarBody ? 0 : max(0,
                      expandedHeight - toolbarHeight -
                          SpacingFoundation.verticalSpacing16),
                  child: appBarBody,
                ),
                appBarTrailing: appBarTrailing,
                autoImplyLeading: autoImplyLeading,
                centerTitle: centerTitle,
              ),
              // bottom: bottom,
            );
          },
        // )
        ),
        if(topFixedAddition != null)
          SliverPinnedHeader(child: topFixedAddition!),
          // topFixedAddition!.wrapSliverBox
      ]),
      // body: body.paddingOnly(top: expandedHeight),
      // if(wrapSliverBox)
      body.wrapSliverBox
      // else
      //   body.wrapSliverFillRemaining
      // itemCount: 1)
      ],
    );
  }
}
