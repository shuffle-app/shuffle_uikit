import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitCustomTabBar extends StatelessWidget {
  final List<UiKitCustomTab> tabs;
  final ValueChanged<int> onTappedTab;
  final String? selectedTab;
  final TabController? tabController;
  final BorderRadius clipBorderRadius;
  final bool badged;
  final bool scrollable;

  const UiKitCustomTabBar({
    super.key,
    required this.tabs,
    required this.onTappedTab,
    this.scrollable = false,
    this.badged = false,
    this.selectedTab,
    this.tabController,
    this.clipBorderRadius = const BorderRadius.all(Radius.circular(9999)),
  });

  factory UiKitCustomTabBar.badged({
    Key? key,
    required List<UiKitCustomTab> tabs,
    required ValueChanged<int> onTappedTab,
    bool scrollable = false,
    String? selectedTab,
    TabController? tabController,
    BorderRadius clipBorderRadius = const BorderRadius.all(Radius.circular(9999)),
  }) =>
      UiKitCustomTabBar(
        key: key,
        tabs: tabs,
        onTappedTab: onTappedTab,
        selectedTab: selectedTab,
        tabController: tabController,
        clipBorderRadius: clipBorderRadius,
        badged: true,
        scrollable: scrollable,
      );

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final tabStyle = theme?.boldTextTheme.body.copyWith(fontSize: 15.w);
    final tabBarTheme = theme?.uiKitTabBarTheme.copyWith(
      unselectedLabelStyle: tabStyle?.copyWith(color: theme.uiKitTabBarTheme.unselectedLabelColor),
      labelStyle: tabStyle?.copyWith(color: theme.uiKitTabBarTheme.labelColor),
    );

    final initialTab = tabs.indexWhere((element) {
      final hasValue = element.customValue != null;
      if (hasValue) return element.customValue == selectedTab;

      return element.title == selectedTab;
    });

    return Theme(
      data: Theme.of(context).copyWith(tabBarTheme: tabBarTheme),
      child: UiKitCardWrapper(
        clipBehavior: Clip.none,
        borderRadius: clipBorderRadius,
        color: theme?.colorScheme.surface2,
        child: DefaultTabController(
          animationDuration: const Duration(milliseconds: 250),
          length: tabs.length,
          initialIndex: initialTab.isNegative ? 0 : initialTab,
          child: SizedBox(
            height: badged ? 64 : null,
            child: TabBar(
              controller: tabController,
              isScrollable: scrollable,
              enableFeedback: true,
              splashBorderRadius: clipBorderRadius,
              splashFactory: NoSplash.splashFactory,
              onTap: onTappedTab,
              tabs: tabs,
              indicatorPadding:
                  badged ? EdgeInsets.symmetric(vertical: EdgeInsetsFoundation.vertical4) : EdgeInsets.zero,
            ).paddingSymmetric(
              horizontal: EdgeInsetsFoundation.horizontal4,
              vertical: badged ? EdgeInsetsFoundation.zero : EdgeInsetsFoundation.all4,
            ),
          ),
        ),
      ),
    );
  }
}
