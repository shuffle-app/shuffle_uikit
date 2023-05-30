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
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          pinned: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusFoundation.onlyBottom24,
          ),
          collapsedHeight: context.uiKitTheme?.customAppBapTheme.toolbarHeight ?? 84,

          /// нужно подумать как избежать хардкоженной высоты
          expandedHeight: 180,
          flexibleSpace: CustomAppBar(
            title: title,
            appBarBody: appBarBody,
            appBarTrailing: appBarTrailing,
            autoImplyLeading: autoImplyLeading,
            centerTitle: centerTitle,
          ),
        ),
        body.wrapSliverBox,
      ],
    );
  }
}
