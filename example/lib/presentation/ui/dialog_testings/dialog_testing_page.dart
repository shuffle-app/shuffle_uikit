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
              GeneralPurposeButton(
                text: 'Dialog bottom sheet fullscreen',
                onPressed: () => showUiKitGeneralFullScreenDialog(
                  context,
                  child: Column(
                    children: List.generate(
                        10,
                        (index) =>
                            const Placeholder().paddingSymmetric(vertical: 8)),
                  ),
                ),
              ),
              SpacingFoundation.verticalSpace16,
              GeneralPurposeButton(
                text: 'Dialog calendar picker',
                onPressed: () => showUiKitCalendarDialog(
                  context,
                ),
              ),
              SpacingFoundation.verticalSpace16,
              //почему то работает только так отображение поповера, надо подумать
              Builder(
                builder: (c) => GeneralPurposeButton(
                  text: 'Dialog comment',
                  onPressed: () => showUiKitPopover(c,
                      title: const Text('Premium account'),
                      buttonText: 'see more',
                      description: const Text(
                          'Only premium account users can post reactions')),
                ),
              ),
              SpacingFoundation.verticalSpace16,
              GeneralPurposeButton(
                text: 'Dialog alert',
                onPressed: () => showUiKitAlertDialog(
                  context,
                  buttonText: 'text',
                  title: const Text('You sent an invitation to 2 people.'),
                  content: const Text(
                      'Invitations can be viewed in private messages'),
                ),
              ),
              SpacingFoundation.verticalSpace16,
              GeneralPurposeButton(
                text: 'Fullscreen Dialog',
                onPressed: () {
                  // final textStyle = context.uiKitTheme?.boldTextTheme.title2;
                  showUiKitFullScreenAlertDialog(
                    context,
                    child: (context, textStyle) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Fullscreen Dialog',
                          style: textStyle,
                        ),
                        SpacingFoundation.verticalSpace8,
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: UiKitIconHintCard(
                                icon: ImageWidget(
                                  rasterAsset:
                                      GraphicsFoundation.instance.png.location,
                                ),
                                hint: 'your location',
                              ),
                            ),
                            SpacingFoundation.horizontalSpace16,
                            Expanded(
                              child: UiKitIconHintCard(
                                icon: ImageWidget(
                                  rasterAsset:
                                      GraphicsFoundation.instance.png.target,
                                ),
                                hint: 'your interests',
                              ),
                            ),
                          ],
                        ),
                        SpacingFoundation.verticalSpace8,
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: UiKitIconHintCard(
                                icon: ImageWidget(
                                  rasterAsset:
                                      GraphicsFoundation.instance.png.cloudy,
                                ),
                                hint: 'weather around',
                              ),
                            ),
                            SpacingFoundation.horizontalSpace16,
                            Expanded(
                              child: UiKitIconHintCard(
                                icon: ImageWidget(
                                  rasterAsset:
                                      GraphicsFoundation.instance.png.mood,
                                ),
                                hint: 'and other 14 scales',
                              ),
                            ),
                          ],
                        ),
                        SpacingFoundation.verticalSpace8,
                        Text(
                          'you get exactly what you need',
                          style: textStyle,
                        ),
                        SpacingFoundation.verticalSpace8,
                        context.button(
                          text: 'OKAY, COOL!',
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
