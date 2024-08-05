import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitTabBarWithUnderlineIndicator extends StatelessWidget {
  final List<UiKitCustomTab> tabs;
  final ValueChanged<int> onTappedTab;
  final String? selectedTab;
  final TabController tabController;

  const UiKitTabBarWithUnderlineIndicator({
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
        tabs: tabs,
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
