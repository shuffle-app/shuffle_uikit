import 'package:flutter/cupertino.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DonationTabMenu extends StatelessWidget {
  const DonationTabMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final AutoSizeGroup g = AutoSizeGroup();
    return Column(
      children: [
        UiKitCustomTabBar(
          tabs: [
            UiKitCustomTab(
              title: 'DAY',
              height: 24.h,
              group: g,
            ),
            UiKitCustomTab(
              title: 'MONTH',
              height: 24.h,
              group: g,
            ),
            UiKitCustomTab(
              title: 'YEAR',
              height: 24.h,
              group: g,
            ),
          ],
          onTappedTab: (_) {},
        ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16),
        SpacingFoundation.verticalSpace16,
        ConstrainedBox(
          constraints: BoxConstraints.expand(height: 550.h),
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: 7,
            itemBuilder: (_, index) {
              if (index < 3) {
                return UiKitDonationCard(
                  number: index + 1,
                  title: '@misswow2022',
                  subtitle: 'Natalie White',
                  points: '364 000',
                  sum: '3 640',
                  isStarEnabled: true,
                );
              }

              return UiKitDonationCard(
                number: index + 1,
                title: '@misswow2022',
                subtitle: 'Megan Fox',
                sum: '3 640',
              );
            },
            separatorBuilder: (_, __) => SpacingFoundation.verticalSpace24,
          ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16),
        ),
        SpacingFoundation.verticalSpace16,
        ConstrainedBox(
          constraints: BoxConstraints.expand(height: 40.h),
          child: context.button(
              data: BaseUiKitButtonData(
                onPressed: () {},
                fit: ButtonFit.fitWidth,
                icon: const Icon(CupertinoIcons.chevron_down),
                text: 'NEXT 7 PEOPLE',
              )),
        ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16),
      ],
    );
  }
}
