import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_kit/atoms/profile/ui_reward_progress_model.dart';

class HallOfFamePageExample extends StatelessWidget {
  const HallOfFamePageExample({super.key});

  @override
  Widget build(BuildContext context) {
    final listOfItems = List.generate(
      20,
      (index) => GridTitledItemWidget(
        title: 'Title $index',
        child: UiKitFameItem(
          uiRewardProgressModel: UiRewardProgressModel(
            current: 90,
            total: 100,
            title: 'TEst',
          ),
          // uiModel: UiKitAchievementsModel(
          //   asset: index % 5 == 0 ? null : GraphicsFoundation.instance.png.goldenCup.path,
          //   title: 'Title $index',
          // ),
          uiModel: UiKitAchievementsModel(
            title: 'Ring',
            objectUrl:
                'https://shuffle-app-production.s3.eu-west-2.amazonaws.com/static-files/3dmodels/objects/luxury_ring_with_ru.glb',
            asset:
                'https://shuffle-app-production.s3.eu-west-2.amazonaws.com/static-files/3dmodels/posters/ring_poster.webp',
          ),
        ),
      ),
    );

    return Scaffold(
      body: BlurredAppBarPage(
        title: 'Hall of Fame',
        autoImplyLeading: true,
        centerTitle: true,
        children: [
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
        ],
      ),
    );
  }
}
