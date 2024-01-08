import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> with SingleTickerProviderStateMixin {
  final ScrollController scrollController = ScrollController();
  final animDuration = const Duration(milliseconds: 250);

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            context.notificationPopUp(
              primaryActionWidget: context.smallButton(
                data: BaseUiKitButtonData(
                  text: 'Ok',
                  onPressed: () {},
                ),
              ),
              dismissActionWidget: context.smallOutlinedButton(
                data: BaseUiKitButtonData(text: 'Cancel', onPressed: () {}),
                color: Colors.white.withOpacity(0.5),
              ),
              requiredData: NotificationPopupRequiredData(
                titleString: 'Yoga today at Palm Jumeirah. You go?',
                icon: const ImageWidget(
                  iconData: ShuffleUiKitIcons.heartinhandemoji,
                ),
                hasShadow: true,
              ),
            ),
            SpacingFoundation.verticalSpace16,
            context.notificationPopUp(
              primaryActionWidget: context.smallButton(
                data: BaseUiKitButtonData(text: 'Ok', onPressed: () {}),
              ),
              dismissActionWidget: context.smallOutlinedButton(
                data: BaseUiKitButtonData(text: 'Cancel', onPressed: () {}),
                color: Colors.white.withOpacity(0.5),
              ),
              requiredData: NotificationPopupRequiredData(
                titleString: 'Yoga today at Palm Jumeirah. You go?',
                icon: const ImageWidget(
                  iconData: ShuffleUiKitIcons.heartinhandemoji,
                ),
              ),
            ),
            SpacingFoundation.verticalSpace16,
            context.notificationPopUp(
              primaryActionWidget: context.smallButton(
                data: BaseUiKitButtonData(text: 'Ok', onPressed: () {}),
              ),
              secondaryActionWidget: context.smallOutlinedButton(
                data: BaseUiKitButtonData(text: 'text', onPressed: () {}),
              ),
              dismissActionWidget: context.smallOutlinedButton(
                data: BaseUiKitButtonData(text: 'Cancel', onPressed: () {}),
                color: Colors.white.withOpacity(0.5),
              ),
              requiredData: NotificationPopupRequiredData(
                titleString: 'Yoga today at Palm Jumeirah. You go?',
                icon: const ImageWidget(
                  iconData: ShuffleUiKitIcons.heartinhandemoji,
                ),
                hasShadow: true,
              ),
            ),
            SpacingFoundation.verticalSpace16,
            context.notificationPopUp(
              primaryActionWidget: context.smallButton(
                data: BaseUiKitButtonData(text: 'Ok', onPressed: () {}),
              ),
              dismissActionWidget: context.smallOutlinedButton(
                data: BaseUiKitButtonData(text: 'Cancel', onPressed: () {}),
                color: Colors.white.withOpacity(0.5),
              ),
              secondaryActionWidget: context.smallOutlinedButton(
                data: BaseUiKitButtonData(text: 'text', onPressed: () {}),
              ),
              requiredData: NotificationPopupRequiredData(
                titleString: 'Yoga today at Palm Jumeirah. You go?',
                icon: const ImageWidget(
                  iconData: ShuffleUiKitIcons.heartinhandemoji,
                ),
              ),
            ),
            // const UiKitMessageCloud(
            //   message: 'Invite list',
            //   subtitle: '150 users',
            // ),
            // SpacingFoundation.verticalSpace24,
            // UiKitLightUpAnimation(
            //   child: context.outlinedButton(
            //     data: BaseUiKitButtonData(
            //       onPressed: () {},
            //       iconInfo: BaseUiKitButtonIconData(
            //         iconData: ShuffleUiKitIcons.searchpeople,
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
