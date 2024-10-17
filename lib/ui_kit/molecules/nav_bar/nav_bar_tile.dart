import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class NavBarTile extends StatelessWidget {
  final IconData? icon;
  final String? iconPath;
  final bool selected;

  const NavBarTile({
    super.key,
    this.icon,
    this.iconPath,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    final color = context.uiKitTheme?.blurredBottomNavigationBarTheme.iconColors;

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImageWidget(
          iconData: icon,
          link: iconPath,
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
