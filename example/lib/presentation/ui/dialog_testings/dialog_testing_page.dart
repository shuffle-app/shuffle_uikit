import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DialogTestingPage extends StatelessWidget {
  const DialogTestingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              OrdinaryButton(
                text: 'Dialog bottom sheet fullscreen',
                onPressed: () => showUiKitGeneralFullScreenDialog(
                    context,
                    GeneralDialogData(
                        topPadding: 100,
                        useRootNavigator: false,
                        child: Column(
                          children: List.generate(10, (index) => const Placeholder().paddingSymmetric(vertical: 8)),
                        ),
                        bottomBar: Center(
                          child: Container(
                            width: 100,
                            height: 56,
                            color: Colors.red,
                          ),
                        ))),
              ),
              SpacingFoundation.verticalSpace16,
              OrdinaryButton(
                text: 'Dialog calendar picker',
                onPressed: () => showUiKitCalendarDialog(
                  context,
                ),
              ),
              SpacingFoundation.verticalSpace16,
              OrdinaryButton(
                text: 'Dialog time picker',
                onPressed: () => showUiKitTimeDialog(
                  context,
                ),
              ),
              SpacingFoundation.verticalSpace16,
              //почему то работает только так отображение поповера, надо подумать
              Builder(
                builder: (c) => OrdinaryButton(
                  text: 'Dialog comment',
                  onPressed: () => showUiKitPopover(c,
                      title: const Text('Premium account'),
                      buttonText: 'see more',
                      description: const Text('Only premium account users can post reactions')),
                ),
              ),
              SpacingFoundation.verticalSpace16,
              OrdinaryButton(
                text: 'Dialog alert',
                onPressed: () => showUiKitAlertDialog(
                  context,
                  AlertDialogData(
                      defaultButtonText: 'text',
                      title: const Text('You sent an invitation to 2 people.'),
                      content: const Text('Invitations can be viewed in private messages')),
                ),
              ),
              SpacingFoundation.verticalSpace16,
              OrdinaryButton(
                text: 'Fullscreen Dialog',
                onPressed: () {
                  showUiKitFullScreenAlertDialog(
                    context,
                    child: (_, textStyle) => UiKitHintDialog(
                      title: 'Fullscreen Dialog',
                      textStyle: context.uiKitTheme?.boldTextTheme.title2,
                      subtitle: 'you get exactly what you need',
                      dismissText: 'OKAY, COOL!',
                      onDismiss: () => Navigator.pop(_),
                      hintTiles: [
                        UiKitIconHintCard(
                          icon: ImageWidget(
                            svgAsset: GraphicsFoundation.instance.svg.map,
                          ),
                          hint: 'your location',
                        ),
                        UiKitIconHintCard(
                          icon: ImageWidget(
                            svgAsset: GraphicsFoundation.instance.svg.dart,
                          ),
                          hint: 'your interests',
                        ),
                        UiKitIconHintCard(
                          icon: ImageWidget(
                            svgAsset: GraphicsFoundation.instance.svg.sunClouds,
                          ),
                          hint: 'weather around',
                        ),
                        UiKitIconHintCard(
                          icon: ImageWidget(
                            svgAsset: GraphicsFoundation.instance.svg.smileMood,
                          ),
                          hint: 'and other 14 scales',
                        ),
                      ],
                    ),
                  );
                },
              ),
              SpacingFoundation.verticalSpace16,
              OrdinaryButton(
                text: 'Donation Bottom Sheet',
                onPressed: () => showUiKitGeneralFullScreenDialog(
                  context,
                  GeneralDialogData(
                    useRootNavigator: false,
                    child: const DonationListView(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DonationListView extends StatelessWidget {
  const DonationListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: EdgeInsetsFoundation.horizontal16),
      children: [
        Text('Ask people', style: context.uiKitTheme?.boldTextTheme.title1),
        SpacingFoundation.verticalSpace16,
        const DonationInfoIndicatorCard(
          number: '1',
          title: 'Help me visit Nusr-Et restaurant',
          sum: 900,
          actualSum: 310,
        ),
        SpacingFoundation.verticalSpace16,
        context.gradientButton(
          data: BaseUiKitButtonData(
            text: 'Ask for donations',
            onPressed: () {},
          ),
        ),
        SpacingFoundation.verticalSpace16,
        Text('Support people around you', style: context.uiKitTheme?.boldTextTheme.title1),
        SpacingFoundation.verticalSpace16,
        UiKitCardWrapper(
          child: Column(
            children: [
              Stack(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints.expand(
                      height: 170.h,
                    ),
                    child: ImageWidget(
                      rasterAsset: GraphicsFoundation.instance.png.mapMock,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned.fill(
                    child: Center(
                      child: UiKitBlurWrapper(
                        border: const Border.fromBorderSide(BorderSide.none),
                        child: Text(
                          'Tap to see more',
                          style: context.uiKitTheme?.boldTextTheme.caption1Bold.copyWith(
                            color: ColorsFoundation.darkNeutral100,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SpacingFoundation.verticalSpace16,
              Text(
                'Top 3 donators receive x100 points',
                textAlign: TextAlign.center,
                style: context.uiKitTheme?.boldTextTheme.subHeadline,
              ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16),
              SpacingFoundation.verticalSpace16,
              UiKitCustomTabBar(
                tabs: [
                  UiKitCustomTab(
                    title: 'DAY',
                    height: 24.h,
                    isAutoSizeEnabled: true,
                  ),
                  UiKitCustomTab(
                    title: 'MONTH',
                    height: 24.h,
                    isAutoSizeEnabled: true,
                  ),
                  UiKitCustomTab(
                    title: 'YEAR',
                    height: 24.h,
                    isAutoSizeEnabled: true,
                  ),
                ],
                onTappedTab: (int value) {},
              ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16),
              SpacingFoundation.verticalSpace16,
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: 7,
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  if (index < 3) {
                    return DonationCard(
                      number: index + 1,
                      title: '@misswow2022',
                      subtitle: 'Natalie White',
                      points: '364 000',
                      sum: '3 640',
                      isStarEnabled: true,
                    );
                  }
                  return DonationCard(
                    number: index + 1,
                    title: '@misswow2022',
                    subtitle: 'Megan Fox',
                    sum: '3 640',
                  );
                },
                separatorBuilder: (_, __) => SpacingFoundation.verticalSpace24,
              ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16),
              SpacingFoundation.verticalSpace16,
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 40.h),
                child: OrdinaryButtonWithIcon(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.chevron_down),
                  text: 'NEXT 7 PEOPLE',
                ),
              ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16),
              SpacingFoundation.verticalSpace16,
            ],
          ),
        ),
        SpacingFoundation.verticalSpace24,
      ],
    );
  }
}

class DonationCard extends StatelessWidget {
  const DonationCard({
    super.key,
    required this.number,
    required this.title,
    required this.subtitle,
    required this.sum,
    this.points,
    this.isStarEnabled,
  });

  final int number;
  final String title;
  final String subtitle;
  final String sum;
  final String? points;
  final bool? isStarEnabled;

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return Column(
      children: [
        Row(
          children: [
            Text(
              '#$number',
              style: boldTextTheme?.subHeadline.copyWith(color: Colors.white),
            ),
            SpacingFoundation.horizontalSpace12,
            ClipRRect(
              borderRadius: BorderRadiusFoundation.max,
              child: ImageWidget(
                rasterAsset: GraphicsFoundation.instance.png.profileAvatar,
                height: 40.h,
              ),
            ),
            SpacingFoundation.horizontalSpace8,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: boldTextTheme?.caption1Bold.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    SpacingFoundation.horizontalSpace4,
                    if (isStarEnabled != null && isStarEnabled!)
                      ImageWidget(
                        rasterAsset: GraphicsFoundation.instance.png.star2,
                        height: 16.h,
                        fit: BoxFit.cover,
                      ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 90.w,
                      child: Text(
                        subtitle,
                        style: boldTextTheme?.caption1Medium.copyWith(
                          color: ColorsFoundation.darkNeutral900,
                        ),
                      ),
                    ),
                    SpacingFoundation.horizontalSpace12,
                    Text(
                      '$sum \$',
                      style: boldTextTheme?.body.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        SpacingFoundation.verticalSpace12,
        if (points != null)
          ConstrainedBox(
            constraints: BoxConstraints.expand(height: 28.h),
            child: GradientableWidget(
              gradient: GradientFoundation.donationLinearGradient,
              child: SmallGradientButton(
                text: '+ $points points',
              ),
            ),
          ),
      ],
    );
  }
}
