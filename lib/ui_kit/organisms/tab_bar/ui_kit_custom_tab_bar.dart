import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitCustomTabBar extends StatelessWidget {
  final List<UiKitCustomTab> tabs;
  final ValueChanged<int> onTappedTab;
  final String? selectedTab;
  final TabController? tabController;
  final BorderRadius clipBorderRadius;

  const UiKitCustomTabBar({
    Key? key,
    required this.tabs,
    required this.onTappedTab,
    this.selectedTab,
    this.tabController,
    this.clipBorderRadius = const BorderRadius.all(Radius.circular(9999)),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final tabStyle = theme?.boldTextTheme.body;
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
        color: theme?.colorScheme.surface2,
        child: DefaultTabController(
          animationDuration: const Duration(milliseconds: 250),
          length: tabs.length,
          initialIndex: initialTab.isNegative ? 0 : initialTab,
          child: ClipRRect(
            borderRadius: BorderRadiusFoundation.max,
            child: TabBar(
              controller: tabController,
              enableFeedback: true,
              splashBorderRadius: clipBorderRadius,
              splashFactory: NoSplash.splashFactory,
              onTap: onTappedTab,
              tabs: tabs,
            ),
          ),
        ).paddingAll(EdgeInsetsFoundation.all4),
      ),
    );
  }
}
