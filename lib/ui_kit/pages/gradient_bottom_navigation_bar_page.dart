import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:tabnavigator/tabnavigator.dart';

/// this page has bottom navigation bar with separate navigation stack for each tab
class GradientBottomNavigationBarPage extends StatelessWidget {
  /// list of tabs to be shown in the bottom navigation bar
  /// [TabType] is the tab data type and [TabBuilder] is the builder function for the page
  final Map<GradientBottomNavigationBarItem, TabBuilder> tabs;
  final RouteFactory? onGenerateRoute;
  final GradientBottomNavigationBarController controller;

  const GradientBottomNavigationBarPage({
    Key? key,
    required this.tabs,
    required this.controller,
    this.onGenerateRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: TabNavigator(
        key: controller.tabState,
        selectedTabStream: controller.tabStream,
        initialTab: GradientBottomNavigationBarItem.home,
        mappedTabs: tabs,
        onGenerateRoute: onGenerateRoute,
      ),
      bottomNavigationBar: StreamBuilder<GradientBottomNavigationBarVisibility>(
        stream: controller.visibilityStream,
        builder: (context, snapshot) {
          final visible = snapshot.data == GradientBottomNavigationBarVisibility.visible;
          if (!visible) return SizedBox(height: kBottomNavigationBarHeight.h);

          return GradientBottomNavigationBar(
            items: tabs.keys.toList(),
            controller: controller,
          );
        },
      ),
    );
  }
}
