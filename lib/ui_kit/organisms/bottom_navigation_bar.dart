import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BlurableBottomNavigationBar extends StatefulWidget {
  final ValueChanged<int> onItemSelected;
  final List<BlurableBottomNavigationBarItem> items;

  const BlurableBottomNavigationBar({
    Key? key,
    required this.onItemSelected,
    required this.items,
  }) : super(key: key);

  @override
  State<BlurableBottomNavigationBar> createState() => _BlurableBottomNavigationBarState();
}

class _BlurableBottomNavigationBarState extends State<BlurableBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
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
          children: widget.items.map((e) {
            final index = widget.items.indexOf(e);
            final selected = index == _selectedIndex;
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = widget.items.indexOf(e);
                  });
                  widget.onItemSelected(widget.items.indexOf(e));
                },
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
      children: [
        ImageWidget(
          svgAsset: icon,
          color: color,
        ),
        if (selected) ...[
          SpacingFoundation.verticalSpace4,
          Icon(
            Icons.circle,
            size: 4,
            color: color,
          ),
        ],
      ],
    );
  }
}

class BlurableBottomNavigationBarItem {
  final SvgGenImage selectedIcon;
  final SvgGenImage unselectedIcon;

  const BlurableBottomNavigationBarItem({
    required this.selectedIcon,
    required this.unselectedIcon,
  });
}
