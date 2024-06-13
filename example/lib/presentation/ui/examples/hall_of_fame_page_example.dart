import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class HallOfFamePageExample extends StatelessWidget {
  const HallOfFamePageExample({super.key});

  @override
  Widget build(BuildContext context) {
    final listOfItems = List.generate(
        20,
        (index) => GridTitledItemWidget(
              title: 'Title $index',
              child: UiKitFameItem(
                  uiModel: UiKitAchievementsModel(
                asset: index % 5 == 0
                    ? null
                    : index % 2 == 0
                        ? GraphicsFoundation.instance.png.goldenCup
                        : GraphicsFoundation.instance.png.goldenMedal,
                title: 'Title $index',
              )),
            ));

    return Scaffold(
        body: BlurredAppBarPage(title: 'Hall of Fame', autoImplyLeading: true, centerTitle: true, children: [
      SpacingFoundation.verticalSpace16,
      GridView.count(
        crossAxisCount: 3,
        clipBehavior: Clip.hardEdge,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        childAspectRatio: 0.56.sp,
        crossAxisSpacing: SpacingFoundation.verticalSpacing8,
        children: listOfItems,
      ).paddingSymmetric(horizontal: SpacingFoundation.horizontalSpacing16)
    ]));
  }
}
