import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
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
        key: bottomNavBarController.tabState,
        selectedTabStream: bottomNavBarController.tabStream,
        initialTab: GradientBottomNavigationBarItem.home,
        mappedTabs: widget.tabs,
        onGenerateRoute: widget.onGenerateRoute,
      ),
      bottomNavigationBar: StreamBuilder<GradientBottomNavigationBarVisibility>(
        stream: bottomNavBarController.visibilityStream,
        builder: (context, snapshot) {
          final visible = snapshot.data == GradientBottomNavigationBarVisibility.visible;
          if (!visible) return SizedBox(height: kBottomNavigationBarHeight.h);

          return GradientBottomNavigationBar(
            items: widget.tabs.keys.toList(),
            controller: bottomNavBarController,
          );
        },
      ),
    );
  }
}
