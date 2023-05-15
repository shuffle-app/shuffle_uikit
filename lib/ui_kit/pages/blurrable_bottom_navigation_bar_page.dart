import 'package:flutter/material.dart';
import 'package:shuffle_uikit/ui_kit/organisms/bottom_navigation_bar/blurable_bottom_navigation_bar.dart';
import 'package:tabnavigator/tabnavigator.dart';

/// this page has bottom navigation bar with separate navigation stack for each tab
class BlurrableBottomNavigationBarPage extends StatefulWidget {
  /// list of tabs to be shown in the bottom navigation bar
  /// [TabType] is the tab data type and [TabBuilder] is the builder function for the page
  final Map<BlurableBottomNavigationBarItem, TabBuilder> tabs;

  const BlurrableBottomNavigationBarPage({
    Key? key,
    required this.tabs,
  }) : super(key: key);

  @override
  State<BlurrableBottomNavigationBarPage> createState() => _BlurrableBottomNavigationBarPageState();
}

class _BlurrableBottomNavigationBarPageState extends State<BlurrableBottomNavigationBarPage> {
  late final bottomNavBarController = BlurredBottomNavigationBarController(
    tabItemsCount: widget.tabs.values.length,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabNavigator(
        selectedTabStream: bottomNavBarController.tabStream,
        initialTab: BlurableBottomNavigationBarItem.home,
        mappedTabs: widget.tabs,
      ),
      bottomNavigationBar: BlurableBottomNavigationBar(
        items: widget.tabs.keys.toList(),
        controller: bottomNavBarController,
      ),
    );
  }
}
