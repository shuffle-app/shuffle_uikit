import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class DialogTestingPage extends StatelessWidget {
  const DialogTestingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SpacingFoundation.verticalSpace16,
                UiKitUserTileWithCheckbox(
                  title: 'Marry Williams',
                  subtitle: 'Any cheerful person can invite me',
                  onCheckboxTap: () {},
                  rating: -10,
                ),
                SpacingFoundation.verticalSpace16,
                SpacingFoundation.verticalSpace16,
                SpacingFoundation.verticalSpace16,
                SpacingFoundation.verticalSpace16,
                SpacingFoundation.verticalSpace16,
                SpacingFoundation.verticalSpace16,
                OrdinaryButton(
                  text: 'Dialog bottom sheet fullscreen',
                  onPressed: () => showUiKitGeneralFullScreenDialog(
                      context,
                      GeneralDialogData(
                          topPadding: 300,
                          useRootNavigator: false,
                          child: Column(
                            children: List.generate(5, (index) => const Placeholder().paddingSymmetric(vertical: 8)),
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
                  text: 'Dialog calendarFromTo picker',
                  onPressed: () => showUiKitCalendarFromToDialog(context, (from, to) {}),
                ),
                SpacingFoundation.verticalSpace16,
                OrdinaryButton(
                  text: 'Dialog time picker',
                  onPressed: () => showUiKitTimeDialog(
                    context,
                  ),
                ),
                SpacingFoundation.verticalSpace16,

                OrdinaryButton(
                  text: 'Dialog timeFromTo picker',
                  onPressed: () => showUiKitTimeFromToDialog(context, (from, to) {}),
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
                context.button(
                  data: BaseUiKitButtonData(
                    text: 'Show modal bottom sheet',
                    onPressed: () => showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          children: List.generate(5, (index) => const Placeholder().paddingSymmetric(vertical: 8)),
                        ),
                      ),
                    ),
                  ),
                ),
                SpacingFoundation.verticalSpace16,
                OrdinaryButton(
                  text: 'show Geolocation alert',
                  onPressed: () => showGeolocationAlert(context, onTap: () {}),
                ),
                SpacingFoundation.verticalSpace16,
                OrdinaryButton(
                  text: 'show Settings alert',
                  onPressed: () => showSettingsAlert(context, onTap: () {}),
                ),
                SpacingFoundation.verticalSpace16,
                OrdinaryButton(
                  text: 'show complaint pop up',
                  onPressed: () => showComplaintPopUp(context),
                ),
                SpacingFoundation.verticalSpace16,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UiKitUserTileWithCheckbox extends StatelessWidget {
  const UiKitUserTileWithCheckbox({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onCheckboxTap,
    required this.rating,
    this.date,
  }) : assert((rating > 0 || rating < 8), 'Rating must be between 7 and 0 points.');

  final String title;
  final String subtitle;
  final int rating;
  final VoidCallback onCheckboxTap;
  final DateTime? date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UiKitCheckbox(isActive: false, onChanged: () {}),
        SpacingFoundation.horizontalSpace12,
        Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 40.h, maxWidth: 40.w),
              child: BorderedUserCircleAvatar(
                imageUrl: GraphicsFoundation.instance.png.profileAvatar.path,
              ),
            ),
            SpacingFoundation.verticalSpace2,
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 4.h, maxWidth: 45.w),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (_, __) => SpacingFoundation.horizontalSpace2,
                itemCount: 7,
                itemBuilder: (BuildContext context, int index) => ClipRRect(
                  borderRadius: BorderRadiusFoundation.max,
                  child: SizedBox(
                    height: 4.h,
                    width: 4.w,
                    child: ColoredBox(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SpacingFoundation.horizontalSpace12,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Marry Williams',
                    style: context.uiKitTheme?.boldTextTheme.caption1Bold,
                  ),
                  Spacer(),
                  Text(
                    'Mar 17',
                    style: context.uiKitTheme?.boldTextTheme.caption1Medium,
                  ),
                ],
              ),
              Text(
                'Any cheerful person can invite me',
                style: context.uiKitTheme?.boldTextTheme.caption1Medium.copyWith(
                  color: context.uiKitTheme?.colorScheme.darkNeutral900,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
