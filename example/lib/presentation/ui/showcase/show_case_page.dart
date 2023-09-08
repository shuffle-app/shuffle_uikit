import 'package:example/presentation/ui/showcase/all_widgets_stand.dart';
import 'package:example/presentation/ui/spinner/spinner_page.dart';
import 'package:example/presentation/ui/swiper_card/swiper_card_page.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class ShowCasePage extends StatelessWidget {
  const ShowCasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientBottomNavigationBarPage(
      controller: GradientBottomNavigationBarController(tabItemsCount: 5),
      tabs: {
        GradientBottomNavigationBarItem.home: () => const AllWidgetsStand(),
        GradientBottomNavigationBarItem.spinner: () => SpinnerPage(),
        GradientBottomNavigationBarItem.shuffle: () => const SwiperCardPage(),
        GradientBottomNavigationBarItem.search: () => const NoInternetPageTemplate(),
        GradientBottomNavigationBarItem.profile: () => const Center(child: Text('Page 5')),
      },
    );
  }
}
