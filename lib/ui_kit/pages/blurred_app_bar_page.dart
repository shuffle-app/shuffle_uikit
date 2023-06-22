import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BlurredAppBarPage extends StatelessWidget {
  final String title;
  final bool? autoImplyLeading;
  final bool centerTitle;
  final Widget? appBarBody;
  final Widget? appBarTrailing;
  final Widget? leading;
  final Widget body;
  final ScrollController controller;
  // final bool wrapSliverBox;
  // final PreferredSizeWidget? bottom;

  BlurredAppBarPage({
    Key? key,
    required this.title,
    required this.body,
    this.autoImplyLeading,
    this.leading,
    this.appBarBody,
    // this.wrapSliverBox = true,
    ScrollController? controller,
    this.appBarTrailing,
    // this.bottom,
    this.centerTitle = false,
  })  : controller = controller ?? ScrollController(),
        super(key: key);


  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      physics: const ClampingScrollPhysics(),
      slivers: [
        SliverLayoutBuilder(
          builder: (context, sliverConstraints) {
            const animDuration = Duration(milliseconds: 250);
            final toolbarHeight = (context.uiKitTheme?.customAppBapTheme.toolbarHeight ?? 90);
            final expandedHeight = appBarBody == null ? toolbarHeight : 180.0;
            final hideAppBarBody = sliverConstraints.scrollOffset > toolbarHeight;
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
                bodySpacing: SpacingFoundation.verticalSpacing16,
                title: title,
                appBarBody: AnimatedContainer(
                  duration: animDuration,
                  height: hideAppBarBody ? 0 : max(0, expandedHeight - toolbarHeight - SpacingFoundation.verticalSpacing16),
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
        // if(wrapSliverBox)
        body.wrapSliverBox
        // else
        //   body.wrapSliverFillRemaining
        // itemCount: 1)
      ],
    );
  }
}
