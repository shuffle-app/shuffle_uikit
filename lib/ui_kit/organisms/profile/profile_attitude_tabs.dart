import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class ProfileAttitudeTabs extends StatelessWidget {
  final List<ProfileAttitudeTab> tabs;
  final ValueChanged<int> onTappedTab;

  const ProfileAttitudeTabs({
    Key? key,
    required this.tabs,
    required this.onTappedTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        tabBarTheme: Theme.of(context).extension<UiKitThemeData>()?.uiKitTabBarTheme,
      ),
      child: CardWrapper(
        padding: EdgeInsetsFoundation.all4,
        child: DefaultTabController(
          length: tabs.length,
          child: ClipRRect(
            borderRadius: BorderRadiusFoundation.max,
            child: TabBar(
              onTap: onTappedTab,
              tabs: tabs,
            ),
          ),
        ),
      ),
    );
  }
}
