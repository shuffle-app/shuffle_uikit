import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BlurredAppBarPage extends StatelessWidget {
  final String title;
  final bool? autoImplyLeading;
  final bool centerTitle;
  final Widget body;

  const BlurredAppBarPage({
    Key? key,
    required this.title,
    this.autoImplyLeading,
    this.centerTitle = false,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.transparent,
          pinned: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusFoundation.onlyBottom24,
          ),
          toolbarHeight: context.uiKitTheme?.customAppBapTheme.toolbarHeight ?? Theme.of(context).appBarTheme.toolbarHeight ?? 0,
          flexibleSpace: CustomAppBar(
            title: title,
            autoImplyLeading: autoImplyLeading,
            centerTitle: centerTitle,
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              body,
            ],
          ),
        ),
      ],
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: title,
        autoImplyLeading: autoImplyLeading,
        centerTitle: centerTitle,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top + (context.uiKitTheme?.customAppBapTheme.toolbarHeight ?? 0),
          ),
          Expanded(
            child: body,
          ),
        ],
      ),
    );
  }
}
