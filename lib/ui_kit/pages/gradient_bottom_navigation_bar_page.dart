import 'package:flutter/material.dart';
import 'package:shuffle_uikit/ui_kit/organisms/bottom_navigation_bar/gradient_bottom_navigation_bar.dart';
import 'package:tabnavigator/tabnavigator.dart';

/// this page has bottom navigation bar with separate navigation stack for each tab
class GradientBottomNavigationBarPage extends StatefulWidget {
  /// list of tabs to be shown in the bottom navigation bar
  /// [TabType] is the tab data type and [TabBuilder] is the builder function for the page
  final Map<GradientBottomNavigationBarItem, TabBuilder> tabs;
  final RouteFactory? onGenerateRoute;

  const GradientBottomNavigationBarPage({
    Key? key,
    required this.tabs,
     this.onGenerateRoute,
  }) : super(key: key);

  @override
  State<GradientBottomNavigationBarPage> createState() => GradientBottomNavigationBarPageState();
}

class GradientBottomNavigationBarPageState extends State<GradientBottomNavigationBarPage> {
  late final bottomNavBarController = GradientBottomNavigationBarController(
    tabItemsCount: widget.tabs.values.length,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: TabNavigator(
        key: tabState,
        selectedTabStream: bottomNavBarController.tabStream,
        initialTab: GradientBottomNavigationBarItem.home,
        mappedTabs: widget.tabs,
        onGenerateRoute: widget.onGenerateRoute,
      ),
      bottomNavigationBar: GradientBottomNavigationBar(
        items: widget.tabs.keys.toList(),
        controller: bottomNavBarController,
      ),
    );
  }
}

/// Состояние таббара
final GlobalKey<TabNavigatorState> tabState = GlobalKey<TabNavigatorState>();
