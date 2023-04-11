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
    return Builder(
      builder: (context) {
        final tabStyle = Theme.of(context).extension<UiKitThemeData>()?.boldTextTheme.body;
        final tabBarTheme = Theme.of(context).extension<UiKitThemeData>()?.uiKitTabBarTheme.copyWith(
              unselectedLabelStyle: tabStyle?.copyWith(color: Colors.white),
              labelStyle: tabStyle,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            );
        return Theme(
          data: Theme.of(context).copyWith(tabBarTheme: tabBarTheme),
          child: CardWrapper(
            padding: EdgeInsetsFoundation.all4,
            child: DefaultTabController(
              length: tabs.length,
              child: ClipRRect(
                borderRadius: BorderRadiusFoundation.max,
                child: TabBar(
                  enableFeedback: true,
                  splashBorderRadius: BorderRadiusFoundation.max,
                  splashFactory: NoSplash.splashFactory,
                  onTap: onTappedTab,
                  tabs: tabs,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
