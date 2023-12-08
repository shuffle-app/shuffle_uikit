import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> with SingleTickerProviderStateMixin {
  final ScrollController scrollController = ScrollController();
  final animDuration = const Duration(milliseconds: 250);

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverLayoutBuilder(
            builder: (context, sliverConstraints) {
              double toolbarHeight = (context.uiKitTheme?.customAppBapTheme.toolbarHeight ?? 90.0);
              double expandedHeight = 190.0;

              final hideAppBarBody = sliverConstraints.scrollOffset > toolbarHeight;

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
                  leading: null,
                  bodySpacing: SpacingFoundation.verticalSpacing16,
                  title: 'title',
                  appBarBody: AnimatedContainer(
                    duration: animDuration,
                    height: hideAppBarBody
                        ? 0
                        : max(
                            0,
                            expandedHeight - toolbarHeight - SpacingFoundation.verticalSpacing16,
                          ),
                    child: Container(
                      color: Colors.red,
                    ),
                  ),
                  appBarTrailing: SizedBox(width: 24),
                  autoImplyLeading: false,
                  centerTitle: true,
                ),
                // bottom: bottom,
              );
            },
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadiusFoundation.all16,
                ),
                height: 100,
              ),
              childCount: 10,
            ),
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadiusFoundation.all16,
              ),
              child: Center(
                child: Text(
                  'title $index',
                  style: context.uiKitTheme?.boldTextTheme.subHeadline,
                ),
              ),
            ),
            separatorBuilder: (context, index) => SpacingFoundation.verticalSpace16,
            itemCount: 10,
          ).wrapSliverFillRemaining,
        ],
      ),
    );
  }
}
