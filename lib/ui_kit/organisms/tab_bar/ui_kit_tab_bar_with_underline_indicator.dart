import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitTabBarWithUnderlineIndicator extends StatelessWidget {
  final List<CustomTabData> tabs;
  final ValueChanged<int> onTappedTab;
  final String? selectedTab;
  final TabController tabController;

  final group = AutoSizeGroup();

  UiKitTabBarWithUnderlineIndicator({
    Key? key,
    required this.tabs,
    required this.onTappedTab,
    required this.tabController,
    this.selectedTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;
    final colorScheme = context.uiKitTheme?.colorScheme;

    return Theme(
      data: Theme.of(context).copyWith(
        tabBarTheme: Theme.of(context).tabBarTheme.copyWith(
              labelStyle: regularTextTheme?.labelSmall,
              unselectedLabelStyle: regularTextTheme?.labelSmall.copyWith(color: ColorsFoundation.mutedText),
              overlayColor: WidgetStateProperty.all(Colors.transparent),
            ),
      ),
      child: TabBar(
        splashFactory: NoSplash.splashFactory,
        controller: tabController,
        enableFeedback: true,
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: tabs.map((e) => UiKitCustomTab.fromDataClass(data: e.copyWith(group: group))).toList(),
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            width: 2,
            color: colorScheme?.inverseSurface ?? Colors.black,
          ),
        ),
        onTap: onTappedTab,
      ),
    );
  }
}
