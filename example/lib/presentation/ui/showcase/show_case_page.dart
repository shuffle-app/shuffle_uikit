import 'package:example/presentation/ui/showcase/all_widgets_stand.dart';
import 'package:example/presentation/ui/swiper_card/swiper_card_page.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class ShowCasePage extends StatelessWidget {
  const ShowCasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientBottomNavigationBarPage(
      tabs: {
        GradientBottomNavigationBarItem.home: () => const AllWidgetsStand(),
        GradientBottomNavigationBarItem.spinner: () => const Center(child: Text('Page 2')),
        GradientBottomNavigationBarItem.shuffle: () => const SwiperCardPage(),
        GradientBottomNavigationBarItem.search: () => const Center(child: Text('Page 4')),
        GradientBottomNavigationBarItem.profile: () => const Center(child: Text('Page 5')),
      },
    );
  }
}
