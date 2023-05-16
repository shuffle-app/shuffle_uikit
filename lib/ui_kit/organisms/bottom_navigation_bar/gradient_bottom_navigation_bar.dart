import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:tabnavigator/tabnavigator.dart';

class GradientBottomNavigationBar extends StatelessWidget {
  final List<GradientBottomNavigationBarItem> items;
  final GradientBottomNavigationBarController controller;

  GradientBottomNavigationBar({
    Key? key,
    required this.items,
    required this.controller,
  })  : assert(controller.tabItemsCount == items.length),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TabType>(
      stream: controller.tabStream,
      builder: (context, snapshot) {
        final index = snapshot.data?.value ?? 0;

        return Container(
          height: kBottomNavigationBarHeight.h,
          width: double.infinity,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            gradient: GradientFoundation.blackLinearGradient,
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
    selectedIcon: GraphicsFoundation.instance.svg.homeFill,
    unselectedIcon: GraphicsFoundation.instance.svg.homeOutline,
    index: 0,
  );
  static final spinner = GradientBottomNavigationBarItem._(
    selectedIcon: GraphicsFoundation.instance.svg.spinnerFill,
    unselectedIcon: GraphicsFoundation.instance.svg.spinnerOutline,
    index: 1,
  );
  static final shuffle = GradientBottomNavigationBarItem._(
    selectedIcon: GraphicsFoundation.instance.svg.shuffleFill,
    unselectedIcon: GraphicsFoundation.instance.svg.shuffleOutline,
    index: 2,
  );
  static final search = GradientBottomNavigationBarItem._(
    selectedIcon: GraphicsFoundation.instance.svg.searchFill,
    unselectedIcon: GraphicsFoundation.instance.svg.searchOutline,
    index: 3,
  );
  static final profile = GradientBottomNavigationBarItem._(
    selectedIcon: GraphicsFoundation.instance.svg.profileFill,
    unselectedIcon: GraphicsFoundation.instance.svg.profileOutline,
    index: 4,
  );

  final SvgGenImage selectedIcon;
  final SvgGenImage unselectedIcon;

  const GradientBottomNavigationBarItem._({
    required this.selectedIcon,
    required this.unselectedIcon,
    required int index,
  }) : super(index);
}

class GradientBottomNavigationBarController {
  final int tabItemsCount;
  final StreamController<TabType> _changeController = StreamController<TabType>.broadcast();

  Stream<TabType> get tabStream => _changeController.stream;

  GradientBottomNavigationBarController({required this.tabItemsCount});

  void changeTab(GradientBottomNavigationBarItem item) {
    _changeController.add(item);
  }

  void dispose() {
    _changeController.close();
  }
}
