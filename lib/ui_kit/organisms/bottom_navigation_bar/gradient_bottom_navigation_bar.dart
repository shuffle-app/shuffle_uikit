import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:tabnavigator/tabnavigator.dart';

class GradientBottomNavigationBar extends StatelessWidget {
  final List<GradientBottomNavigationBarItem> items;
  final GradientBottomNavigationBarController controller;

  GradientBottomNavigationBar({
    super.key,
    required this.items,
    required this.controller,
  }) : assert(controller.tabItemsCount == items.length);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TabType>(
      stream: controller.tabStream,
      builder: (context, snapshot) {
        final index = snapshot.data?.value ?? 0;
        final isLigthTheme = context.uiKitTheme?.themeMode == ThemeMode.light;

        return Container(
          height: kBottomNavigationBarHeight.h,
          width: double.infinity,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            gradient: isLigthTheme ? GradientFoundation.whiteLinearGradient : GradientFoundation.blackLinearGradient,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items.map((e) {
              final elementIndex = items.indexOf(e);
              final selected = index == elementIndex;

              return Expanded(
                child: GestureDetector(
                  onTap: () => controller.changeTab(e),
                  behavior: HitTestBehavior.opaque,
                  child: NavBarTile(
                    icon: selected ? e.selectedIcon : e.unselectedIcon,
                    iconPath: !selected ? e.unselectedIconPath : null,
                    selected: selected,
                  ),
                ),
              );
            }).toList(),
          ).paddingSymmetric(
            vertical: EdgeInsetsFoundation.vertical8,
            horizontal: EdgeInsetsFoundation.horizontal20,
          ),
        );
      },
    );
  }
}

class GradientBottomNavigationBarItem extends TabType {
  static final home = GradientBottomNavigationBarItem._(
    selectedIcon: ShuffleUiKitIcons.homefill,
    unselectedIcon: ShuffleUiKitIcons.homeoutline,
    index: 0,
  );
  static final spinner = GradientBottomNavigationBarItem._(
    selectedIcon: ShuffleUiKitIcons.spinnerfill,
    unselectedIcon: ShuffleUiKitIcons.spinneroutline,
    index: 1,
  );
  static final docs = GradientBottomNavigationBarItem._(
    selectedIcon: ShuffleUiKitIcons.docsfill,
    unselectedIcon: ShuffleUiKitIcons.docsoutline,
    index: 1,
  );
  static final shuffle = GradientBottomNavigationBarItem._(
    selectedIcon: ShuffleUiKitIcons.shufflefill,
    unselectedIcon: ShuffleUiKitIcons.shuffleoutline,
    index: 2,
  );
  static final analytics = GradientBottomNavigationBarItem._(
    selectedIcon: ShuffleUiKitIcons.analyticsfill,
    unselectedIcon: ShuffleUiKitIcons.analyticsoutline,
    index: 1,
  );
  static final search = GradientBottomNavigationBarItem._(
    selectedIcon: ShuffleUiKitIcons.searchfill,
    unselectedIconPath: GraphicsFoundation.instance.svg.searchOutline.path,
    index: 3,
  );
  static final connection = GradientBottomNavigationBarItem._(
    selectedIcon: ShuffleUiKitIcons.messagefill,
    unselectedIcon: ShuffleUiKitIcons.message,
    index: 3,
  );
  static final profile = GradientBottomNavigationBarItem._(
    selectedIcon: ShuffleUiKitIcons.profilefill,
    unselectedIcon: ShuffleUiKitIcons.profileoutline,
    index: 4,
  );
  static final settings = GradientBottomNavigationBarItem._(
    selectedIcon: ShuffleUiKitIcons.settingsfill,
    unselectedIcon: ShuffleUiKitIcons.settingsoutline,
    index: 2,
  );

  final IconData selectedIcon;
  final IconData? unselectedIcon;
  final String? unselectedIconPath;

  GradientBottomNavigationBarItem._({
    required this.selectedIcon,
    this.unselectedIcon,
    this.unselectedIconPath,
    required int index,
  }) : super(index);
}

class GradientBottomNavigationBarController {
  final int tabItemsCount;

  final BehaviorSubject<GradientBottomNavigationBarItem> _changeController =
      BehaviorSubject<GradientBottomNavigationBarItem>();
  final BehaviorSubject<GradientBottomNavigationBarVisibility> _visibilityController =
      BehaviorSubject<GradientBottomNavigationBarVisibility>.seeded(GradientBottomNavigationBarVisibility.visible);

  /// Состояние таббара
  GlobalKey<TabNavigatorState> tabState;

  Stream<TabType> get tabStream => _changeController.stream;

  Stream<GradientBottomNavigationBarVisibility> get visibilityStream => _visibilityController.stream;

  GradientBottomNavigationBarItem? get selectedTabState => _changeController.valueOrNull;

  GradientBottomNavigationBarController({required this.tabItemsCount, GlobalKey<TabNavigatorState>? tabState})
      : tabState = tabState ?? GlobalKey<TabNavigatorState>();

  void hideBottomNavigationBar() {
    if (!_visibilityController.isClosed) _visibilityController.add(GradientBottomNavigationBarVisibility.hidden);
  }

  void showBottomNavigationBar() {
    if (!_visibilityController.isClosed) _visibilityController.add(GradientBottomNavigationBarVisibility.visible);
  }

  void changeTab(GradientBottomNavigationBarItem item) => _openTab(item);

  void dispose() {
    _changeController.close();
    _visibilityController.close();
    tabState.currentState?.dispose();
  }

  Future<void> _openTab(GradientBottomNavigationBarItem item) async {
    final isTappedTabSelectedAlready = selectedTabState == item;

    // Если нажатый таб уже выбран
    // удаляем другие страницы, оставляем только первую страницу
    if (isTappedTabSelectedAlready && await _isNotLastPage(item)) {
      tabState.currentState?.mappedNavKeys[item]?.currentState?.popUntil((route) => route.isFirst);
    } else {
      if (!_changeController.isClosed) _changeController.add(item);
    }
  }

  /// Возвращает true если имеет дочерние можно вернуться назад
  Future<bool> _isNotLastPage(GradientBottomNavigationBarItem selectedTab) async =>
      await tabState.currentState?.mappedNavKeys[selectedTab]?.currentState?.maybePop() ?? false;
}

enum GradientBottomNavigationBarVisibility { visible, hidden }
