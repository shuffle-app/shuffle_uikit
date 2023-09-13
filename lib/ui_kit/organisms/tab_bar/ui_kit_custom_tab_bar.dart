import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitCustomTabBar extends StatelessWidget {
  final List<UiKitCustomTab> tabs;
  final ValueChanged<int> onTappedTab;
  final String? selectedTab;

  const UiKitCustomTabBar({
    Key? key,
    required this.tabs,
    required this.onTappedTab,
    this.selectedTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabStyle = context.uiKitTheme?.boldTextTheme.body;
    final tabBarTheme = context.uiKitTheme?.uiKitTabBarTheme.copyWith(
      unselectedLabelStyle: tabStyle?.copyWith(color: Colors.white),
      labelStyle: tabStyle,
    );

    final initialTab = tabs.indexWhere((element) => element.title == selectedTab);

    return Theme(
      data: Theme.of(context).copyWith(tabBarTheme: tabBarTheme),
      child: UiKitCardWrapper(
        child: DefaultTabController(
          length: tabs.length,
          initialIndex: initialTab.isNegative ? 0 : initialTab,
          child: ClipRRect(
            borderRadius: BorderRadiusFoundation.max,
            child: TabBar(
              enableFeedback: true,
              splashBorderRadius: BorderRadiusFoundation.max,
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
