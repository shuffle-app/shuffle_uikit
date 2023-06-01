import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BlurredAppBarPage extends StatelessWidget {
  final String title;
  final bool? autoImplyLeading;
  final bool centerTitle;
  final Widget? appBarBody;
  final Widget? appBarTrailing;
  final Widget body;

  const BlurredAppBarPage({
    Key? key,
    required this.title,
    this.autoImplyLeading,
    this.appBarBody,
    this.appBarTrailing,
    this.centerTitle = false,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final showLeading = autoImplyLeading ?? false;

    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        SliverLayoutBuilder(
          builder: (context, sliverConstraints) {
            final animDuration = const Duration(milliseconds: 250);
            final expandedHeight = 180.0;
            final toolbarHeight = (context.uiKitTheme?.customAppBapTheme.toolbarHeight ?? 84);
            final hideAppBarBody = sliverConstraints.scrollOffset > expandedHeight;

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
                bodySpacing: SpacingFoundation.verticalSpacing16,
                title: title,
                appBarBody: AnimatedContainer(
                  duration: animDuration,
                  height: hideAppBarBody ? 0 : expandedHeight - toolbarHeight - SpacingFoundation.verticalSpacing16,
                  child: appBarBody,
                ),
                appBarTrailing: appBarTrailing,
                autoImplyLeading: autoImplyLeading,
                centerTitle: centerTitle,
              ),
            );
          },
        ),
        body.wrapSliverBox,
      ],
    );
  }
}
