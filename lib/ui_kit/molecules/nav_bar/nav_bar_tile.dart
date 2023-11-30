import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class NavBarTile extends StatelessWidget {
  final IconData icon;
  final bool selected;

  const NavBarTile({
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
          iconData: icon,
          color: color,
          width: 24.w,
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
