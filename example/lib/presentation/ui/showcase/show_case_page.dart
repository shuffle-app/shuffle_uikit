import 'package:example/presentation/ui/showcase/all_widgets_stand.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class ShowCasePage extends StatelessWidget {
  const ShowCasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWithBlurrableBottomNavigationBar(
      tabs: {
        BlurableBottomNavigationBarItem.home: () => const AllWidgetsStand(),
        BlurableBottomNavigationBarItem.spinner: () => const Center(child: Text('Page 2')),
        BlurableBottomNavigationBarItem.shuffle: () => const Center(child: Text('Page 3')),
        BlurableBottomNavigationBarItem.search: () => const Center(child: Text('Page 4')),
        BlurableBottomNavigationBarItem.profile: () => const Center(child: Text('Page 5')),
      },
    );
  }
}
