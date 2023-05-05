import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/shuffle_uikit_internal.dart';
import 'package:tabnavigator/tabnavigator.dart';

class BlurableBottomNavigationBar extends StatelessWidget {
  final List<BlurableBottomNavigationBarItem> items;
  final BlurredBottomNavigationBarController controller;

  BlurableBottomNavigationBar({
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
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
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
                    child: _NavBarTile(
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
          ),
        );
      },
    );
  }
}

class _NavBarTile extends StatelessWidget {
  final SvgGenImage icon;
  final bool selected;

  const _NavBarTile({
    Key? key,
    required this.icon,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = context.uiKitTheme?.blurredBottomNavigationBarTheme.iconColors;
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImageWidget(
          svgAsset: icon,
          color: color,
        ),
        SpacingFoundation.verticalSpace4,
        Icon(
          Icons.circle,
          size: 4,
          color: selected ? color : Colors.transparent,
        ),
      ],
    );
  }
}

class BlurableBottomNavigationBarItem extends TabType {
  final SvgGenImage selectedIcon;
  final SvgGenImage unselectedIcon;

  static final home = BlurableBottomNavigationBarItem._(
    selectedIcon: GraphicsFoundation.instance.svg.homeFill,
    unselectedIcon: GraphicsFoundation.instance.svg.homeOutline,
    index: 0,
  );
  static final spinner = BlurableBottomNavigationBarItem._(
    selectedIcon: GraphicsFoundation.instance.svg.spinnerFill,
    unselectedIcon: GraphicsFoundation.instance.svg.spinnerOutline,
    index: 1,
  );
  static final shuffle = BlurableBottomNavigationBarItem._(
    selectedIcon: GraphicsFoundation.instance.svg.shuffleFill,
    unselectedIcon: GraphicsFoundation.instance.svg.shuffleOutline,
    index: 2,
  );
  static final search = BlurableBottomNavigationBarItem._(
    selectedIcon: GraphicsFoundation.instance.svg.searchFill,
    unselectedIcon: GraphicsFoundation.instance.svg.searchOutline,
    index: 3,
  );
  static final profile = BlurableBottomNavigationBarItem._(
    selectedIcon: GraphicsFoundation.instance.svg.profileFill,
    unselectedIcon: GraphicsFoundation.instance.svg.profileOutline,
    index: 4,
  );

  const BlurableBottomNavigationBarItem._({
    required this.selectedIcon,
    required this.unselectedIcon,
    required int index,
  }) : super(index);
}

class BlurredBottomNavigationBarController {
  final int tabItemsCount;

  BlurredBottomNavigationBarController({required this.tabItemsCount});

  final StreamController<TabType> _changeController = StreamController<TabType>.broadcast();

  Stream<TabType> get tabStream => _changeController.stream;

  void changeTab(BlurableBottomNavigationBarItem item) {
    _changeController.add(item);
  }

  void dispose() {
    _changeController.close();
  }
}
