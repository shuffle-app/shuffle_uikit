import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BlurredAppBarPage extends StatelessWidget {
// class BlurredAppBarPage extends StatefulWidget {
  final String title;
  final bool? autoImplyLeading;
  final bool centerTitle;
  final Widget? appBarBody;
  final Widget? appBarTrailing;
  final Widget? leading;
  final Widget body;
  final ScrollController controller;
  final bool wrapSliverBox;

  BlurredAppBarPage({
    Key? key,
    required this.title,
    required this.body,
    this.autoImplyLeading,
    this.leading,
    this.appBarBody,
    this.wrapSliverBox = true,
    ScrollController? controller,
    this.appBarTrailing,
    this.centerTitle = false,
  })  : controller = controller ?? ScrollController(),
        super(key: key);
//
//   @override
//   State<BlurredAppBarPage> createState() => _BlurredAppBarPageState();
// }
//
// class _BlurredAppBarPageState extends State<BlurredAppBarPage>
//     with WidgetsBindingObserver {
//   @override
//   void didChangeMetrics() {
//     final focusedCtx = FocusManager.instance.primaryFocus!.context;
//     if (focusedCtx != null) {
//       WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//         Scrollable.ensureVisible(
//           focusedCtx,
//           duration: const Duration(milliseconds: 200),
//           curve: Curves.easeIn,
//         );
//       });
//     }
//     super.didChangeMetrics();
//   }

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
            );
          },
        ),
        // SliverList.builder(
        //     itemBuilder: (c, i) =>
        body.wrapSliverBox,
        // itemCount: 1)
      ],
    );
  }
}
