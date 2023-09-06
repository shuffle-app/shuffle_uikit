import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

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
                    child: ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: EdgeInsetsFoundation.horizontal16),
                      children: [
                        Text('Ask people', style: context.uiKitTheme?.boldTextTheme.title1),
                        SpacingFoundation.verticalSpace16,
                        const DonationInfoIndicatorWidget(
                          number: '1',
                          title: 'Help me visit Nusr-Et restaurant',
                          sum: 900,
                          actualSum: 310,
                        ),
                      ],
                    ),
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

class DonationInfoIndicatorWidget extends StatelessWidget {
  const DonationInfoIndicatorWidget({
    super.key,
    required this.number,
    required this.title,
    required this.sum,
    required this.actualSum,
    this.indicatorWidth,
  });

  final String number;
  final String title;
  final double sum;
  final double actualSum;
  final double? indicatorWidth;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    return UiKitCardWrapper(
      child: Column(
        children: [
          Row(
            children: [
              Text('#$number', style: theme?.boldTextTheme.subHeadline),
              SpacingFoundation.horizontalSpace12,
              Flexible(
                child: Text(
                  title,
                  style: theme?.boldTextTheme.subHeadline,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SpacingFoundation.verticalSpace16,
          ProgressDonationIndicator(actualSum: actualSum, sum: sum, width: indicatorWidth),
        ],
      ).paddingAll(EdgeInsetsFoundation.all16),
    );
  }
}

class ProgressDonationIndicator extends StatefulWidget {
  const ProgressDonationIndicator({
    super.key,
    required this.actualSum,
    required this.sum,
    this.width,
  });

  final double actualSum;
  final double sum;
  final double? width;

  @override
  State<ProgressDonationIndicator> createState() => _ProgressDonationIndicatorState();
}

class _ProgressDonationIndicatorState extends State<ProgressDonationIndicator> {
  late double _progressPosition;
  late final double _progressValue;
  late final double _finishPosition;

  @override
  void initState() {
    super.initState();
    _setPercentage();
    _finishPosition = widget.width ?? 256.w;
    _setPositionWithPercentage();
  }

  void _setPercentage() {
    _progressValue = ((widget.actualSum / widget.sum) * 100);
  }

  void _setPositionWithPercentage() {
    _progressPosition = _finishPosition * (_progressValue / 100);
  }

  double _getCurrentPosition(double currentPosition) {
    if (currentPosition > _finishPosition - 4.w) {
      return _finishPosition - 4.w;
    }
    return currentPosition;
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    return ClipRRect(
      borderRadius: BorderRadiusFoundation.all40,
      child: Stack(
        children: [
          ColoredBox(
            color: Colors.white,
            child: SizedBox(
              height: 32.h,
              width: 256.w,
            ),
          ),
          Positioned(
            left: 2.h,
            top: 2.h,
            child: AnimatedContainer(
              curve: Curves.ease,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusFoundation.all40,
                gradient: GradientFoundation.touchIdLinearGradient,
                color: Colors.white,
              ),
              duration: const Duration(milliseconds: 300),
              height: 28.h,
              width: _getCurrentPosition(_progressPosition),
            ),
          ),
          Positioned.fill(
            child: Center(
              child: Text(
                'raised ${widget.actualSum.toStringAsFixed(0)}/${widget.sum.toStringAsFixed(0)} \$',
                style: theme?.boldTextTheme.caption1Bold.copyWith(color: Colors.black),
              ),
            ),
          ),
          Positioned(
            right: 1.w,
            top: 1.w,
            child: context.badgeButtonNoValue(
              data: BaseUiKitButtonData(
                onPressed: () => setState(() => _progressPosition += 25.w),
                icon: const Icon(
                  CupertinoIcons.chevron_right_circle,
                  size: 40,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
